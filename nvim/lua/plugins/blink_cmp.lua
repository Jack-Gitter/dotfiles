local blink = require('blink-cmp')

blink.setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono'
	},
	completion = {
		documentation = { auto_show = false }
	},
	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
	fuzzy = {
		implementation = 'prefer_rust_with_warning',
	}
})

vim.keymap.set('i', '<C-x><C-o>', function() blink.show() end)
vim.keymap.set('i', '<C-k>', function() blink.show_documentation() end)
vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { link = 'PMenuShadow' })
vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { link = 'PMenuMatch' })
