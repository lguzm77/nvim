return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#00000000"
    })
    vim.notify = notify
  end,
}
