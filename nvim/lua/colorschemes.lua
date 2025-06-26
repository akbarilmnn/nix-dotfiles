-- sorted list of colorschemes
local colorschemes = {
            "blue",
            "carbonfox",
            "catppuccin",
            "catppuccin-frappe",
            "catppuccin-latte",
            "catppuccin-macchiato",
            "catppuccin-mocha",
            "darkblue",
            "dawnfox",
            "default",
            "delek",
            "desert",
            "duskfox",
            "elflord",
            {
                name = "gruvbox-dark",
                colorscheme = "gruvbox-material",
                before = [[
                    vim.g.gruvbox_material_foreground = "mix" 
                    vim.g.gruvbox_material_background =  "hard"
                    vim.g.gruvbox_material_ui_contrast = "high" 
                    vim.g.gruvbox_material_float_style = "bright" 
                    vim.g.gruvbox_material_statusline_style = "bright" 
                    vim.g.gruvbox_material_cursor = "auto" 
                ]], 
            },
            "habamax",
            "industry",
            "kanagawa",
            "kanagawa-dragon",
            "kanagawa-lotus",
            "kanagawa-wave",
            "koehler",
            "lunaperche",
            "material",
            "material-darker",
            "material-deep-ocean",
            "material-later",
            "material-oceanic",
            "material-palenight",
            "morning",
            "murphy",
            "nightfox",
            "onedark",
            "pablo",
            "peachpuff",
            "quiet",
            "retrobox",
            "ron",
            "shine",
            "slate",
            "sorbet",
            "torte",
            "unokai",
            "vim",
            "vscode",
            "wildcharm",
            "zaibatsu",
            "zellner",
}

return colorschemes;
