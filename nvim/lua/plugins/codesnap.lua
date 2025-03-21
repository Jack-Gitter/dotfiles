return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    },
}
