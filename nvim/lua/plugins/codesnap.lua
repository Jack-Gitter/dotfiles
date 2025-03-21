return {
    "mistricky/codesnap.nvim",
    build = "make",
    keys = {
        { "<leader>sc", "<cmd>CodeSnap<cr>", mode = "v", desc = "Save selected code snapshot into clipboard" },
    },
    opts = {
        save_path = "~/Pictures",
        has_breadcrumbs = true,
        bg_theme = "bamboo",
    },
}
