return {
	"mg979/vim-visual-multi",
	enable = false,
	events = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.g.VM_default_mappings = 0 -- turn off vim-visual-multi defaults
		vim.g.VM_maps = {
			["Find Under"] = "",
		}
		vim.g.VM_add_cursor_at_pos_no_mappings = 1
	end,
	keys = {

		{ "<leader>a", "", desc = "Select all" },
	},
}
