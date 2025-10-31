local diffview = require('diffview')
diffview.setup()
vim.keymap.set('n', '<leader>diff', function() vim.cmd('DiffviewOpen') end)
vim.keymap.set('n', '<c-c>', function() vim.cmd('DiffviewClose') end)
