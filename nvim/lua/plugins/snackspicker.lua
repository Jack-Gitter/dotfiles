return {
    'folke/snacks.nvim',
    opts = {
        picker = {
            win = {
                input = {
                    keys = {
                        ['<leader>hh'] = { 'toggle_hidden', mode = { 'n' } },
                        ['<leader>ig'] = { 'toggle_ignored', mode = { 'n' } },
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

        local open_in_split = function(func)
            vim.cmd('vsplit')
            func()
        end

        vim.keymap.set('n', '<leader>ff', function() snacks.picker.files({ cwd = ws() }) end)
        vim.keymap.set('n', '<leader>gr', function() snacks.picker.grep({ cwd = ws() }) end)
        vim.keymap.set('n', '<leader>fr', snacks.picker.lsp_references)
        vim.keymap.set('n', '<leader>gi', snacks.picker.lsp_implementations)
        vim.keymap.set('n', '<leader>gd', snacks.picker.lsp_definitions)
        vim.keymap.set('n', '<leader>ws', snacks.picker.lsp_workspace_symbols)
        vim.keymap.set('n', '<leader>wd', snacks.picker.diagnostics)
        vim.keymap.set('n', '<leader>qf', function()
            local pickers = Snacks.picker.get()
            local picker = pickers and pickers[1]
            if picker then
                snacks.picker.actions.qflist_all(picker)
            end
        end)
        vim.keymap.set('n', '<leader>gvd', function() open_in_split(snacks.picker.lsp_definitions) end)
    end,
}
