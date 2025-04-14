local name = "tokyonight"
return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
	name = name,
	config = function()
		vim.cmd("colorscheme " .. name )
	end,
    opts = {},
}
