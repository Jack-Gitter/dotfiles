return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat"
    },
    config = function()
        vim.keymap.set({ 'n', 'v' }, 'f', '<plug>(leap-forward)')
        vim.keymap.set({ 'n', 'v' }, '<s-f>', '<plug>(leap-backward)')
    end
}
