local oil = require('oil')
oil.setup()
vim.keymap.set('n', '<leader>o', function() vim.cmd('Oil') end)
