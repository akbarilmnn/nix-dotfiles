{ config, pkgs, nixvim, ... }:
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
# for prettier prompt
			pkgs.starship
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
# terminal of choice if i happen to use a linux distro
			pkgs.wezterm
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
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;	
		shellAliases = {
			ls = "eza -l --icons";
			la = "eza -la --icons";
			cat = "bat";
			rm = "rip";
		};
		initExtra = ''
			eval "$(fzf --zsh)"
			eval "$(zoxide init zsh)"
		'';
	};
	
	# enable starship prompt to make terminal prettier.
	programs.starship = {
		enable = true;
	};

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

	# configure neovim with nix.	
	programs.nixvim = {
		enable = true;	
		# global variables = (vim.g.*)
		globals = {
			mapleader = " ";
			maplocalleader = " ";
		};
		# options (vim.opt.*)
		opts = {
			cursorline = true;
			# to make the cursor a thick block
			# guicursor = ""
			expandtab = true;
			smarttab = true;
			shiftwidth = 4;
			softtabstop = 4;
			tabstop = 4;
			mouse = "a";
			smartindent = true;
			showmode = false;
			# because of this when i copy and paste something neovim just automatically indent the way that i dont like
			autoindent = false;

			swapfile = false;
			backup = false;

			hlsearch = false;
			incsearch = true;
			ignorecase = true;
			smartcase = true;

			updatetime = 100;

			splitbelow = true;
			splitright = true;
			wrap = false;
			fileencoding = "utf-8";
			termguicolors = true;
			hidden = true;
			number = true;
			# If i happen to use neovim GUI.
			# guifont = "iosevka:h17";

			# to make clipboard support possible;
			clipboard = "unnamedplus";
			relativenumber = true;
			list = true;
			listchars = {
				tab = "» ";
				trail = "·";
				nbsp = "␣"; 
				eol = "↵";
			};
			completeopt = [ "menuone" "noselect" ];
		};
		# colorscheme 
		colorscheme.gruvbox.enable = true;
	
		# auto groups 
		autoGroups = {
			utils = { clear = true; };
		};
		
		# auto commands 
		autoCmd = [
			{
				# highlight text on yank
				event = ["TextYankPost"];
				group = "utils";
				callback = {
					__raw = "function() vim.highlight.on_yank() end";
				};
			}
		];	
	
		# keymaps 
		keymaps = [
		{
			mode = "n";
			key = "<leader>s";
			action = "<cmd>w<cr>";
		}
		{
			mode = "n";
			key = "<leader>q";
			action = "<cmd>wq<cr>";
		}
		{
			mode = "n";
			key = "<leader>v";
			action = "<C-v>";
		}
		{
			mode = "n";
			key = "<leader>e";
			action = "<cmd>q!<cr>";
		}
		{
			mode = "n";
			key = "<leader>x";
			action = "<cmd>bdelete!<cr>";
		}
		{
			mode = "n";
			key = "<leader>n";
			action = "<cmd>bNext<cr>";
		}
		{
			mode = "n";
			key = "<leader>p";
			action = "<cmd>bprevious<cr>";
		}
		{
			mode = "i";
			key = "jj";
			action = "<Esc>";
		}
		{
			mode = "v";
			key = "J";
			action = ":m '>+1<cr>gv=gv";
		}
		{
			mode = "v";
			key = "k";
			action = ":m '<-2<cr>gv=gv";
		}
		{
			mode = "v";
			key = "<";
			action = "<gv";
		}
		{
			mode = "v";
			key = ">";
			action = ">gv";
		}
		{
			mode = "n";
			key = "<C-u>";
			action = "<C-u>zz";
		}
		{
			mode = "n";
			key = "<C-d>";
			action = "<C-d>zz";
		}
		{
			mode = "n";
			key = "<C-h>";
			action = "<cmd>wincmd h<cr>";
		}

		{
			mode = "n";
			key = "<C-j>";
			action = "<cmd>wincmd j<cr>";
		}
		{
			mode = "n";
			key = "<C-k>";
			action = "<cmd>wincmd j<cr>";
		}
		{
			mode = "n";
			key = "<C-l>";
			action = "<cmd>wincmd l<cr>";
		}
		{
			mode = "n";
			key = "<leader>ff";
			action = "<cmd>Telescope find_files<cr>";
		}
		{
			mode = "n";
			key = "<leader>fs";
			action = "<cmd>Telescope live_grep<cr>";
		}

		{
			mode = "n";
			key = "<leader>fc";
			action = "<cmd>Telescope grep_string<cr>";
		}
		{
			mode = "n";
			key = "<leader>fb";
			action = "<cmd>Telescope buffers<cr>";
		}
		{
			mode = "n";
			key = "<leader>fg";
			action = "<cmd>Telescope git_files<cr>";
		}
		{
			mode = "n";
			key = "<leader>fk";
			action = "<cmd>Telescope keymaps<cr>";
		}
		{
			mode = "n";
			key = "<leader>to";
			action = "<cmd>Oil --float<cr>";
		}
		{
			mode = "n";
			key = "<leader>ds";
			action = "require('notify').dismiss()";
			lua = true;	
		}
		];		
			
	};		
	
	# enable tmux with vi bindings.
	programs.tmux = {
		enable = true;
		keyMode = "vi":
	};
	
	programs.bash.enable = true;	 



# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
