vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { silent = true })
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<c-p>", "<c-^>")
vim.keymap.set("n", "<leader>vs", function() vim.cmd("vs") end)
vim.keymap.set("n", "<leader>s", function() vim.cmd("split") end)
vim.keymap.set('n', '<leader>x', function()
    local success, _ = pcall(vim.cmd, 'wq')
    if not success then
        vim.cmd('q!')
    end
end, { noremap = true, silent = true })
