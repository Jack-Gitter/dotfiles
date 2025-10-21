return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
        'nvim-treesitter'
    },
    config = function()
        require 'nvim-treesitter.configs'.setup {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['il'] = '@loop.inner',
                        ['al'] = '@loop.outer',
                        ['ic'] = '@class.inner',
                        ['aa'] = '@assignment.inner',
                        ['ia'] = '@assignment.inner',
                        ['ii'] = '@conditional.inner',
                        ['ai'] = '@conditional.outer',
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V',  -- linewise
                        ['@class.outer'] = '<c-v>', -- blockwise
                    },
                },
            },
        }
    end
}
