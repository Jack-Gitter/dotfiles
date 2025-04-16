return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'sql', 'markdown', 'markdown_inline', 'javascript', 'typescript', 'luadoc', 'gopls', 'http' },
        auto_install = true,
        highlight = {
            enable = true
        }
    },
    config = function(_, opts)
        require('nvim-treesitter').setup(opts)
        vim.cmd('TSEnable highlight')
    end
}
