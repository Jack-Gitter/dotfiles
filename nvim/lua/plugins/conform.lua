return {
    'stevearc/conform.nvim',
    opts = {
        format_on_save = {
            timeout_ms = 1000,
        },
        formatters_by_ft = {
            javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
            typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true }
        },
    },
}
