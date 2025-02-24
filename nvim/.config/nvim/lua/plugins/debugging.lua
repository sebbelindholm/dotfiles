return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
	config = function()
		require("dapui").setup()

		local dap = require("dap")
		local dapui = require("dapui")

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/sebastian/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
		}

		dap.configurations.c = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>bt", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>bc", dap.continue)
	end,
}
