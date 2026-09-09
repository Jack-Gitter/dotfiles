vim.pack.add({
	-- { src = 'https://github.com/rose-pine/neovim',                name = 'rosepine' },
	-- { src = 'https://github.com/sainnhe/gruvbox-material',        name = 'gruvbox' },
	-- { src = 'https://github.com/nikolvs/vim-sunbather',           name = 'sunbather.nvim' },
	{ src = 'https://github.com/srcery-colors/srcery-vim',        name = 'srcery' },
	{ src = 'https://github.com/tpope/vim-vividchalk',            name = 'vivid' },
	{ src = 'https://github.com/stevearc/conform.nvim',           name = 'conform.nvim' },
	{ src = 'https://github.com/lewis6991/gitsigns.nvim',         name = 'gitsigns.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim',            name = 'mason.nvim' },
	{ src = 'https://github.com/stevearc/oil.nvim',               name = 'oil.nvim' },
	{ src = 'https://github.com/alexghergh/nvim-tmux-navigation', name = 'nvim-tmux-navigation' },
	{ src = 'https://github.com/nvim-mini/mini.icons',            name = 'mini-icons',          version = 'v0.16.0', },
	{ src = 'https://github.com/folke/snacks.nvim',               name = 'snacks.nvim' },

	{
		src = 'https://github.com/saghen/blink.cmp',
		name = 'blink',
		version = 'v1.7.0',
	},
	{
		src = 'https://www.github.com/olimorris/codecompanion.nvim',
		name = 'codecomanion.nvim',
		version = vim.version.range('^19.0.0')
	},
	{
		src = 'https://www.github.com/nvim-lua/plenary.nvim', name = 'plenary.nvim'
	}
})

require('plugins.oil')
require('plugins.colorscheme')
require('plugins.conform')
require('plugins.gitsigns')
require('plugins.mason')
require('plugins.blink_cmp')
require('plugins.snacks_picker')
require('plugins.tmux_nav')
require('plugins.codecompanion')
