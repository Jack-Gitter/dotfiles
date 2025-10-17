return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'sindrets/diffview.nvim',
    },
    opts = {
        integrations = {
            diffview = true
        },
        kind = 'floating',
        auto_close = true
    },
    config = function(_, opts)
        local neogit = require('neogit')
        neogit.setup(opts)
        vim.keymap.set('n', '<leader>git', function() neogit.open() end)
    end

}
