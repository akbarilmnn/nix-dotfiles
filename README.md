# Documentation for My (PDE) Personalized Development Environment. 

# Status
WIP (always).

## Tools 

### OS 
I'm curently using `windows` as my daily driver operating system. But when i code, i use `WSL` 

#### Installation
Head over to [microsoft's site](https://learn.microsoft.com/en-us/windows/wsl/install) and install WSL.

#### Update Packages 
After installation, please update your package repository and your system as well.
```
$ sudo apt-get update -y && sudo apt-get upgrade -y
```


### Terminal 

#### Installation
Download the .msi [file](https://github.com/alacritty/alacritty/releases/download/v0.15.1/Alacritty-v0.15.1-installer.msi) for windows.

##### Footnote 
There seems to be an [issue](https://www.reddit.com/r/tmux/comments/1fluve2/comment/lo61r4o/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
when using WSL2 in alacritty + tmux in windows. In order to fix this, you need to find the up-to-date `conpty.dll` and `OpenConsole.exe`. To do this, 
simply install [wezterm](https://wezterm.org/), go to the installation directory, copy those two files and put it inside install folder of alacritty, remove wezterm.



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

### CLI apps
These are my currently installed CLI apps installed using `homebrew` and `cargo`

#### HomeBrew CLI apps
- `atuin`: improved searching commands in your shell
- `bat`: Replacement for `cat` command with syntax highlighting and pager
- `btop`: Pretty terminal based resource monitor 
- `clipboard`: Clipboard manager
- `cmake`: C/C++ build tool
- `dust`: Tree-like disk usage visualizer
- `dysk`: Pretty display of filesystems information
- `entr`: Watch files and run commands when files change
- `eza`: Replacement for `ls` command with icons and colors
- `fd`: Replacement for `find` command with easier use
- `fish`: Shell for your terminal
- `fzf`: Fuzzy finder over all things
- `git-delta`: Replacement for `git diff` with prettier output
- `git`: Version Control System
- `hexyl`: Terminal based hex editor
- `jq`: Query json objects
- `lazygit`: Terminal user interface for `git`
- `neovim`: Terminal text editor
- `onefetch`: `neofetch` alternative
- `procs`: A prettier view to see running processes 
- `ripgrep`: Replacement for `grep` command with easier use
- `rm-improved`: Replacement for `rm` command with an undo command
- `sd`: Replacement for `sed`command with easier use
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
