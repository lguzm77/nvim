local opts = {
    noremap = true,      -- non-recursive
}
-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)


-- TODO: add tmux navigator keybindings again

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- stop highlighting when searching
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
-- center cursor when moving vertically 
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)
vim.api.nvim_set_keymap("n", "{", "{zz", opts)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- zz centers your cursor
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
vim.api.nvim_set_keymap("n", "}", "}zz", opts)
