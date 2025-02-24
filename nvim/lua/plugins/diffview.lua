return {
    "sindrets/diffview.nvim",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "DiffviewFiles",
            callback = function()
                vim.keymap.set("n", "<esc>", ":DiffviewClose<cr>", { buffer = true })
            end
        })
    end
}
