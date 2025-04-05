local ws = function()
    local folders = vim.lsp.buf.list_workspace_folders()
    if next(folders) ~= nil then
        return folders[1]
    else
        return vim.fn.getcwd()
    end
end

return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            -- your picker configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    keys = {
        { "<leader>ff", function() Snacks.picker.smart({ cwd = ws() }) end },
        { "<leader>gr", function() Snacks.picker.grep({ cwd = ws() }) end },
        { "<leader>fr", function() Snacks.picker.lsp_references() end },
        { "<leader>gi", function() Snacks.picker.lsp_implementations() end },
        { "<leader>gd", function() Snacks.picker.lsp_definitions() end },
        { "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end },
        { "<leader>wd", function() Snacks.picker.diagnostics() end }
    }
}
--     config = function(_, opts)
--         --local snacks = require("snacks")
--         vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart({ cwd = ws() }) end)
--         vim.keymap.set("n", "<leader>gr", function() Snacks.picker.grep({ cwd = ws() }) end)
--         vim.keymap.set("n", "<leader>fr", function() Snacks.picker.lsp_references() end)
--         vim.keymap.set("n", "<leader>fr", function() Snacks.picker.lsp_implementations() end)
--         vim.keymap.set("n", "<leader>gd", function() Snacks.picker.lsp_definitions() end)
--         vim.keymap.set("n", "<leader>ws", function() Snacks.picker.lsp_workspace_symbols() end)
--         vim.keymap.set("n", "<leader>wd", function() Snacks.picker.diagnostics() end)
-- end
