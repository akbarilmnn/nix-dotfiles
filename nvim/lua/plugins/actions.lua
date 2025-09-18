return {
    "rachartier/tiny-code-action.nvim",
    keys = {
        {
            "<leader>ca",
            mode = { "n" },
            function()
                require("tiny-code-action").code_action()
            end,
            { noremap = true, silent = false },
        }
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
    },
    event = "LspAttach",
    opts = {},
}
