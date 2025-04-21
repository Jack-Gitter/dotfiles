return {
    'barrett-ruth/live-server.nvim',
    build = 'npm i -g live-server',
    opts = {},
    ft = { 'html' },
    config = function(_, opts)
        require('live-server').setup(opts)
        vim.keymap.set('n', '<leader>ls', function() vim.cmd('LiveServerToggle') end)
    end
}
