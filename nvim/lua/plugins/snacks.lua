return {
	'folke/snacks.nvim',
	opts = {},
	config = function(_, opts)
		local snacks = require('snacks')
		snacks.setup(opts)

		local ws = function()
			local folders = vim.lsp.buf.list_workspace_folders()
			if next(folders) ~= nil then
				return folders[1]
			else
				return vim.fn.getcwd()
			end
		end

		vim.keymap.set('n', '<leader>ff', function() snacks.picker.files({ cwd = ws() }) end)
		vim.keymap.set('n', '<leader>gr', function() snacks.picker.grep({ cwd = ws() }) end)
		vim.keymap.set('n', '<leader>fr', snacks.picker.lsp_references)
		vim.keymap.set('n', '<leader>gd', snacks.picker.lsp_definitions)
		vim.keymap.set('n', '<leader>wd', snacks.picker.diagnostics)
		vim.keymap.set('n', '<leader>qf',
			function()
				local pickers = Snacks.picker.get()
				local picker = pickers and pickers[1]
				if picker then
					snacks.picker.actions.qflist_all(picker)
				end
			end
		)
	end
}
