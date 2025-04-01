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
        {
            "artemave/workspace-diagnostics.nvim"
        }
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "ts_ls", "gopls", "pyright", "eslint", "clangd" } })
        require("mason-nvim-dap").setup({ ensure_installed = { "js", "delve" } })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "single",
            }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = "single"
            }
        )

        vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = "#3dabcc", fg = "white" })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local on_attach = function(client, bufnr)
            local ft = vim.bo.filetype

            if client.supports_method("textDocument/hover") then
                vim.keymap.set("n", "<leader>ho", vim.lsp.buf.hover, { buffer = true })
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
                vim.keymap.set("i", "<c-;>", vim.lsp.buf.signature_help)
            end

            if client.supports_method("textDocument/rename") then
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename())
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


        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
    event = { "BufReadPost", "BufNewFile" },
}
