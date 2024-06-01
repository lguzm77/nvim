return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"folke/todo-comments.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local transform_mod = require("telescope.actions.mt").transform_mod

			local trouble = require("trouble")
			local trouble_telescope = require("trouble.providers.telescope")

			-- custom trouble action
			local custom_actions = transform_mod({
				open_trouble_qflist = function(prompt_bufnr)
					trouble.toggle("quickfix")
				end,
			})

			telescope.setup({
				defaults = {
					path_display = { "truncate" },
					layout_config = {
						horizontal = {
							preview_width = 0.5, -- make preview window occupy 50% of the screen
						},
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
							["<C-t>"] = trouble_telescope.smart_open_with_trouble, -- TODO: smart_open_with_trouble is deprecated!
							-- TODO: what do these do?
							-- ["<C-s>"] = actions.cycle_previewers_next,
							-- ["<C-a>"] = actions.cycle_history_prev,
						},
					},
				},
			})

			-- customize previewer
			vim.api.nvim_create_autocmd("User", {
				pattern = "TelescopePreviewerLoaded",
				callback = function(args)
					vim.wo.wrap = true
					vim.wo.number = true
				end,
			})

			-- TODO: check what other extensions are available to you.
			-- Do any enhance your workflow? Why?
			telescope.load_extension("fzf")
			telescope.load_extension("noice")
			-- TODO: what does this extension do?
			telescope.load_extension("ui-select")

			local keymap = vim.keymap
			local builtin = require("telescope.builtin")
			local themes = require("telescope.themes")

			keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
			keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
			keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
			keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find word under cursor in cwd" })
			keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
			keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
			keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(themes.get_dropdown({
					winblend = 10,
					previewer = false,
					layout_config = { width = 0.7 },
				}))
			end, { desc = "[/] Fuzzy search in current buffer" })
			keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "search commits for buffer" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
