return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_x = {
          {'copilot'},
					{ "encoding" },
					{ "filetype" },
				},
			},
		})
	end,
}
