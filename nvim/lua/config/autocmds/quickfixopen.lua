vim.api.nvim_create_autocmd('QuickFixCmdPost', {
    desc = 'Open quickfix after populating',
    callback = function()
        vim.cmd('copen')
    end
})
