return {
    'sindrets/diffview.nvim',
    config = function()
        require('diffview').setup({
            view = {
                default = {
                    layout = 'diff2_horizontal',
                    disable_diagnostics = false,
                    winbar_info = false,
                },
                merge_tool = {
                    layout = 'diff3_mixed',
                    disable_diagnostics = true,
                    winbar_info = true,
                },
            },
            keymaps = {
                view = {
                    { 'n', 'q', function() vim.cmd('DiffviewClose') end, { desc = 'Close diffview' } },
                },
                file_panel = {
                    { 'n', 'q', function() vim.cmd('DiffviewClose') end, { desc = 'Close diffview' } },
                },
                file_history_panel = {
                    { 'n', 'q', function() vim.cmd('DiffviewClose') end, { desc = 'Close diffview' } },
                },
            },
        })
    end
}
