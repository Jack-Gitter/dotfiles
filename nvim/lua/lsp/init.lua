require("lsp.eslint")
require("lsp.ts_ls")
require("lsp.gopls")
require("lsp.pyright")
require("lsp.lua_ls")

vim.lsp.enable({ "ts_ls", "eslint", "lua_ls", "pyright", "gopls" })
