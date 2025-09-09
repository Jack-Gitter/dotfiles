return {
    'stevearc/oil.nvim',
    dependencies = {
        {
            'mini.icons',
        }
    },
    opts = {
        keymaps = {
            ['<esc>'] = { 'actions.close', mode = 'n' },
            ['<leader>hh'] = { 'actions.toggle_hidden', mode = 'n' }
        },
    },
    config = function(_, opts)
        require('oil').setup(opts)
        vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>')
    end,
    keys = { '<leader>o' }
}
