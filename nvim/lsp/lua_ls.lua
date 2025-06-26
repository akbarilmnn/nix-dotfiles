return {
    cmd = {
        "lua-language-server",
    },
    filetypes = {
        "lua",
    },
    root_markers = {
        ".git",
        ".luachecks",
        ".luarc.jsonc",
        ".stylua.toml",
        "selene.toml",
        "selene.yml",
        "stylua.yml",
    },
    single_file_support = true,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            }
        }
    }
}
