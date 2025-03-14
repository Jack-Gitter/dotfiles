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
    opts = {}
}
