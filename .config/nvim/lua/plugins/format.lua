local function ensureInstalled(formatter)
	if not vim.fn.executable(formatter) then
		vim.notify(
			formatter .. " is not installed! Make sure you install it if you want code formatting!",
			vim.log.levels.WARN
		)
	end
	return formatter
end

return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { ensureInstalled("stylua") },
				c = { ensureInstalled("clang-format") },
				cpp = { ensureInstalled("clang-format") },
				r = { "styler" },
				python = { ensureInstalled("autopep8") },
			},
		})
	end,
}
