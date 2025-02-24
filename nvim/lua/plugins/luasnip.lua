return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets"
	},
	config = function()
		local luasnip = require("luasnip")
		vim.keymap.set({ "i", "s" }, "<C-l>", function() luasnip.jump(1) end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-h>", function() luasnip.jump(-1) end, { silent = true })
		require("luasnip").config.setup({ store_selection_keys = "<Tab>" })
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_snipmate").lazy_load()
		require("luasnip.loaders.from_lua").load({ paths = "./snippets" })
	end,
	event = { "BufReadPost", "BufNewFile" },
}
