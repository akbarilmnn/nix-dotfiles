# load user-defined aliases
source $ZDOTDIR/.zaliases

# initialize autocompletion
autoload -U compinit; compinit

_comp_options+=(globdots) 

# additional options
bindkey -v
export KEYTIMEOUT=1

# evaluate experssions 
eval "$(starship init zsh)" # to make `zsh` use `starship` prompt.
eval "$(fzf --zsh)" # add more keybindings to zsh integrated with `fzf`.
eval "$(zoxide init zsh)" #  in order to replace `cd` with `zoxide`

# adding plugins
export PLUGINS_DIR="$ZDOTDIR/plugins"

# for zsh-completions
fpath=("$PLUGINS_DIR/zsh-completions/src" $fpath)

# exclusively for zsh-syntax-highlighting plugin
source "$PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# custom functions
function yz() { # for yazi
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -- "$tmp"
}
