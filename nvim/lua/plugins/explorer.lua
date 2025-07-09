return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "<leader>-", "<cmd>Oil --float<cr>", desc = "Open file explorer" },
	},
	config = function()
		require("oil").setup({
			float = {
				win_options = {
					winblend = 0
				}
			}
		})
	end,
}
