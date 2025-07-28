vim.g.mapleader = ' '
vim.keymap.set('n', '<space>', '<nop>', { silent = true })
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('n', '<c-p>', '<c-^>')
vim.keymap.set('n', '<c-s>', function() vim.cmd('split') end)
vim.keymap.set('n', '<c-v>', function() vim.cmd('vs') end)
vim.keymap.set('n', 'U', '<c-r>')
vim.keymap.set('n', '<leader>cn', function() vim.cmd('cnext') end)
vim.keymap.set('n', '<leader>cp', function() vim.cmd('cprev') end)
vim.keymap.set('n', '<c-x>', function()
    local success, _ = pcall(vim.cmd, 'wq')
    if not success then
        vim.cmd('q!')
    end
end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>hl', ':nohl<cr>')

vim.keymap.set('n', '<leader>L', function() vim.cmd('vertical resize -15') end)
vim.keymap.set('n', '<leader>J', function() vim.cmd('vertical resize +15') end)
