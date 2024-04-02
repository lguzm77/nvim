return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({ flavour = "frappe", transparent_background = true })

		vim.cmd.colorscheme("catppuccin")
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#F7E7CE", bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#CEB25E", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#F7E7CE", bold = true })
	end,
}
