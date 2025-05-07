return {
	"vague2k/huez.nvim",
	import = "huez-manager.import",
	branch = "stable",
	event = "UIEnter",
	config = function()
		require("huez").setup({})
	end,
}
