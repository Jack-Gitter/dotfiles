return {
    'Jack-Gitter/todo.nvim',
    dependencies = {
        {
            'MeanderingProgrammer/render-markdown.nvim',
            dependencies = { 'nvim-treesitter/nvim-treesitter' },
            config = function()
                require('render-markdown').setup({
                    completions = { lsp = { enabled = true } },
                })
            end
        }
    },
    opts = {
        fullpath = vim.env.HOME .. '/.config/todo.md',
    },
    config = function(_, opts)
        local todo = require('todo')
        todo.setup(opts)
    end
}
