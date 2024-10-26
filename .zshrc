
## Zinit package manager setup ##

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]] then
# create directory path in ZINIT_HOME envronment variable
	mkdir -p "$(dirname $ZINIT_HOME)"
# fetch zinit repository using `git`
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source the plugins 
source "${ZINIT_HOME}/zinit.zsh"


### Plugins downloaded by `zinit` ###
# a more complete vim keybindings in zsh or use simple vim keybidnings with `bindkey -v`
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
ZVM_CURSOR_STYLE_ENABLED=false

# essential plugins for any shell IMO.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# cool fzf-tab preview 
zinit light Aloxaf/fzf-tab

# Load and initialise completion system
autoload -U compinit && compinit


### Plugins downloaded by `zinit` ###

## Zinit package manager setup ##


## common aliases ##
alias la='eza -la --icons --tree --level 1'
alias ls='eza -l --icons --tree --level 1'
alias rm='rip'
alias cat='bat'
alias omp='oh-my-posh'
## common aliases ##

## additional binary paths ##
export PATH="$PATH:$HOME/.zig/bin"
export PATH="$PATH:$HOME/.omp"
## additional binary paths ##


## additional help env vars for interacting with windows (host machine) ##
export WINDIR="/mnt/c"
export WINUSERDIR="$WINDIR/Users/akbar"
export WALLPAPERDIR="$WINUSERDIR/Pictures/wallpapers"
## additional help env vars for interacting with windows (host machine) ##

## startup scripts ##
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
# initializes oh my posh with configuration specified by path.
eval "$(oh-my-posh init zsh --config $HOME/ompconfig.toml)"
## startup scripts ##

# if you want the cursor to be a block rather than a beam
#ZVM_CURSOR_STYLE_ENABLED=false

# set history size and set how much lines of command the history file i wanted to save
HISTSIZE=3500
HISTFILE=~/.zsh_history
# erase duplicate text in history file 
HISTDUP=erase
SAVEHIST=$HISTSIZE

# make zsh append any command i type into the history file.
setopt appendhistory
# make existing history file shareable to multiple terminal sessions.
setopt sharehistory
# 
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

## additional completion configuraiton ##
# make completions case-insensitive.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# make completions has colors.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


 
## additional completion configuraiton ##


