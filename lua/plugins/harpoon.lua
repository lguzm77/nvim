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

    vim.keymap.set("n", "<C-f>", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<C-t>", function()
      ui.nav_file(2)
    end)
  end,
}
