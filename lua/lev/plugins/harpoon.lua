-- BLAZINGLY FAST
return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file for quick harpoon access" })
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<C-a>", function()
      ui.nav_file(1)
    end, { desc = "Go to marked file 1" })

    vim.keymap.set("n", "<C-x>", function()
      ui.nav_file(2)
    end, { desc = "Go to marked file 2" })
  end,
}
