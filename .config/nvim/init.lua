-- Leader key
vim.g.mapleader = " "

-- Load lazy.nvim
require("config.lazy")

-- Basic editor settings
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<CR>")
