return {
    'lewis6991/gitsigns.nvim',
    opts = {
        preview_config = {
            col = 1,
            relative = 'cursor',
            row = 0,
            style = 'minimal',
            border = 'single'
        }
    },
    config = function(_, opts)
        local gitsigns = require('gitsigns')
        gitsigns.setup(opts)
        vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
        vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
        vim.keymap.set('n', '<leader>bl', gitsigns.blame)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'gitsigns-blame',
            callback = function()
                vim.keymap.set('n', '<c-c>', ':q<cr>', { buffer = true })
            end
        })
    end,
    cond = function()
        return vim.fn.isdirectory('.git') == 1 or
            vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true\n'
    end,
}
