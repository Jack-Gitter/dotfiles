return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat"
    },
    config = function()
        vim.keymap.set('n', 'f', '<plug>(leap-forward)')
        vim.keymap.set('n', 'F', '<plug>(leap-backward)')
    end
}
