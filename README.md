# a more organized dotfiles
This repo contains my dotfiles configured, specifically for WSL2 Ubuntu-24.04 ,using [nix's package manager](https://nixos.org/download).
I'm planning ahead to add shell scripts in `home.nix` with [gum](https://github.com/charmbracelet/gum) which is a great tool 
to create glamorous shell scripts.

# Status
WIP (always).

# Dependencies 
-   [Alacritty](https://alacritty.org) or any other terminal emulators that works in windows
-   [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
-   [zsh](https://github.com/zsh-users/zsh)
-   [nix](https://nixos.org/download)
-   [git](https://git-scm.com)
-   [home-manager](https://nix-community.github.io/home-manager)
# Setup 

# Install Alacritty
Download the .msi [file](https://github.com/alacritty/alacritty/releases/download/v0.15.1/Alacritty-v0.15.1-installer.msi) for windows.
after installing alacritty, copy the configuration files in this directory into your installation path for alacritty.

## Footnote 
There seems to be an [issue](https://www.reddit.com/r/tmux/comments/1fluve2/comment/lo61r4o/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
when using WSL2 in alacritty + tmux in windows. In order to fix this, you need to find the up-to-date `conpty.dll` and `OpenConsole.exe`. To do this, 
simply install [wezterm](https://wezterm.org/), go to the installation directory, copy those two files and put it inside install folder of alacritty, remove wezterm.

### Install WSL 
Head over to [microsoft's site](https://learn.microsoft.com/en-us/windows/wsl/install) and install WSL.

### Update Packages 
After installation, please update your package repository and your system as well.
```
$ sudo apt-get update -y && sudo apt-get upgrade -y
```

### Install Other shells
I personally use [zsh](https://github.com/zsh-users/zsh) with a package manager called [zinit](https://github.com/zdharma-continuum/zinit) which is going to be installed later on.
```
$ sudo apt-get install zsh 
``` 

Also, make sure `git` is installed.
```
$ sudo apt-get install git
```

### Install and Configure Nix's Package Manager 
This is the meat and potatoes of this setup because it handles, almost, everything. Go over to [nix](https://nixos.org/download) anddownload the appropriate platform.

For WSL with `systemd` enabled
```
$ sh <(curl -L https://nixos.org/nix/install) --daemon
```

After executing that script, you will be prompted to continue the installation.
After that was successfully installed, open a new terminal session (nix should be installed).

Enable the experimental features of nix package manager
```
mkdir -p ~/.config/nix
cd ~/.config/nix
# This enables the experimental-features and also use all cores when building nix packages.
echo "experimental-features = nix-command flakes\nmax-jobs = auto" >> nix.conf
```
### Add the appropriate Home Manager channel 
for example this is the master or the unstable channel 
```
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
```

### Install Home Manager
```
$ nix-shell '<home-manager>' -A install
```

### Clone This Repository
Clone this repository and rename the install directory whatever you like (i choose env).
```
git clone https://github.com/akbarilmnn/nix-dotfiles.git env/
# go to env 
cd env/
# home-manager setup
home-manager switch --flake .
```

close your shell and you are done.
