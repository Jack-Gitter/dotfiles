return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        theme = "dracula-nvim",
        sections = {
            lualine_c = { 'filename' },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' }
        }
    },
    event = "BufEnter",
}
