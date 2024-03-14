return  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
<<<<<<< HEAD
=======
    vim.keymap.set('n', '<C-b>', ':Neotree filesystem toggle<CR>')
    vim.keymap.set('n', '<C-g>', ':Neotree git_status reveal float toggle<CR>') 
>>>>>>> c96bd02 (Add new keymappings)
  end
}

