vim.g.mapleader = " "
vim.keymap.set("n", "<space>", "<nop>", { silent = true })
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "<c-p>", "<c-^>")
vim.keymap.set("n", "<leader>vs", function() vim.cmd("split") end)
vim.keymap.set("n", "<leader>hs", function() vim.cmd("vs") end)
