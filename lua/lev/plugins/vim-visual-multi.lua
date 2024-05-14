local function visual_cursors_with_delay()
	-- Execute the vm-visual-cursors command.
	vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
	-- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
	vim.cmd("sleep 200m")
	-- Press 'A' in normal mode after the delay.
	vim.cmd('silent! execute "normal! A"')
end

return {
	"mg979/vim-visual-multi",
	events = { "BufReadPre", "BufNewFile" },
	init = function()
		vim.g.VM_default_mappings = 0 -- turn off vim-visual-multi defaults
		vim.g.VM_maps = {
			["Find Under"] = "",
		}
		vim.g.VM_add_cursor_at_pos_no_mappings = 1
	end,
	keys = {
		{ "<leader>ma", "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
		{ "<leader>mr", "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
		{ "<leader>mp", "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
		{ "<leader>mv", visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
		{ "<leader>mo", "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
	},
}
