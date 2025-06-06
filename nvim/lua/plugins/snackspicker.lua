return {
    'folke/snacks.nvim',
    opts = {
        picker = {
            win = {
                input = {
                    keys = {
                        ['<leader>hh'] = { 'toggle_hidden', mode = { 'n' } },
                    }
                }
            }
        }
    },
    config = function(_, opts)
        local snacks = require('snacks')
        snacks.setup(opts)

        local ws = function()
            local folders = vim.lsp.buf.list_workspace_folders()
            if next(folders) ~= nil then
                return folders[1]
            else
                return vim.fn.getcwd()
            end
        end
        vim.keymap.set('n', '<leader>ff', function() snacks.picker.files({ cwd = ws() }) end)
        vim.keymap.set('n', '<leader>gr', function() snacks.picker.grep({ cwd = ws() }) end)
        vim.keymap.set('n', '<leader>fr', snacks.picker.lsp_references)
        vim.keymap.set('n', '<leader>gi', snacks.picker.lsp_implementations)
        vim.keymap.set('n', '<leader>gd', snacks.picker.lsp_definitions)
        vim.keymap.set('n', '<leader>ws', snacks.picker.lsp_workspace_symbols)
        vim.keymap.set('n', '<leader>wd', snacks.picker.diagnostics)
        vim.keymap.set('n', '<leader>qf', function() snacks.picker.actions.qflist_all(Snacks.picker.get()[1]) end)
    end,
}
