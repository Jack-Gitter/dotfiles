local on_attach = function(client, bufnr)
	vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })

	if client.supports_method('textDocument/codeAction') then
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
	end

	if client.supports_method('textDocument/rename') then
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
	end
end

vim.lsp.config.lua_ls = {
	cmd = { 'lua-language-server' },
	on_attach = on_attach,
	filetypes = { 'lua' },
	root_markers = {
		'.luarc.json',
		'.luarc.jsonc',
		'.luacheckrc',
		'.stylua.toml',
		'stylua.toml',
		'selene.toml',
		'selene.yml',
		'.git',
	},
	single_file_support = true,
	log_level = vim.lsp.protocol.MessageType.Warning,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			signatureHelp = { enabled = true },
			format = {
				enable = true,
				defaultConfig = {
					quote_style = 'single',
					indent_style = 'tab',
				},
			},
			workspace = {
				checkThirdParty = 'Disable',
				ignoreDir = { '~/.local/' },
				library = vim.api.nvim_get_runtime_file('', true)
			},
			diagnostics = {
				libraryFiles = 'Disable',
				globals = { 'vim' }
			}
		}
	}
}
