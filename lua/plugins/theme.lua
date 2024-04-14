return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = true,
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true, bold = true },
        keywords = { italic = true, bold = true },
        functions = { italic = true, bold = true },
      },
    })

    vim.cmd([[colorscheme tokyonight]])
    local nonHighlightColor = "#A9B1D6"
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = nonHighlightColor, bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFC777", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = nonHighlightColor, bold = true })
  end,
}
