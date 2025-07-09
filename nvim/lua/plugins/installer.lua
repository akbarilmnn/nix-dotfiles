return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "󰏗",
                    package_pending = "󰏔",
                    package_uninstalled = "󱧖",
                },
            },
        })
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
            "jdtls",
        }
        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
        })
    end
}
