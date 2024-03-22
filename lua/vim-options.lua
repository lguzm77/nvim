vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " " --alias for leader
vim.cmd("cd %:p:h") -- set current directory as base
vim.wo.relativenumber = true

local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- zz centers your cursor
vim.api.nvim_set_keymap("n","<C-u>", "<C-u>zz", opts)

-- center cursor when iterating a search option
vim.api.nvim_set_keymap("n", "n" , "nzzzv", {})
vim.api.nvim_set_keymap("n", "N" , "Nzzzv", {})

