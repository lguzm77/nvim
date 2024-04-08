return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
	config = function()
		require("tokyonight").setup({style="night", transparent = false})

    vim.cmd[[colorscheme tokyonight]]
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#F7E7CE", bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#CEB25E", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#F7E7CE", bold = true })
	end,
}
