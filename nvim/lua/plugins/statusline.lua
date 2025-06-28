return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                }
            },
            sections = {
                -- lualine_a = {'mode'},
                -- lualine_b = {'branch', 'diff', 'diagnostics'},
                -- lualine_c = {'filename'},
                -- lualine_x = {'encoding', 'fileformat', 'filetype'},
                -- lualine_y = {'progress'},
                -- lualine_z = {'location'}
                lualine_a = {
                    {
                        'mode'
                    },
                    {
                        'branch',
                        icon = ""
                    },
                },
                lualine_b = {
                    {
                        'diff',
                        colored = true,
                        symbols = {
                            added = "󰷫 ",
                            modified = "  ",
                            removed = "󰷨 ",
                        }
                    }
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        newfile_status = true,
                        path = 3,
                        symbols = {
                            modified = '  ', -- Text to show when the file is modified.
                            readonly = '󰷊 ', -- Text to show when the file is non-modifiable or readonly.
                            unnamed = '󰡯 ', -- Text to show for unnamed buffers.
                            newfile = '󰎜 ', -- Text to show for newly created file before first write
                        }
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            hint = ' ',
                            info = '',
                        }
                    }
                },
                lualine_y = {
                    {
                        "lsp_status",
                        icon = " "
                    }
                },
                lualine_z = {
                    {
                        "location"
                    }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                -- lualine_c = {'filename'},
                -- lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}
