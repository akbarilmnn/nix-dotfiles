local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

--config.background = {
--    {
--	source = {
--		File = "C:\\Users\\Lenovo\\Downloads\\unsplash.jpg",
-- 	}
--    }
--}

-- sets the colorscheme of wezterm
config.color_scheme = "Gruvbox dark, hard (base16)"

-- sets font of wezterm
-- available in my system
-- JetBrainsMono Nerd Font
-- FiraCode Nerd Font
-- Symbols Nerd Font
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = false })
config.font = wezterm.font_with_fallback({
    {
        family = "JetBrainsMono Nerd Font",
        weight = "Bold",
        italic = false,
    },
    "Symbols Nerd Font",
})
config.font_size = 12.75
-- disable tabs & scrollbar
config.enable_tab_bar = false
config.enable_scroll_bar = false

-- make wezterm load Ubuntu WSL terminal rather than windows powershell terminal.
config.default_domain = "WSL:Ubuntu"

-- sets the transparecy.
config.window_background_opacity = 0.85

-- sets prompt to have no padding.
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

-- disables the beeping noises
config.audible_bell = "Disabled"

return config
