return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- load plugin just before entering insert mode
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- ssource for file system paths
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },

    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

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
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),

        -- icons
        formatting = {
          format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
        },
      })
    end,
  },
}