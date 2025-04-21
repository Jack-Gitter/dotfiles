return {
    'barrett-ruth/live-server.nvim',
    build = 'npm i -g live-server',
    opts = {},
    ft = { 'html' },
    config = function(_, opts)
        require('live-server').setup(opts)
        vim.keymap.set('n', '<leader>ls', function() vim.cmd('LiveServerStart') end)
        vim.keymap.set('n', '<leader>xls', function() vim.cmd('LiveServerStart') end)
    end
}
