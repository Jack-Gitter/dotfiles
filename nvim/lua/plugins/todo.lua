return {
    'Jack-Gitter/todo.nvim',
    dependencies = {
        'MeanderingProgrammer/render-markdown.nvim',
    },
    opts = {
        fullpath = vim.env.HOME .. '/.config/todo.md',
    },
    config = function(_, opts)
        local todo = require('todo')
        todo.setup(opts)
    end,
    keys = { '<leader>td' }
}
