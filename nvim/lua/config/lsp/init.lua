require('config.lsp.ts_ls')
require('config.lsp.gopls')
require('config.lsp.pyright')
require('config.lsp.lua_ls')
require('config.lsp.kulala_ls')

vim.lsp.enable({ 'ts_ls', 'lua_ls', 'pyright', 'gopls', 'kulala_ls' })
