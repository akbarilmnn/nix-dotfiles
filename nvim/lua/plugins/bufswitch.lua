return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<leader>n",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "List buffers",
		},
	},
	opts = {
		ui = {
			position = "center",
			open_win_override = {
				border = "rounded",
			},
		},
	},
}
