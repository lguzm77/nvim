return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local eslint_d = require("none-ls.diagnostics.eslint_d")
		null_ls.setup({
			sources = {
				-- You need to install these manually via :Mason
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.formatting.csharpier,
				eslint_d,

			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fa", vim.lsp.buf.format, {desc = "Format text"})
	end,
}
