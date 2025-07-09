# setting up important paths
export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# starship settings
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

# setting up essential env vars
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# setting up options
setopt HIST_SAVE_NO_DUPS 
