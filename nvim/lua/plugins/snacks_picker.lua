vim.pack.add({
	{ src = 'https://github.com/folke/snacks.nvim' }
})

local snacks = require('snacks')
snacks.setup()

local ws = function()
	local folders = vim.lsp.buf.list_workspace_folders()
	if next(folders) ~= nil then
		return folders[1]
	else
		return vim.fn.getcwd()
	end
end

local qf = function()
	local pickers = Snacks.picker.get()
	local picker = pickers and pickers[1]
	if picker then
		snacks.picker.actions.qflist_all(picker)
	end
end

vim.keymap.set('n', '<leader>ff', function() snacks.picker.files({ cwd = ws() }) end)
vim.keymap.set('n', '<leader>gr', function() snacks.picker.grep({ cwd = ws() }) end)
vim.keymap.set('n', '<leader>h', snacks.picker.help)
vim.keymap.set('n', '<leader>qf', qf)
