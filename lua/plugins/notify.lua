return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({ top_down = false, width = 40 })
		vim.notify = notify
	end,
}
