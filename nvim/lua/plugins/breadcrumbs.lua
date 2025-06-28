return {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    --keys = {
    --    { "<leader>dp", 'require("dropbar.api").pick',                mode = { "n" }, desc = "Pick symbols in winbar" },
    --    { "[;",         'require("dropbar.api").goto_context_start',  mode = { "n" }, desc = "Go to start of current context" },
    --    { "];",         'require("dropbar.api").select_next_context', mode = { "n" }, desc = "Select next context" },
    --},
    opts = {
    },
}
