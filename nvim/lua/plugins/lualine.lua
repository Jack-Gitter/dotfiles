return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        sections = {
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' }
        }
    },
    event = "BufEnter",
}
