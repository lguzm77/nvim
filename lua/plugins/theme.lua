return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
	config = function()
		require("tokyonight").setup({style="night", transparent = false})

    vim.cmd[[colorscheme tokyonight]]
    local nonHighlightColor = "#A9B1D6"
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = nonHighlightColor, bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFC777", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = nonHighlightColor, bold = true })
	end,
}
