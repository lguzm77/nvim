return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-N>", ":Neotree filesystem reveal left<CR>")
    vim.keymap.set("n", "<C-B>", ":Neotree filesystem toggle<CR>")
    vim.keymap.set("n", "<C-g>", ":Neotree git_status reveal float toggle<CR>")
  end,
}
