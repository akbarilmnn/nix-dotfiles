return {
    -- Main plugins to configure each LSP server.
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Integration for completion
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        -- Installer for LSP servers, formatters and linters.
        {
            "williamboman/mason.nvim",
            opts = {
                ui = {
                    border = "rounded",
                    icons = {
                        package_installed = "󰏗",
                        package_pending = "󰏔",
                        package_uninstalled = "󱧖",
                    },
                }
            }
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                local ensure_installed = {
                    -- lua setup
                    "lua_ls",
                    -- python setup
                    "pyright",
                    "ruff",
                    -- javascript/typescript setup
                    "denols",
                    -- zig 
                    "zls",
                    -- C family
                    "clangd",
                    -- Java
                    "java_language_server",
                }
                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                local handlers = {
                    function(server_name) 
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,
                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end
                }
                require("mason-lspconfig").setup({
                    ensure_installed = ensure_installed,
                    handlers = handlers
                })
            end,
        },
    },
}
