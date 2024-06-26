local keymap = vim.keymap

local opts = {
	noremap = true, -- non-recursive
}

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-----------------
-- Normal mode --
-----------------


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- stop highlighting when searching
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- TODO: Add descriptions to each command
--
-- Resize with arrows
-- delta: 2 lines
keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- center cursor when moving vertically
-- Navigation and centering is handled by cinnamon.lua
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)
--vim.api.nvim_set_keymap("n", "{", "{zz", opts)
--vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts) -- zz centers your cursor
--vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
--vim.api.nvim_set_keymap("n", "}", "}zz", opts)
