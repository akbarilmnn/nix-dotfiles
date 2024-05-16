return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
			},
		})
	end,
    opts = {},
}
