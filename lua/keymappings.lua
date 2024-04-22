local keymap = vim.keymap

local opts = {
    noremap = true,      -- non-recursive
}

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-----------------
-- Normal mode --
-----------------

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window


-- stop highlighting when searching
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Resize with arrows
-- delta: 2 lines
keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap.set('v', '<', '<gv', opts)
keymap.set('v', '>', '>gv', opts)

-- center cursor when moving vertically 
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)
vim.api.nvim_set_keymap("n", "{", "{zz", opts)
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- zz centers your cursor
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
vim.api.nvim_set_keymap("n", "}", "}zz", opts)

