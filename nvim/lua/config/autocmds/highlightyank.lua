vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking text',
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 300 })
    end
})
