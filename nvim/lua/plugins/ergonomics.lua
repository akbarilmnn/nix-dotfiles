return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"sf",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		-- { "Sf",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		-- { "sfr",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
		-- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	},
	dependencies = {
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},
		{
			"leath-dub/snipe.nvim",
			opts = {
				ui = {
					position = "center",
					open_win_override = {
						title = "Opened Buffers",
						border = "rounded",
					},
				},
			},
			keys = {
				{
					"<leader>n",
					mode = { "n" },
					function()
						require("snipe").open_buffer_menu()
					end,
					desc = "Open buffers",
				},
			},
		},
		{
			"sphamba/smear-cursor.nvim",
			opts = { -- Default  Range
				stiffness = 0.8, -- 0.6      [0, 1]
				trailing_stiffness = 0.5, -- 0.3      [0, 1]
				distance_stop_animating = 0.5, -- 0.1      > 0
			},
		},
		{
			"echasnovski/mini.files",
			opts = {
				mappings = {
					close = "q",
					go_in = "<cr>",
					go_out = "-",
				},
			},
			keys = {
				{
					"<leader>-",
					mode = { "n" },
					function()
						require("mini.files").open()
					end,
					desc = "Open file explorer",
				},
			},
		},
		{
			"echasnovski/mini.indentscope",
			opts = {},
		},
	},
}
