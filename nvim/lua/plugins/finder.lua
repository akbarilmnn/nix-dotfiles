return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	dependencies = {
		-- primary dependency for telescope.nvim.
		"nvim-lua/plenary.nvim",
		-- addon for faster fuzzy finding.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build =
			"cmake -S. -Bbuild -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		-- cool icons.
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<leader>ff",
			mode = { "n" },
			"<cmd>Telescope find_files<cr>",
			desc = "find files in cwd",
		},
		{
			"<leader>fc",
			mode = { "n" },
			"<cmd>Telescope grep_string<cr>",
			desc = "list open buffers in current neovim instance",
		},
		{
			"<leader>fb",
			mode = { "n" },
			"<cmd>Telescope buffers<cr>",
			desc = "list open buffers in current neovim instance",
		},
		{
			"<leader>fh",
			mode = { "n" },
			"<cmd>Telescope help_tags<cr>",
			desc = "list available help tags",
		},
		{
			"<leader>fg",
			mode = { "n" },
			"<cmd>Telescope git_files<cr>",
			desc = "list git files",
		},
		{
			"<leader>fk",
			mode = { "n" },
			"<cmd>Telescope keymaps<cr>",
			desc = "list keymaps",
		},
		{
			"<leader>ds",
			mode = { "n" },
			"<cmd>Telescope diagnostics<cr>",
			desc = "fuzzy find diagnostics"
		}
	},
	config = function()
		local minimal_opts = { theme = "dropdown", previewer = false, prompt_prefix = "  " }
		require("telescope").setup({
			pickers = {
				find_files = {
					previewer = false,
					prompt_prefix = "   ",
					hidden = false,
					theme = "dropdown",
					selection_caret = " ",
				},
				help_tags = minimal_opts,
				builtin = minimal_opts,
			},
			extensions = {
				fzf = {},
			},
		})

		require("telescope").load_extension("fzf")
	end,
}
