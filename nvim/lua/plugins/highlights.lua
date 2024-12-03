return {
	-- syntax highlighter for neovim.
	"nvim-treesitter/nvim-treesitter",
	-- check for dependencies (tar, curl and C compiler)
	cond = function()
		local utils = require("utils")
		return utils.check_deps_with_fallback({ { "tar" }, { "curl" } })
	end,
	-- update TS parsers before start installing new parsers.
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
