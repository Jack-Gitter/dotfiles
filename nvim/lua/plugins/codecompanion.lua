local codecompanion = require('codecompanion')

codecompanion.setup({
	interactions = {
		chat = {
			adapter = 'anthropic',
		},
		cli = {
			agent = 'claude_code',
			agents = {
				claude_code = {
					cmd = 'claude',
					args = {},
					description = 'Claude Code CLI',
					provider = 'terminal',
				},
			},
		},
	},
	adapters = {
		http = {
			anthropic = function()
				return require('codecompanion.adapters').extend('anthropic', {
					env = {
						api_key = 'ANTHROPIC_API_KEY',
					},
				})
			end,
		},
	},
})
