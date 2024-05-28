return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter", -- load plugin just before entering insert mode
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- ssource for file system paths
			"hrsh7th/cmp-cmdline", -- source for command line completions
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"zbirenbaum/copilot-cmp",
		},

		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local copilot = require("copilot_cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			copilot.setup()

			vim.opt.completeopt = "menu,menuone,noselect"
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-c>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				}),

				-- icons
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						max_width = 50,
						ellipsis_char = "...",
						symbol_map = { Copilot = "" },
					}),
				},
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})

			-- toggle cmp
			local function toggle_autocomplete()
				local current_setting = cmp.get_config().completion.autocomplete
				if current_setting and #current_setting > 0 then
					cmp.setup({ completion = { autocomplete = false } })
					print("Autocomplete disabled")
				else
					cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
					print("Autocomplete enabled")
				end
			end

			vim.api.nvim_create_user_command("NvimCmpToggle", toggle_autocomplete, {})
			vim.keymap.set("n", "<leader>ac", ":NvimCmpToggle<CR>", { desc = "Toggle autocomplete" })
		end,
	},
}
