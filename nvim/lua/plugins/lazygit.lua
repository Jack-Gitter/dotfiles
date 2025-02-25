return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>git", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function(_, opts)
        vim.keymap.set({ "n", "t" }, "<esc>", "<c-c>")
    end
}
