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
        picker = {}
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
