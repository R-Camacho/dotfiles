return {
	{
		"uga-rosa/ccc.nvim", -- show colors
		opts = {},
        ft = { "css", "html", "javascript", "typescript", "svelte"},
		cmd = { "CccPick", "CccConvert", "CccHighlighterEnable" },
	},

	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {},
		cmd = { "LivePreview" },
	},
}
