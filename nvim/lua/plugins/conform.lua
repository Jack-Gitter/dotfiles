local conform = require('conform')

conform.setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = 'fallback'
	},
	formatters_by_ft = {
		javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
		typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
		javascriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
		typescriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
	},
})
