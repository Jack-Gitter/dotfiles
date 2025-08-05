return {
    'stevearc/conform.nvim',
    opts = {
        formatters = {
            kulala = {
                command = 'kulala-fmt',
                args = { 'format', '$FILENAME' },
                stdin = false,
            },
        },
        format_on_save = {
            timeout_ms = 1000,
        },
        formatters_by_ft = {
            javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            javascriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            typescriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            http = { 'kulala' },

        },
    },
}
