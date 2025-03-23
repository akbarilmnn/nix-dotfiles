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
			"echasnovski/mini.pairs",
			opts = {},
		},
		{
			"echasnovski/mini.files",
			opts = {
				mappings = {
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
					desc = "Miller column file explorer",
				},
			},
		},
		{
			"echasnovski/mini.indentscope",
			opts = {},
		},
	},
}
