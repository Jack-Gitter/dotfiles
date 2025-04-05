return {
	"folke/snacks.nvim",
	config = function()
		local snacks = require("snacks")

		local ws = function()
			local folders = vim.lsp.buf.list_workspace_folders()
			if next(folders) ~= nil then
				return folders[1]
			else
				return vim.fn.getcwd()
			end
		end
		vim.keymap.set("n", "<leader>ff", function() snacks.picker.smart({ cwd = ws() }) end)
		vim.keymap.set("n", "<leader>gr", function() snacks.picker.grep({ cwd = ws() }) end)
		vim.keymap.set("n", "<leader>fr", function() snacks.picker.lsp_references() end)
		vim.keymap.set("n", "<leader>fr", function() snacks.picker.lsp_implementations() end)
		vim.keymap.set("n", "<leader>gd", function() snacks.picker.lsp_definitions() end)
		vim.keymap.set("n", "<leader>ws", function() snacks.picker.lsp_workspace_symbols() end)
		vim.keymap.set("n", "<leader>wd", function() snacks.picker.diagnostics() end)
	end
}
