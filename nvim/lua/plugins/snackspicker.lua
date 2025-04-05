return {
    "folke/snacks.nvim",
    opts = {
        picker = {}
    },
    config = function(_, opts)
        local ws = function()
            local folders = vim.lsp.buf.list_workspace_folders()
            if next(folders) ~= nil then
                return folders[1]
            else
                return vim.fn.getcwd()
            end
        end

        vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart({ cwd = ws() }) end)
        vim.keymap.set("<leader>gr", function() Snacks.picker.grep({ cwd = ws() }) end)
        vim.keymap.set("n", "<leader>fr", Snacks.picker.lsp_references)
        vim.keymap.set("n", "<leader>gi", Snacks.picker.lsp_implementations)
        vim.keymap.set("n", "<leader>gd", Snacks.picker.lsp_definitions)
        vim.keymap.set("n", "<leader>ws", Snacks.picker.lsp_workspace_symbols)
        vim.keymap.set("n", "<leader>wd", Snacks.picker.diagnostics)
    end
}
