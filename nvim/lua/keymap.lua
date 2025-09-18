local set_keymap = function(mode, key_bindings, cmd, desc)
	vim.keymap.set(mode, key_bindings, cmd, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end

-- [[
-- 		Insert Mode Keymaps
-- ]]
set_keymap("i", "jj", "<Esc>", "shortcut to normal mode")
-- [[
-- 		Insert Mode Keymaps
-- ]]

-- [[
-- 		Normal Mode Keymaps
-- ]]
set_keymap("n", "<leader>s", "<cmd>w<cr>", "shortcut to save a file")
set_keymap("n", "<leader>q", "<cmd>wq<cr>", "shortcut to save and quit a file")
set_keymap("n", "<leader>v", "<C-v>", "short to go to visual mode")
set_keymap("n", "<leader>e", "<cmd>q!<cr>", "shortcut to quit without saving anything")
set_keymap("n", "<M-n>", "<cmd>cnext<cr>", "go to next quickfix list item")
set_keymap("n", "<M-p>", "<cmd>cprevious<cr>", "go to previous quickfix list item")
set_keymap("n", "<M-x>", "<cmd>cclose<cr>", "close quickfix list")
set_keymap("n", "<leader>x", "<cmd>bwipeout<cr>", "close buffer")
set_keymap("n", "<C-h>", "<cmd>wincmd h<cr>", "go right to the next panes")
set_keymap("n", "<C-j>", "<cmd>wincmd j<cr>", "go down to the next panes")
set_keymap("n", "<C-k>", "<cmd>wincmd k<cr>", "go up to the next panes")
set_keymap("n", "<C-l>", "<cmd>wincmd l<cr>", "go left to the next panes")
set_keymap("n", "<C-q>d", "<cmd><cr>", "go left to the next panes")
-- [[
-- 		Normal Mode Keymaps
-- ]]

-- [[
-- 		Visual Mode Keymaps
-- ]]
set_keymap("v", "J", ":m '>+1<cr>gv=gv", "move a block of code up")
set_keymap("v", "K", ":m '<-2<cr>gv=gv", "move a block of code down")
set_keymap("v", "<", "<gv", "move a block of code into the left")
set_keymap("v", ">", ">gv", " move a block of code into the right")
set_keymap("n", "<C-u>", "<C-u>zz", "go to half of the file upward and centers the position of the cursor")
set_keymap("n", "<C-d>", "<C-d>zz", "go to half of the file downward and centers the position of the cursor")
-- [[
-- 		Visual Mode Keymaps
-- ]]

-- keymaps for better pane navigation
