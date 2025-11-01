vim.api.nvim_create_autocmd('FileType', {
	desc = 'Automatically Split help Buffers to the right',
	pattern = 'help',
	command = 'wincmd L',
})
