vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " " --alias for leader
vim.g.background = "light"

vim.wo.number = true;
vim.wo.relativenumber = true;

vim.cmd("cd %:p:h") -- set current directory as base

vim.cmd("set wrap")
vim.cmd("set breakindent")
vim.cmd("set linebreak")

vim.opt.swapfile = false -- TODO: what does this do?

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- zz centers your cursor
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)

-- stop highlighting when searching
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- center cursor when iterating a search option
vim.api.nvim_set_keymap("n", "n", "nzzzv", {})
vim.api.nvim_set_keymap("n", "N", "Nzzzv", {})

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
