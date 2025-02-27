return {
    "Mofiqul/dracula.nvim",
    opts = {
        colors = {
            visual = "#434b8f"
        },
    },
    config = function(_, opts)
        local dracula = require("dracula")
        dracula.setup(opts)
        vim.cmd("colorscheme dracula-soft")
    end,
    lazy = false
}
-- return { "navarasu/onedark.nvim", opts = {}, config = function() require("onedark").load() end, lazy = false }
-- return { "rose-pine/neovim", name = "rose-pine", config = function() vim.cmd("colorscheme rose-pine") end, lazy = false }
-- return { 'ribru17/bamboo.nvim', config = function() require('bamboo').setup({}) require('bamboo').load() end, lazy = false }
-- return { "ellisonleao/gruvbox.nvim", config = function() vim.cmd("colorscheme gruvbox") end, opts = {}, lazy = false }
-- return { "catppuccin/nvim", name = "catppuccin", config = function() vim.cmd("colorscheme catppuccin") end, lazy = false }
-- return {}
