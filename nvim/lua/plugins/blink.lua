return {
    'saghen/blink.cmp',
    dependencies = {
        { 'L3MON4D3/LuaSnip',            version = 'v2.*' },
        { "rafamadriz/friendly-snippets" }
    },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'default',
            ['<c-k>'] = { 'select_prev', 'fallback' },
            ['<c-j>'] = { 'select_next', 'fallback' },
            ['<c-cr>'] = { 'accept', 'fallback' },
            ['<c-;>'] = { 'show_documentation', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        snippets = { preset = 'luasnip' },
        completion = {
            documentation = { auto_show = false, window = { border = 'single' } },
            menu = { border = 'single' }
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            per_filetype = { sql = { 'dadbod' } },
            providers = {
                dadbod = { module = "vim_dadbod_completion.blink" },
            }
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    event = { "LspAttach" }
}
