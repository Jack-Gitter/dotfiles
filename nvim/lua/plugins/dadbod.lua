return {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
    },
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.keymap.set('n', '<leader>db', function() vim.cmd('DBUI') end)
        vim.keymap.set('n', '<leader>adb', function() vim.cmd('DBUIAddConnection') end)
    end,
    keys = { '<leader>db', '<leader>adb' }
}
