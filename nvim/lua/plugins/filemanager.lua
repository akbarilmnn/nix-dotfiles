return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "oil",
			callback = function()
				vim.opt_local.colorcolumn = ""
			end,
		})
	end,
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({})
	end,
}
