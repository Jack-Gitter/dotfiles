return {
    'lewis6991/gitsigns.nvim',
    opts = {
        current_line_blame = false,
        word_diff = false,
        attach_to_untracked = false,
        signs = { untracked = { enable = false } },
        numhl = false,
        linehl = false,
        max_file_length = 10000,
        update_debounce = 300,
        watch_gitdir = { interval = 3000, follow_files = true },
        yadm = { enable = false },
    }
}
