local diffview = require('diffview')
diffview.setup({
	view = {
		merge_tool = {
			layout = 'diff3_mixed',
			disable_diagnostics = true,
		},
	},
})
vim.keymap.set('n', '<leader>diff', function() vim.cmd('DiffviewOpen') end)
vim.keymap.set('n', '<c-c>', function() vim.cmd('DiffviewClose') end)
