return {
    "lewis6991/gitsigns.nvim",
    opts = {},
    config = function(_, opts)
        local gitsigns = require("gitsigns")
        gitsigns.setup(opts)
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
        vim.keymap.set("n", "<leader>bl", gitsigns.blame)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "gitsigns-blame",
            callback = function()
                vim.keymap.set("n", "<c-c>", ":q<cr>", { buffer = true })
            end
        })
    end,
    event = "BufEnter",
}
