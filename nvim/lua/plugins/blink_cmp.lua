vim.pack.add({
	{
		src = 'https://github.com/saghen/blink.cmp',
		version = 'v1.7.0',
	}
})

local blink = require('blink-cmp')

blink.setup({
	keymap = { preset = 'default' },
	appearance = {
		nerd_font_variant = 'mono'
	},
	completion = {
		trigger = {
			show_on_keyword = false,
			show_on_trigger_character = true
		},
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
vim.keymap.set('i', '<C-x><C-o>', function() blink.show() end)
vim.keymap.set('i', '<C-k>', function() blink.show_documentation() end)
