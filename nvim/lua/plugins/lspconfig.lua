return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "williamboman/mason.nvim",
        },
        {
            "hrsh7th/cmp-nvim-lsp",
        },
        {
            "williamboman/mason-lspconfig.nvim"
        },
        {
            "jay-babu/mason-nvim-dap.nvim"
        },
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "gopls", "pyright", "eslint" } })
        require("mason-nvim-dap").setup({ ensure_installed = { "js", "delve" } })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()


        local on_attach = function(client, bufnr)
            local ft = vim.bo.filetype

            if client.supports_method("textDocument/hover") then
                vim.keymap.set("n", "<leader>ho", vim.lsp.buf.hover, { buffer = true })
                vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                    border = "single"
                })
            end

            if client.supports_method("textDocument/diagnostics") then
                vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float)
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
                vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#3dabcc", fg = "white" })
                vim.keymap.set("i", "<c-;>", vim.lsp.buf.signature_help)
                vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
                    border = "rounded",
                })
            end
        end

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = "Disable",
                        ignoreDir = { "~/.local/" },
                    },
                    diagnostics = {
                        libraryFiles = "Disable",
                        globals = { 'vim' }
                    }
                }
            }
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
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

        lspconfig.ts_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                completions = {
                    completeFunctionCalls = true
                }
            },
        })

        lspconfig.eslint.setup({
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
}
