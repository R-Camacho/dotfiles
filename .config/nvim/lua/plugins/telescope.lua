return {
	"nvim-telescope/telescope.nvim", version = '*',
	dependencies = { "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<leader>fs", "<CMD>Telescope grep_string<CR>", desc = "Telescope grep string under cursor" },
		{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Telescope live grep" },
		{ "<leader>gg", "<CMD>Telescope git_files<CR>", desc = "Telescope git grep" },
		{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Telescope buffers" },
		{ "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Telescope help tags" },
		{ "<leader>dd", "<CMD>Telescope diagnostics<CR>", desc = "Telescope LSP diagnostics" },
	},
}
