return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
        },
        {
            'saghen/blink.cmp'
        },
        {
            "williamboman/mason-lspconfig.nvim"
        },
        {
            "jay-babu/mason-nvim-dap.nvim"
        },
        {
            "artemave/workspace-diagnostics.nvim"
        }
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "gopls", "pyright", "eslint", "clangd" } })
        require("mason-nvim-dap").setup({ ensure_installed = { "js", "delve" } })

        vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = '#5a4480', fg = 'white' })

        local lspconfig = require("lspconfig")
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        local on_attach = function(client, bufnr)
            local ft = vim.bo.filetype

            if client.supports_method("textDocument/hover") then
                vim.keymap.set("n", "<leader>ho", function() vim.lsp.buf.hover({ border = "single" }) end,
                    { buffer = true })
            end

            if client.supports_method("textDocument/diagnostics") then
                vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float)
            end

            if ft == "javascript" or ft == "typescript" then
                require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
            end


            if client.supports_method("textDocument/formatting") and ft ~= "python" and ft ~= "javascript" and ft ~= "typescript" then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                        if vim.bo.filetype == "lua" then
                            vim.diagnostic.enable()
                        end
                    end
                })
            end

            if client.supports_method("textDocument/signatureHelp") then
                vim.keymap.set("i", "<c-;>", function() vim.lsp.buf.signature_help({ border = "single", title = "" }) end)
            end


            if client.supports_method("textDocument/rename") then
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
            end
        end


        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    symbolScope = "workspace",
                }
            },
        })

        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach
        })


        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
}
