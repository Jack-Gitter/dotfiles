return {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    config = function()
        local ls = require('luasnip')
        vim.keymap.set({ 'i', 's' }, '<c-l>', function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ 'i', 's' }, '<c-h>', function() ls.jump(-1) end, { silent = true })
    end
}
