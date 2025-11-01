vim.opt.runtimepath:append(vim.fn.stdpath('config') .. '/' .. 'lsp')

require('config')
require('plugins')
require('lsp')
