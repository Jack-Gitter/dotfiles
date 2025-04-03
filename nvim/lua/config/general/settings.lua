vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.updatetime = 1000
vim.opt.ignorecase = true
vim.o.cmdheight = 0
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.cursorline = true
vim.opt.cursorlineopt = "number"

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#baa0e8", })
vim.api.nvim_set_hl(0, 'ColorColumn', { fg = 'white', })
