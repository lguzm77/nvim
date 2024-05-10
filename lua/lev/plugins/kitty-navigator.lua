return {
	"MunsMan/kitty-navigator.nvim",
  enabled = false,
	build = { "cp navigate_kitty.py ~/.config/kitty", "cp pass_keys.py ~/.config/kitty" },
	keys = {
		{
			-- C keys don't work here, why?
			"<leader>h",
			function()
				require("kitty-navigator").navigateLeft()
			end,
			mode = "n",
			desc = "Move left a Split",
		},
		{
			"<leader>j",
			function()
				require("kitty-navigator").navigateDown()
			end,
			mode = "n",
			desc = "Move down a Split",
		},
		{
			"<leader>k",
			function()
				require("kitty-navigator").navigateUp()
			end,
			mode = "n",
			desc = "Move up a Split",
		},
		{
			"<leader>l",
			function()
				require("kitty-navigator").navigateRight()
			end,
			mode = "n",
			desc = "Move right a Split",
		},
	},
}
