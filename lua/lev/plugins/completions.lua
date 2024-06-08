local enableCopilot = true
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

			local completion_sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" }, -- text within the current buffer
				{ name = "path" }, -- file system paths
			}

			-- Guarantee that copilot is the last element
			table.insert(completion_sources, { name = "copilot" })

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
					["<C-i>"] = cmp.mapping.scroll_docs(-4),
					["<C-o>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources(completion_sources),

				-- icons
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						max_width = function()
							return math.floor(0.45 * vim.o.columns)
						end,
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

			vim.keymap.set("n", "<leader>ac", function()
				enableCopilot = not enableCopilot
				if not enableCopilot then
					table.remove(completion_sources, table.maxn(completion_sources)) -- copilot will be the last element
				elseif completion_sources[{ name = "copilot" }] == nil then
					table.insert(completion_sources, { name = "copilot" })
				end
				require("cmp").setup({ sources = cmp.config.sources(completion_sources) })
				vim.notify("Copilot cmp is now " .. (enableCopilot and "enabled" or "disabled"))
			end, { desc = "Toggle autocomplete" })
		end,
	},
}
