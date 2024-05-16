return {
	"nvim-treesitter/nvim-treesitter",
	-- build = ":TSUpdate",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	event = { "BufEnter" },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"javascript",
				"typescript",
				"html",
				"css",
				"cpp",
				"zig",
				"rust",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			ident = { enable = true },
		})
	end,
}
