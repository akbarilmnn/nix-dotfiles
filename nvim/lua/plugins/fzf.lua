return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	branch = "0.1.x",
	-- check for dependencies for telescope-fzf-native.
	cond = function()
		local utils = require("utils")
		return utils.check_deps_with_fallback({ { "fd" }, { "cmake", "make" }, { "clang", "gcc" } })
	end,
	dependencies = {
		-- primary dependency for telescope.nvim.
		"nvim-lua/plenary.nvim",
		-- addon for faster fuzzy finding.
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		-- cool icons.
		"nvim-tree/nvim-web-devicons",
	},
}
