return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				opt = {
					suggestion = {
						-- This makes suggestions appear automatically
						auto_trigger = true,
						headless = true,

						-- This is where we define the keybindings
						keymap = {
							accept = "<Tab>", -- Use Tab to accept a suggestion
							dismiss = "<C-e>", -- Use Ctrl+e to dismiss a suggestion
							next = "<M-]>", -- Use Alt+] to see the next suggestion
							prev = "<M-[>", -- Use Alt+[ to see the previous suggestion
						},
					},
				},
			})
		end,
	},
}
