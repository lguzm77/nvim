vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.g.mapleader = " " --alias for leader
vim.cmd("cd %:p:h") -- set current directory as base
vim.wo.relativenumber = true
