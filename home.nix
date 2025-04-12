{ config, pkgs,  ... }:
{
# see mynixos.com to see more configuration options.
# Home Manager needs a bit of information about you and the paths it should
# manage.
	home.username = "serein";
	home.homeDirectory = "/home/serein"; 

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
# cycle: oh-my-zsh -> oh-my-posh -> starship.
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
# text editor 
			pkgs.neovim
# terminal of choice if i happen to use a linux distro
			# outdated, rather build from .deb files
			# pkgs.wezterm
# C compiler 
			# pkgs.gcc
# unzip tarballs (idk why WSL Ubuntu doesn't have this by default)
			pkgs.unzip
# command runners
			pkgs.just
			pkgs.cmake
			pkgs.gnumake
# event notify test runners
			pkgs.entr
# pdf utilities 
            pkgs.poppler_utils
# download files from google drive (curl and wget fails to do this)
            pkgs.gdown
# terminal file manager 
            pkgs.yazi
# prettier git diff
	    pkgs.delta
# git TUI 
	    pkgs.lazygit
# cool terminal messages 
	    pkgs.figlet
# make the cool terminal messages colorful
	    pkgs.lolcat
# xxd in rust
	    pkgs.hexyl 
# network scanner TUI
        pkgs.netscanner
# view prettier git logs
        pkgs.serie

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
	"${config.home.homeDirectory}/.config/zsh/.zaliases".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/.zaliases"
	"${config.home.homeDirectory}/.config/zsh/.zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/.zshrc";
	".zshenv".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/.zshenv";
	".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/nvim";
	".vimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/.vimrc";
	".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/.tmux.conf";
	".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/yazi";
	".config/starship".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/starship";
	# NOTE: sometimes switch to starship prompt
	# "ompconfig.toml".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/ompconfig.toml";
	".config/wezterm/wezterm.lua".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/wezterm.lua";
	".config/git/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/env/git/config";
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
	# change git config by creating config file in ~/.config/git/ rather than declaratively configure it.	

	# configure zsh shell with desired plugins and aliases.
	programs.zsh = {
		enable = true;	
	};	

	# configure OpenSSH for git to use SSH instead of HTTP/HTTPS url.
	services.ssh-agent.enable = true;	

# Let Home Manager install and manage itself.
	programs.home-manager.enable = true;
}
