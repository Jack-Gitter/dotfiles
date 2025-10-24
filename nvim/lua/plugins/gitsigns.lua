return {
	'lewis6991/gitsigns.nvim',
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require('gitsigns')
			vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { buffer = bufnr })
			vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { buffer = bufnr })
			vim.keymap.set('n', '<leader>bl', gitsigns.blame, { buffer = bufnr })
		end
	}
}
