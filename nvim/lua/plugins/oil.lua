return {
	'stevearc/oil.nvim',
	opts = {},
	config = function(_, opts)
		local oil = require('oil')
		oil.setup(opts)
		vim.keymap.set('n', '<leader>o', function() vim.cmd('Oil') end)
	end
}
