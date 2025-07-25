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
        icons = {
            kinds = {
                symbols = {
                    Array = '󰅪 ',
                    BlockMappingPair = '󰅩 ',
                    Boolean = ' ',
                    BreakStatement = '󰙧 ',
                    Call = '󰃷 ',
                    CaseStatement = '󱃙 ',
                    Class = ' ',
                    Color = '󰏘 ',
                    Constant = '󰏿 ',
                    Constructoe = " ",
                    ContinueStatement = '→ ',
                    Copilot = ' ',
                    Declaration = '󰙠 ',
                    Delete = '󰩺 ',
                    DoStatement = '󰑖 ',
                    Element = '󰅩 ',
                    Enum = ' ',
                    EnumMember = ' ',
                    Event = ' ',
                    Field = ' ',
                    File = '󰈔 ',
                    Folder = '󰉋 ',
                    ForStatement = '󰑖 ',
                    Function = " ",
                    GotoStatement = '󰁔 ',
                    Identifier = '󰀫 ',
                    IfStatement = '󰇉 ',
                    Interface = ' ',
                    Keyword = "",
                    List = '󰅪 ',
                    Log = '󰦪 ',
                    Lsp = ' ',
                    Macro = '󰁌 ',
                    MarkdownH1 = '󰉫 ',
                    MarkdownH2 = '󰉬 ',
                    MarkdownH3 = '󰉭 ',
                    MarkdownH4 = '󰉮 ',
                    MarkdownH5 = '󰉯 ',
                    MarkdownH6 = '󰉰 ',
                    Method = '󰆧 ',
                    Module = '󰏗 ',
                    Namespace = '󰅩 ',
                    Null = '󰢤 ',
                    Number = '󰎠 ',
                    Object = '󰅩 ',
                    Operator = '󰆕 ',
                    Package = '󰆦 ',
                    Pair = '󰅪 ',
                    Property = " ",
                    Reference = '󰦾 ',
                    Regex = ' ',
                    Repeat = '󰑖 ',
                    Return = '󰌑 ',
                    RuleSet = '󰅩 ',
                    Scope = '󰅩 ',
                    Section = '󰅩 ',
                    Snippet = '󰩫 ',
                    Specifier = '󰦪 ',
                    Statement = '󰅩 ',
                    String = '󰉾 ',
                    Struct = ' ',
                    SwitchStatement = '󰺟 ',
                    Table = '󰅩 ',
                    Terminal = ' ',
                    Text = " ",
                    Type = ' ',
                    TypeParameter = " ",
                    Unit = ' ',
                    Value = '󰎠 ',
                    Variable = " ",
                    WhileStatement = '󰑖 ',

                }
            }
        }
    }
}
