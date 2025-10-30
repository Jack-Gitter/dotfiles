vim.lsp.config.lua_ls = {
	cmd = { 'lua-language-server' },
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
