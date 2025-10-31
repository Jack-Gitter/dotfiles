vim.pack.add({
	{ src = 'https://github.com/everviolet/nvim', name = 'evergarden' },
	{ src = 'https://github.com/stevearc/conform.nvim', name = 'conform.nvim'},
	{ src = 'https://github.com/sindrets/diffview.nvim', name = 'diffview.nvim'},
	{ src = 'https://github.com/lewis6991/gitsigns.nvim', name = 'gitsigns.nvim'},
	{ src = 'https://github.com/mason-org/mason.nvim', name = 'mason.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim', name = 'oil.nvim' },
	{ src = 'https://github.com/alexghergh/nvim-tmux-navigation', name = 'nvim-tmux-navigation' },
	{ src = 'https://github.com/nvim-mini/mini.icons', name = 'mini-icons', version = 'v0.16.0',  },
	{ src = 'https://github.com/folke/snacks.nvim', name = 'snacks.nvim' },
	{
		src = 'https://github.com/saghen/blink.cmp',
		name = 'blink',
		version = 'v1.7.0',
	}
})

require('plugins.oil')
require('plugins.colorscheme')
require('plugins.conform')
require('plugins.diffview')
require('plugins.gitsigns')
require('plugins.mason')
require('plugins.blink_cmp')
require('plugins.snacks_picker')
require('plugins.tmux_nav')
