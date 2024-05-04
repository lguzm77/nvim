return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			mason_lspconfig.setup({
				auto_install = true,
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"eslint_d",
					"codespell",
					"golangci-lint",
					"gofumpt",
					"gopls",
          "lua-language-server",
          "typescript-language-server",
          "omnisharp",
          "marksman",
          "rust_analyzer"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({ -- you need to run npm install -g typescript typescript-language-server
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})

			local omnisharp_exec_path = vim.fn.stdpath("data") .. "/mason/packages/libexec/OmniSharp.dll"
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = { "dotnet", omnisharp_exec_path },
				settings = {
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = true,
						AnalyzeOpenDocumentsOnly = true,
					},
				},
			})

			lspconfig.marksman.setup({ capabilities = capabilities })

			lspconfig.gopls.setup({ capabilities = capabilities })

			-- TODO: explore more lsp functionalities and add keybindings
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover over word for lsp suggestions " })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "See keyword references" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename variable" })
		end,
	},
}
