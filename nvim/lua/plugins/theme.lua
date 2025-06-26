return {
    "zaldih/themery.nvim",
    keys = {
        {"<leader>tm", "<cmd>Themery<cr>", "n", desc = "all themes installed"},
    },
    dependencies = {
        {"catppuccin/nvim", name = "catppuccin"},
        {"rebelot/kanagawa.nvim"},
        {"folke/tokyonight.nvim"},
        {"EdenEast/nightfox.nvim"},
        {"Mofiqul/vscode.nvim"},
        {"marko-cerovac/material.nvim"},
        {"navarasu/onedark.nvim"},
        {"sainnhe/gruvbox-material"},
    },
    lazy = false,
    config = function()
        local themery = require("themery")
        local colorschemes = require("colorschemes")

        themery.setup({
            themes = colorschemes,
            livePreview = true,
        });
    end
}
