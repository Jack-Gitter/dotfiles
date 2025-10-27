vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	severity_sort = true,
	float = {
		border = 'rounded'
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '',
			[vim.diagnostic.severity.WARN] = '',
			[vim.diagnostic.severity.INFO] = '',
			[vim.diagnostic.severity.HINT] = ''
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = 'DiagnosticError',
			[vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
			[vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
			[vim.diagnostic.severity.HINT] = 'DiagnosticHint'
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = 'DiagnosticError',
			[vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
			[vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
			[vim.diagnostic.severity.HINT] = 'DiagnosticHint'
		}
	}
})

vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
vim.keymap.set('n', 'gwd', vim.diagnostic.setqflist)
