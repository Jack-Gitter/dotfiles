vim.pack.add({
	{ src = 'https://github.com/everviolet/nvim' }
})

local evergarden = require('evergarden')

evergarden.setup({
	theme = {
		variant = 'spring',
		accent = 'green',
	},
	editor = {
		transparent_background = false,
		sign = { color = 'none' },
		float = {
			color = 'mantle',
			solid_border = false,
		},
		completion = {
			color = 'surface0',
		},
	},
})

vim.cmd('colorscheme evergarden')
