return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	opts = {
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
		fuzzy = { implementation = 'prefer_rust_with_warning' }
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		local blink = require('blink-cmp')
		blink.setup(opts)
		vim.keymap.set('i', '<C-x><C-o>', function() blink.show() end)
		vim.keymap.set('i', '<C-x><C-o>', function() blink.show() end)
		vim.keymap.set('i', '<C-k>', function() blink.show_documentation() end)
	end
}
