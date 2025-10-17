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
        kind = 'floating'
    },
    config = function(_, opts)
        local neogit = require('neogit')
        neogit.setup(opts)
        vim.keymap.set('n', '<leader>git', function() neogit.open() end)
        vim.api.nvim_create_autocmd('User', {
            pattern = 'NeogitBranchCreated',
            callback = function()
                vim.schedule(function()
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        local buf = vim.api.nvim_win_get_buf(win)
                        local ft = vim.api.nvim_get_option_value('filetype', { buf = buf })
                        if ft == 'neogitStatus' then
                            vim.api.nvim_win_close(win, true)
                        end
                    end
                end)
            end,
        })
    end

}
