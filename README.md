# Documentation for My (PDE) Personalized Development Environment. 

# Status
WIP (always).

## Tools 

### OS 
I'm curently using `MacOS` as my daily driver operating system 

### Package Manager
For package management, `homebrew` is my choice.`homebrew` is simple, has a lot of up-to-date packages, easy to install and uninstall.
Please go [here](https://brew.sh/) to read `homebrew`'s homepage.


### Shell

Currently i'm using `fish` shell in WSL. And i like to install `fish` from [source](https://github.com/fish-shell/fish-shell).
The dependencies needed for `fish` are defined in the dependencies section.

#### Installation
Below are the steps to build fish from source

```sh
# Clone down fish repo
git clone https://github.com/fish-shell/fish-shell
# go into the locally installed repo
cd fish-shell
# build fish using `cargo` with `release` version to make it fast.
cargo build --release
# move the binary into your path.
mv target/release/fish ~/.cargo/bin/
# edit the `/etc/shells` file and add the path to your fish shell with your editor of choice
sudo nano /etc/shells 
# change your default shell into `fish` 
chsh -s $(which fish)
# restart your terimnal. and Done!
```


### Prompt

Obviously, any shell with it's default prompt is not pleasing to my eye. So, let's install one. Currently `starship` is my go to prompt
because it is very customizable. Please go [here](https://starship.rs/) to read `starship`'s homepage.

#### Installation
To install `starship` prompt, you can install it many ways, but im using `homebrew` just to be simple.
```sh
# make sure to update homebrew
brew update

# install starship prompt 
brew install starship
```

or you can build it from source (because you hate yourself) using `cargo`

```sh
cargo install --locked starship
```

After installing starship, make sure to use the starship prompt when your shell starts up
In the case of `fish` shell, add this line of code (usually at the end of the file) to your shell configuration file

```fish
starship init fish | source
```

The last part is to configure the prompt itself, you can customize it by visiting [here](https://starship.rs/config/).
Navigate to the `starship` folder in this repository and copy the `starship.toml` file. After that, export STARSHIP_CONFIG
environment variable with the path you put that toml file into your shell configuration. In the case of `fish`, please run:

```fish
set -gx STARSHIP_CONFIG="/path/to/config_file"
```
### Navigation
Navigating around your terminal is a frequent task, it would be nice if the defualt `cd` command can have shortcuts and 
fuzzy-finding all possible path you have been. Fortunately, there is [`zoxide`](https://github.com/ajeetdsouza/zoxide).

#### Installation
To install `zoxide` your can install using this command 

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

or using `homebrew`

```sh
brew install zoxide
```

or lastly install using `cargo`

```sh
cargo install --locked zoxide
```
It is recommended to install `fzf` alongside `zoxide` to increase `zoxide`'s functionality.

After installing `zoxide` you need to activate it at startup in order to work. In the case of `fish` shell, add this line of code
to your fish configuration file.

```fish
zoxide init fish | source
```

### Text Editor
I'm Currently using `neovim` as my main text editor, because it's very customizable to suit your needs.

#### Installation
To install `neovim`, rather than installing it from source, you should install it via `homebrew`
```sh
brew install neovim
```

To tweak `neovim`, see `EDITOR.md`

### GUI apps

These are my currently installed GUI apps on MacOS from `homebrew`, `.dmg` files and `.pkg` files 

- `alacritty`: Fast GPU-accelerated terminal emulator 
- `aldente`: battery limiter/optimization app
- `DaVinci Resolve`: video editor
- `Docker Desktop`: GUI app for managing `docker` containers
- `Raycast`: `spotlight` search on steroids
- `discord`: chat app + hanging out
- `WhatsApp`: chat app
- `zoom`: meetings 
- `dropover`: free `yoink` alternative in MacOS. Basically a shelf where dragged files reside
- `KeyCastr`: add overlay whenever a certain or any key is pressed
- `LocalSend`: send files via Wi-Fi 
- `PearCleaner`: clean files fully
- `protonVPN`: fast free VPN that offers a range of servers
- `vanilla`: hide menu bar icons in MacOS
- `vlc`: verstile media player
- `zed`: lightweight, fast, customizable GUI text editor
- `zen`: aesthetically pleasing modern browser based on `firefox`

### CLI apps

These are my currently installed CLI apps installed using `homebrew` and `cargo`

#### HomeBrew CLI apps
- `atuin`: improved searching commands in your shell
- `bat`: Replacement for `cat` command with syntax highlighting and pager
- `btop`: Pretty terminal based resource monitor 
- `cairo`: libarary to render font (used for creating animation using `manim`)
- `clipboard`: Clipboard manager (Not really used, because there are native MacOS clipboard manager)
- `cmake`: C/C++ build tool
- `dust`: Tree-like disk usage visualizer
- `dysk`: Pretty display of filesystems information. (for linux only)
- `entr`: Watch files and run commands when files change
- `eza`: Replacement for `ls` command with icons and colors
- `fd`: Replacement for `find` command with easier use
- `fish`: Shell for your terminal
- `fzf`: Fuzzy finder over all things
- `git-delta`: Replacement for `git diff` with prettier output
- `gum`: A tool to make glamorous shell scripts
- `git`: Version Control System
- `hexyl`: Terminal based hex editor
- `jq`: Query json objects
- `lazygit`: Terminal user interface for `git`
- `neovim`: Terminal text editor
- `onefetch`: `neofetch` alternative
- `procs`: A prettier view to see running processes 
- `ripgrep`: Replacement for `grep` command with easier use
- `rm-improved`: Replacement for `rm` command with an undo command
- `stow`: Symlink dotfiles to target directory
- `sd`: Replacement for `sed` command with easier use
- `serie`: A prettier view too see git commits 
- `starship`: Customizable shell prompt
- `tealdeer`: summarize what a command can do
- `tmux`: terminal multiplexer (run multiple terminal sessions in one terminal window)
- `tree`: tree-like visualization of a filesystem
- `xh`: User-friendly Terminal HTTP client
- `yazi`: Terminal file manager
- `zip`: Compress multiple files into an archive 
- `zoxide`: Replacement for `cd` command with easier use

#### Rust (cargo) CLI apps
- `cargo-asm@0.2.49`: show assembly output of a given function

## Setup

Make sure you have `brew` installed in order to install all development tools.

From the root directory of this repository, run this command to install all things in the `Brewfile`.

```sh
brew bundle install --file=Brewfile
```

After that, use `stow` to symlink all dotfiles to the preffered direcotry (i like to put it on my `~/.config` directory) by running this command.
make sure the target directory is empty or is there is no conflict of files i.e in your current `~/.config` directory, make sure there
is not a single file or directory that has the same name. If there is a conflict, you either have to delete that conflicted file/directory or
if you think the current file is better, you should add the `--adopt` flag in `stow`. for example, if there is a file in `~/.config/foo` 
and you have another version of `foo` in the cloned repo `~/cloned-dotfiles/foo`. When you are stowing `~/cloned-dotfiles/foo` into `~/.config/foo` 
would cause a conflict. if you use the `--adopt` flag, the contents of `~/cloned-dotfiles/foo` will be overwritten to what is inside `~/.config/foo`

```sh
stow --dir . --target ~/.config
```

## Miscellaneous

if you want to properly enable undercurl in `alacritty`, make sure you download into [`alacritty terminfo file`](https://github.com/alacritty/alacritty/blob/master/extra/alacritty.info)
enable the terminfo file using this command.

```sh 
tic -xe alacritty,alacritty-direct extra/alacritty.info
```

set the `$TERM` environment variable in your shell into alacritty 

also disable spellcheck in neovim.

```lua
vim.opt.spell = false

```
