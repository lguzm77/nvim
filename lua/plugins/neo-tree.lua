return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set({ "n", "v" }, "/", ":Neotree toggle current reveal_force_cwd<CR>")
    vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>")
    vim.keymap.set("n", "<C-g>", ":Neotree git_status float<CR>")
  end,
}
