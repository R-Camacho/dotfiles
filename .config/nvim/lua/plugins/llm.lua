return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"zbirenbaum/copilot.lua",
			opts = {},
		},
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
				cmd = { adapter = "copilot" },
			},
			opts = {
				log_level = "DEBUG",
			},
			display = {
				chat = {
					--show_settings = true,
				},
			},
		})
		vim.cmd([[cnoreabbrev cc CodeCompanion]])
		vim.cmd([[command! Chat lua require('codecompanion').chat()]])
	end,
	cmd = { "Chat", "CodeCompanion", "CodeCompanionChat", "CodeCompanionAction", "CodeCompanionCmd" },
}
