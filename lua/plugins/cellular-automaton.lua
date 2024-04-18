return {
  "Eandrju/cellular-automaton.nvim",
  event = { "BufReadPre" },
  config = function()
    vim.keymap.set("n", "<leader>fml", ":CellularAutomaton make_it_rain<CR>")
  end,
}
