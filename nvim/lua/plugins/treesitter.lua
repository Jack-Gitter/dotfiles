return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "javascript", "typescript", "luadoc", "gopls" },
        highlight = {
            enable = true
        }
    },
    event = { "BufReadPost", "BufNewFile" },
}
