-- set map leader here before lazy loads...
vim.g.mapleader = " "
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set default background to dark mode
vim.o.background = "dark"

-- better completion experience
vim.opt.completeopt = { "menuone", "noselect", "menu" }

local options = {
    cursorline = true,
    cursorlineopt = 'number',
    -- to make the cursor a thick block
    -- guicursor = ""
    expandtab = true,
    smarttab = true,
    shiftwidth = 4,
    softtabstop = 4,
    tabstop = 4,
    mouse = "a",
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

    updatetime = 50,

    splitbelow = true,
    splitright = true,
    wrap = false,
    fileencoding = "utf-8",
    termguicolors = true,
    hidden = true,
    number = true,
    guifont = "iosevka:h17",

    -- to make clipboard support possible (turns out i have to disable this in WSL2) see `:help cliboard.provider`
    -- clipboard = "unnamedplus",
}

vim.wo.relativenumber = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↵" }


-- remove carriage return character (this is handy because i use wsl)
vim.api.nvim_create_user_command("Rmcrlf", function(_)
    vim.cmd([[%s/\r/ /g ]])
end, {})

-- autocmmand for highlight a block of text on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight after yank",
    group = vim.api.nvim_create_augroup("utils", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

for key, value in pairs(options) do
    vim.opt[key] = value
end
