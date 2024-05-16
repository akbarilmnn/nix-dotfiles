return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	-- use the dir key for lazy.nvim to search local plugins
	-- hello is a directory that contains a folder called lua and contains a file inside called hello.lua
	-- because it's placed inside lua folder not ~/lua-plugins/hello/lua/plugins/hello.lua it will not get executed by
	-- neovim.
	-- dir = "/home/akbar/lua-plugins/hello",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
