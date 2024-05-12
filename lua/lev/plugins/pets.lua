return {
	"giusgad/pets.nvim",
  enable = false,
	dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
	config = function()
		require("pets").setup({
			default_pet = "crab",
			default_style = "red",
		})
	end,
}
