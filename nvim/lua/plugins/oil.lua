vim.pack.add({
	{ src = 'https://github.com/stevearc/oil.nvim' }
})

local oil = require('oil')
oil.setup()
vim.keymap.set('n', '<leader>o', function() vim.cmd('Oil') end)
