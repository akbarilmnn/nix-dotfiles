local set_keymap = function(mode, key_bindings, cmd, desc)
	vim.keymap.set(mode, key_bindings, cmd, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

local lsp_keymap = function(keys, func, desc)
	if desc then
		desc = "LSP: " .. desc
	end

	vim.keymap.set("n", keys, func, { desc = desc })
end

-- write to file.
set_keymap("n", "<leader>s", "<cmd>w<cr>", "shortcut to save a file")
-- write and quite to a file.
set_keymap("n", "<leader>q", "<cmd>wq<cr>", "shortcut to save and quit a file")
-- go to visual mode easily.
set_keymap("n", "<leader>v", "<C-v>", "short to go to visual mode")
-- force quit.
set_keymap("n", "<leader>e", ":q!<cr>", "shortcut to quit without saving anything")
-- shortcut to go to prev and next buffers.
set_keymap("n", "<leader>n", "<cmd>bnext<cr>", "go to the next buffer")
set_keymap("n", "<leader>p", "<cmd>bprevious<cr>", "go to the previous buffer")
set_keymap("n", "<leader>x", "<cmd>bwipeout<cr>", "close buffer")
-- go to insert mode easily
set_keymap("i", "jj", "<Esc>", "shortcut to normal mode")
-- can move blocks of code by using visual mode.
set_keymap("v", "J", ":m '>+1<cr>gv=gv", "move a block of code up")
set_keymap("v", "K", ":m '<-2<cr>gv=gv", "move a block of code down")
-- indent a block of code from either right or left.
set_keymap("v", "<", "<gv", "move a block of code into the left")
set_keymap("v", ">", ">gv", " move a block of code into the right")
-- telescope keymaps
--set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "find files within current directory")
set_keymap("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", "find string in current working directory as you type")
set_keymap("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", "find string under cursor in current working directory")
set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "list open buffers in current neovim instance")
set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", "list available help help_tags.")
set_keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", "list git files.")
set_keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "list keymaps")

set_keymap("n", "<leader>ff", function()
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")
	local opts = {
		previewer = false,
		prompt_prefix = " ",
		hidden = true,
	}

	builtin.find_files(themes.get_dropdown(opts))
end, "find files within current directory")

-- horizontal keymaps
set_keymap("n", "<C-u>", "<C-u>zz", "go to half of the file upward and centers the position of the cursor")
set_keymap("n", "<C-d>", "<C-d>zz", "go to half of the file downward and centers the position of the cursor")

-- keymaps for better pane navigation
set_keymap("n", "<C-h>", "<cmd>wincmd h<cr>", "go right to the next panes")
set_keymap("n", "<C-j>", "<cmd>wincmd j<cr>", "go down to the next panes")
set_keymap("n", "<C-k>", "<cmd>wincmd k<cr>", "go up to the next panes")
set_keymap("n", "<C-l>", "<cmd>wincmd l<cr>", "go left to the next panes")

-- toggle file explorer
set_keymap("n", "<leader>-", "<cmd>Oil<cr>", "Toggle file explorer")

-- dismiss nvim.notify
set_keymap("n", "<leader>ds", '<cmd>lua require("notify").dismiss()<cr>', "dismiss nvim.notify")
