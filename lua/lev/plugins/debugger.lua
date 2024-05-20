return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy", -- check all events with :h VeryLazy
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {desc = "Toggle breakpoint"})
			vim.keymap.set("n", "<leader>dc", dap.continue, {desc = "Continue execution"})

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "127.0.0.1",
				port = 8123,
				executable = {
					command = "js-debug-adapter",
				},
			}

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
						runtimeExecutable = "node",
					},
				}
			end
		end,
	},
}
