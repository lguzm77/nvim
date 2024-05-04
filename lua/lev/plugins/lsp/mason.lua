return {
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
    ensure_installed = {
      "tsserver",
      "gopls",
      "omnisharp"
    }
        })

  -- install linters and formatters
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
                "codespell",
                "golangci-lint",
                "gofumpt",
                "marksman",
            },
        })
    end,
},