return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')

        telescope.setup({
            mappings = {
                n = {
                    -- find files within current directory
                    ["<leader>ff"] = builtin.find_files,
                    -- find string in current working directory as you type
                    ["<leader>fs"] = builtin.live_grep,
                    -- find string under cursor in current working directory
                    ["<leader>fc"] = builtin.grep_string,
                    -- list open buffers in current neovim instance
                    ["<leader>fb"] = builtin.buffers,
                    -- list available help help_tags.
                    ["<leader>fh"] = builtin.help_tags,
                    -- list saved git files.
                    ["<leader>fg"] = builtin.git_files,
                    -- list keymaps
                    ["<leader>fk"] = builtin.keymaps,
                }
            }
        })

        vim.api.nvim_buf_create_user_command(0, "Config", function(_)
            builtin.find_files({
                theme = "default",
                cwd = "~/nix-dotfiles/"
            })
        end, { desc = "Go to dotfiles" })
    end,
}
