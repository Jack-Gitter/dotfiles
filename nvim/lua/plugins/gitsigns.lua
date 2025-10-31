vim.pack.add({
	{ src = 'https://github.com/lewis6991/gitsigns.nvim' }
})

local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>bl', gitsigns.blame)
