vim.api.nvim_create_user_command("Dotfiles", function()
	require("telescope.builtin").find_files({
		cwd = "~/.config/nvim",
	})
end, {})
