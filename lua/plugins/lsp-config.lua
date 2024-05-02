return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
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

      -- TODO: explore more lsp functionalities and add keybindings
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover over word for lsp suggestions " })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "See keyword references" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "See available code actions" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename variable" })
    end,
  },
}
