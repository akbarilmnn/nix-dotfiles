-- import all the modules.
require("autocmds")
require("usercmds")

-- declare al
local global_options = {
	-- set map leader here before lazy loads...
	mapleader = " ",
	-- disable netrw at the very start of your init.lua
	leaded_netrw = 1,
	loaded_netrwPlugin = 1,
}

for key, value in pairs(global_options) do
	vim.g[key] = value
end

local options = {
	cursorline = true,
	-- Set line numbers.
	nu = true,
	-- Make the line numbers relative.
	rnu = true,
	list = true,
	-- to make the cursor a thick block
	-- guicursor = ""
	expandtab = true,
	smarttab = true,
	smartindent = true,
	showmode = false,
	-- because of this when i copy and paste something neovim just automatically indent the way that i dont like
	autoindent = false,
	swapfile = false,
	backup = false,
	hlsearch = false,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	splitbelow = true,
	splitright = true,
	wrap = false,
	-- set termguicolors to enable highlight groups
	termguicolors = true,
	hidden = true,
	number = true,
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	updatetime = 50,
	guifont = "iosevka:h17",
	-- set default background to dark mode
	background = "dark",
	cursorlineopt = "number",
	fileencoding = "utf-8",
	-- enable mouse support (although rarely use it)
	mouse = "a",
	listchars = { tab = "󰇙 ", trail = "·", nbsp = "␣", eol = "↵" },
	-- better completion experience
	completeopt = { "menuone", "noselect", "menu" },

	-- to make clipboard support possible (turns out i have to disable this in WSL2) see `:help cliboard.provider`
	-- clipboard = "unnamedplus",

	-- thanks to @tjdevries
	laststatus = 3,
}

for key, value in pairs(options) do
	vim.opt[key] = value
end
