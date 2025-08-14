return {
    'mfussenegger/nvim-lint',
    config = function()
        local lint = require('lint')
        lint.linters_by_ft = {
            typescript = { 'eslint_d' },
            javascript = { 'eslint_d' }
        }
    end

}
