return {
	'saghen/blink.cmp',
	version = '1.*',
	opts = {
		signature = {
			enabled = true,
			trigger = {
				enabled = false,
				show_on_trigger_character = false,
				show_on_insert_on_trigger_character = false,
			},
		},
		keymap = {
			preset = 'default',
			['<c-d>'] = { 'show_documentation', 'hide_documentation', 'fallback' },
			['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
		},
		appearance = {
			nerd_font_variant = 'mono'
		},
		completion = {
			documentation = {
				auto_show = false
			},
			menu = {
				auto_show = false
			},
		},
		sources = {
			default = { 'lsp', 'path', 'buffer' },
		},
		fuzzy = { implementation = 'prefer_rust_with_warning' }
	},
	opts_extend = { 'sources.default' },
	config = function(_, opts)
		local blink = require('blink.cmp')
		blink.setup(opts)
		vim.api.nvim_set_hl(0, 'BlinkCmpMenuBorder', { fg = '#5c7e9e' })
		vim.api.nvim_set_hl(0, 'BlinkCmpMenuSelection', { fg = '#7aa2f7' })
		vim.keymap.set('i', '<C-x><C-o>', function() require('blink.cmp').show() end);
	end
}
