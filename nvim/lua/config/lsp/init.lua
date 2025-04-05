require("config.lsp.eslint")
require("config.lsp.ts_ls")
require("config.lsp.gopls")
require("config.lsp.pyright")
require("config.lsp.lua_ls")

vim.lsp.enable({ "ts_ls", "eslint", "lua_ls", "pyright", "gopls" })
