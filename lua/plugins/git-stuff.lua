return {
  --TODO: install octo.nvim
  {
    "tpope/vim-fugitive",
    dependencies = { "tpope/vim-rhubarb" },
    config = function()
      vim.keymap.set("n", "<leader>op", ":GBrowse<CR>", {})
      vim.keymap.set("v", "<leader>op", ":GBrowse<CR>", {})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
}
