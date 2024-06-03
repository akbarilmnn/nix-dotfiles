{ config, pkgs,  ... }:
{
# see mynixos.com to see more configuration options.
# Home Manager needs a bit of information about you and the paths it should
# manage.
	home.username = "akbar";
	home.homeDirectory = "/home/akbar"; 

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
	home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
		home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello
# VCS
			pkgs.git
# bash replacement 
			pkgs.zsh
# for prettier prompt (disabled for as long as i use powerlevel10k)
			# pkgs.starship
# disk usage in rust
			pkgs.du-dust
# rusty `grep`
			pkgs.ripgrep 
# rusty `find`
			pkgs.fd
# fuzzy finder
			pkgs.fzf
# ls replacement 
			pkgs.eza
# cat replacement
			pkgs.bat
# cd replacement 
			pkgs.zoxide
# rm replacement 
			pkgs.rm-improved
# terminal multiplexer 
			pkgs.tmux 
# js runtime 
			pkgs.nodejs_18
# misc
# resource monitor
			pkgs.btop
# json query 
			pkgs.jq 
# convert dos to unix 
			pkgs.dos2unix 
# short man pages 
			pkgs.tealdeer
# keyboard utilities
			pkgs.wl-clipboard
# password manager 
			pkgs.pass
# process viewer
			pkgs.procs
# text editor 
			pkgs.neovim
# terminal of choice if i happen to use a linux distro
			pkgs.wezterm
# C compiler 
			pkgs.gcc
# unzip tarballs (idk why WSL Ubuntu doesn't have this by default)
			pkgs.unzip

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
			];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
	home.file = {
	".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/.zshrc";
	".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/.zshenv";
	".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/nvim";
	".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dotfiles/.vimrc";
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
	};

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/akbar/etc/profile.d/hm-session-vars.sh
#
	home.sessionVariables = {
# EDITOR = "emacs";
	};

	# configure git with desired aliases and configurations.	
	programs.git = {
		enable = true;
		userName = "akbar";
		userEmail = "akbarsmp27@gmail.com";
		aliases = {
			history = "log --oneline --graph --decorate";
		};
		extraConfig = {
			core.editor = "nvim";
			init.defaultBranch = "main";
		};
	};

	# configure zsh shell with desired plugins and aliases.
	programs.zsh = {
		enable = true;	
	};
	
	# enable starship prompt to make terminal prettier.
	# sometimes i'd like to change to powerlevel10k
	# programs.starship = {
	#	enable = true;
	# };

	# configure OpenSSH for git to use SSH instead of HTTP/HTTPS url.
	services.ssh-agent.enable = true;	
		
	programs.ssh = {
		enable = true;	
		matchBlocks.akbar = {
			host = "github.com";
			identityFile = "~/.ssh/id_ed25519";
		};
	};
	
	# configure wezterm.
	programs.wezterm = {
		enable = true;
		extraConfig = ''
			local wezterm = require("wezterm")

			local config = {}

		if wezterm.config_builder then
			config = wezterm.config_builder()
				end

				-- sets the colorscheme of wezterm
				config.color_scheme = "Gruvbox dark, hard (base16)"

				-- sets font of wezterm
				-- available in my system
				-- JetBrainsMono Nerd Font
				-- FiraCode Nerd Font
				-- Symbols Nerd Font
				-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = false })
				config.font = wezterm.font_with_fallback({
						{
						family = "JetBrainsMono Nerd Font",
						weight = "Bold",
						italic = false,
						},
						"Symbols Nerd Font",
						})
		config.font_size = 12.75
			-- disable tabs & scrollbar
			config.enable_tab_bar = false
			config.enable_scroll_bar = false

			-- make wezterm load Ubuntu WSL terminal rather than windows powershell terminal (recommended if using WSL)
			-- config.default_domain = "WSL:Ubuntu"

			-- sets the transparecy.
			config.window_background_opacity = 0.85

			-- sets prompt to have no padding.
			config.window_padding = {
				left = 0,
				right = 0,
				top = 0,
				bottom = 0,
			}

		-- disables the beeping noises
			config.audible_bell = "Disabled"

			return config

			'';
	};

			
	
	# enable tmux with vi bindings.
	programs.tmux = {
		enable = true;
		keyMode = "vi";
	};
	



# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
