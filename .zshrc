# where all my plugins live
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]] then
# create directory path in ZINIT_HOME envronment variable
	mkdir -p "$(dirname $ZINIT_HOME)"
# fetch zinit repository using `git`
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# startup scripts
# because i currently use powerlevel10k
# eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Alias
alias la='eza -la --icons'
alias ls='eza -l --icons'
alias rm='rip'
alias cat='bat'

# additional binary paths 
export PATH="$PATH:$HOME/.zig/bin"
export PATH="$PATH:$HOME/.omp"

alias omp='oh-my-posh'

# initialize oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/ompconfig.toml)"
# source the plugins 
source "${ZINIT_HOME}/zinit.zsh"

# a more complete vim keybindings 
# zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode


# if you want the cursor to be a block rather than a beam
#ZVM_CURSOR_STYLE_ENABLED=false

# essential plugins for any shell IMO.
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# Load and initialise completion system
autoload -Uz compinit
compinit

# vi or vim keybindings
bindkey -v

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
