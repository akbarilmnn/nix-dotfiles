return {
    "tjdevries/express_line.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        local extensions = require("el.extensions")
        local subscribe = require("el.subscribe")
        local builtin = require("el.builtin")
        local sections = require("el.sections")

        local generator = function()
            local segments = {}

            table.insert(segments, extensions.mode)
            table.insert(segments, " ")
            table.insert(
                segments,
                subscribe.buf_autocmd("el-git-branch", "BufEnter", function(win, buf)
                    local branch = extensions.git_branch(win, buf)
                    if branch then
                        return branch
                    end
                end)
            )
            table.insert(
                segments,
                subscribe.buf_autocmd("el-git-changes", "BufWritePost", function(win, buf)
                    local changes = extensions.git_changes(win, buf)
                    if changes then
                        return changes
                    end
                end)
            )
            table.insert(segments, sections.split)
            table.insert(
                segments,
                subscribe.buf_autocmd("el_file_icons", "BufRead", function(_, buffer)
                    return extensions.file_icon(_, buffer)
                end)
            )
            table.insert(segments, " ")
            table.insert(segments, builtin.file)
            table.insert(segments, sections.split)
            -- [[
            --table.insert(segments, "[")
            --table.insert(segments, builtin.line_with_width(3))
            --table.insert(segments, ":")
            --table.insert(segments, builtin.column_with_width(2))
            --table.insert(segments, "]")
            -- ]]
            table.insert(segments, "%y")
            table.insert(segments, "[ln %l: col %c]")

            return segments
        end

        require("el").setup({
            generator = generator,
        })
    end,
}
