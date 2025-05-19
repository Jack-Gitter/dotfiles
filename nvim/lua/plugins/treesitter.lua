return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'sql', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'luadoc', 'http' },
            auto_install = true,
            highlight = {
                enable = true
            }
        })
    end,
    event = { 'BufEnter' }
}
