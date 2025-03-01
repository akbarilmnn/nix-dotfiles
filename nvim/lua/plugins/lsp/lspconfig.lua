return {
    "neovim/nvim-lspconfig",
    init = function()
        -- define custom diagnostics icons.
        vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })
    end,
    dependencies = {
        -- tool to install LSP, formatters, linters, and DAPs.
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end,
        },
        -- installer for linters formatters and DAPs
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            config = function()
                require("mason-tool-installer").setup({
                    ensure_installed = {
                        "clang-format",
                        "prettierd",
                        "stylua",
                        "oxlint",
                    },
                })
            end,
        },
        -- tool to integrate mason.nvim and nvim-lspconfig.
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {
                        "lua_ls",
                        "rust_analyzer",
                        "zls",
                        "clangd",
                        "denols",
                        -- NOTE: these requires nodejs
                        "html",
                        "cssls",
                    },
                })
            end,
        },
        "Saghen/blink.cmp",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local mason_lsp = require("mason-lspconfig")

        local handlers = {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                })
            end,
            ["zls"] = function()
                lspconfig.zls.setup({
                    settings = {
                        zls = {
                            zig_exe_path = "/home/serein/.local/bin/zig/bin/zig",
                        },
                    },
                })
            end,
            ["pyright"] = function()
                local on_attach = function(client, _)
                    if client.name == "ruff_lsp" then
                        client.server_capabilities.hoverProvider = false
                    end
                end
                lspconfig.pyright.setup({
                    on_attach = on_attach,
                    settings = {
                        pyright = {
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                ignore = { "*" },
                            },
                        },
                    },
                })
            end,
        }
        mason_lsp.setup_handlers(handlers)
    end,
}
