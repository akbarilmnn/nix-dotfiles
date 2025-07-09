-- declare all
local global_options = {
	--	-- set map leader here before lazy loads...
	mapleader = " ",
	--	-- disable netrw at the very start of your init.lua
	leaded_netrw = 1,
	loaded_netrwPlugin = 1,
	-- for WSL2
	--clipboard = {
	--	name = "WslClipboard",
	--	copy = {
	--		["+"] = "clip.exe",
	--		["*"] = "clip.exe",
	--	},
	--	paste = {
	--		["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	--		["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	--	},
	--	cache_enabled = 0,
	--},
	--clipboard = {
	--	name = "win32yank",
	--	copy = {
	--		["+"] = "win32yank.exe -i --crlf",
	--		["*"] = "win32yank.exe -i --crlf",
	--	},
	--	paste = {
	--		["+"] = 'win32yank.exe -o -lf',
	--		["*"] = 'win32yank.exe -o -lf',
	--	},
	--	cache_enabled = 0,
	--},
}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

for key, value in pairs(global_options) do
	vim.g[key] = value
end

local options = {
	spell = true,
	spelllang = { "en_us" },
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
	smartindent = false,
	cindent = false,
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
	listchars = { tab = "󰇙 ", trail = "·", nbsp = "␣", eol = "󱞥" },
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
