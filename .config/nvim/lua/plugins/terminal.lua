return {
	"akinsho/toggleterm.nvim",
	config = function()
        require("toggleterm").setup({})
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
		vim.keymap.set("n", "<leader>tt", function()
            vim.cmd("TermNew")
		end)
	end,
}
