local codecompanion = require('codecompanion')

codecompanion.setup({
	interactions = {
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
})
