return {
	"sontungexpt/witch",
	priority = 1000,
	lazy = false,
	config = function()
		require("witch").setup({
			theme = {
				extras = {
					bracket = true,
					diffview = true,
					dashboard = true,
					explorer = true,
					indentline = true,
				},
			},
		})
	end,
}
