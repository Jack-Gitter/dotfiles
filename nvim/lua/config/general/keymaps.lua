vim.g.mapleader = ' '
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'kj', '<esc>')
vim.keymap.set('n', '<c-p>', '<c-^>')

vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.keymap.set('n', '<leader>cn', function() pcall(vim.cmd.cnext) end, { silent = true })
vim.keymap.set('n', '<leader>cp', function() pcall(vim.cmd.cprev) end, { silent = true })
vim.keymap.set('n', '<leader>cq', function() vim.cmd('cclose') end)
