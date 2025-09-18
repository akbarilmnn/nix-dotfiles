require("autocmds")
require("usercmds")

vim.g.mapleader = " "
vim.g.leaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local editor_options = {
	-- enables relative number feature in neovim.
	relativenumber = true,
	-- indents the next line based on the previous line.
	autoindent = true,
	-- sets 'dark mode' in neovim
	background = "dark",
	-- turn on a feature to see hidden characters such as end of line, backspace, enter, etc.
	list = true,
	-- modify hidden characters e.g when you are at the EOF/EOL. it will show the `󱞥` character
	listchars = {
		eol = "󱞥",
		tab = "󰇙 ",
		trail = "·",
		nbsp = "␣",
	},
	-- specify the how you want to copy/paste your text
	clipboard = "unnamedplus",
	window = 0,
	-- enable cursor highglighting
	cursorline = true,
	-- highlight on the line number of the current cursor
	cursorlineopt = "number",
	-- C indentation
	cindent = true,
	-- gets the line number in current line (this pairs well with `relativenumber`)
	number = true,
	-- highlight matched search term
	hlsearch = false,
	-- highlight matched while typing
	incsearch = true,
	-- case sensitivity while searching
	ignorecase = true,
	smartcase = true,
	-- number of space for autoindent
	shiftwidth = 4,
	tabstop = 4,
	updatetime = 50,
	laststatus = 3,
	-- enable mouse in neovim (rarely use this feature)
	mouse = "a",
	-- show current mode in bottom
	showmode = false,
	completeopt = { "menu", "menuone", "noselect" },
	splitbelow = true,
	splitright = true,
}

for opt, value in pairs(editor_options) do
	vim.opt[opt] = value
end
