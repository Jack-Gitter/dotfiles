local restore_cursor_augroup = vim.api.nvim_create_augroup(
    "restore_cursor_shape_on_exit",
    { clear = true }
)
vim.api.nvim_create_autocmd({ "VimLeave" }, {
    group = restore_cursor_augroup,
    desc = "restore the cursor shape on exit of neovim",
    command = "set guicursor=a:hor20",
})
