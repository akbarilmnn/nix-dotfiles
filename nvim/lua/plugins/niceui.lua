return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				["vim.lsp.util.rename"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
		{
			"karb94/neoscroll.nvim",
			opts = {},
		},
		-- a plugin that beautify cursor in neovim (really cool!)
		-- NOTE: requires neovim v0.10.2
		-- kind of distracting.
		--{
		--	"sphamba/smear-cursor.nvim",
		--	opts = {
		--		cursor_color = "#e5c07b",
		--	},
		--},
	},
}
