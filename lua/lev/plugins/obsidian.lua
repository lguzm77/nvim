return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",-- for completion support
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "Personal",
					path = "~/personal-obsidian-notes/Personal",
				},
			},
			completion = {
				nvim_cmp = true,
				min_chars = 2,
			},
			ui = {
				enable = true,
			},
		})
	end,
}
