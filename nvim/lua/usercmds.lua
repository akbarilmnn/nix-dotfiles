-- remove carriage return character. (this is handy because i use wsl)
vim.api.nvim_create_user_command("Rmcrlf", function(_)
	vim.cmd([[%s/\r/ /g ]])
end, {})

-- Create a command `:Format` local to the LSP buffer.
--vim.api.nvim_create_user_command("Format", function(_)
--	vim.lsp.buf.format()
--end, { desc = "Format current buffer with LSP" })

vim.api.nvim_create_user_command("NvimConfig", function(_)
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")

	local opts = {
		previewer = false,
		hidden = true,
		cwd = vim.fn.stdpath("config"),
	}

	builtin.find_files(themes.get_dropdown(opts))
end, { desc = "go to neovim config" })

vim.api.nvim_create_user_command("PluginFiles", function(_)
	local builtin = require("telescope.builtin")
	local themes = require("telescope.themes")

	local opts = {
		previewer = false,
		hidden = true,
		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
	}
	builtin.find_files(themes.get_dropdown(opts))
end, { desc = "go to neovim config" })
