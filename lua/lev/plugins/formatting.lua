return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- install additional formatters via Lazy
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				yaml = { "prettier" },
				csharp = { "csharpier" },
				["*"] = { "codespell" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fa", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visial)" })
	end,
}
