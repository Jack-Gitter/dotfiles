local on_attach = function(client, bufnr)
	-- vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
	-- vim.cmd [[set completeopt+=menuone,noselect,popup]]
end

vim.lsp.config.ts_ls = {
	init_options = { hostInfo = 'neovim', },
	cmd = { 'typescript-language-server', '--stdio' },
	on_attach = on_attach,
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
	root_markers = {
		'tsconfig.json', 'jsconfig.json', 'package.json', '.git'
	},
	single_file_support = true,
	settings = {
		completions = {
			completeFunctionCalls = true
		}
	},

}
