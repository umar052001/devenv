return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<Tab>",
						dismiss = "<C-e>",
						next = "<M-]>",
						prev = "<M-[>",
					},
				},
			})
		end,
	},
}
