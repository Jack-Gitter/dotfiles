return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'echasnovski/mini.icons', opts = {} },
    },
    opts = {
        theme = 'dracula-nvim',
        sections = {
            lualine_c = { 'filename' },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' }
        }
    },
    event = 'BufEnter',
}
