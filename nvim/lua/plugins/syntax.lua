return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"query",
				"rust",
				"cpp",
				"zig",
				"html",
				"css",
				"javascript",
				"typescript",
				"go",
				"python",
				"json",
				"toml",
				"yaml",
				"java",
				-- warning from noice.nvim
				"regex",
				"bash",
				"dockerfile",
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
