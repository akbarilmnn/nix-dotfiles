if status is-interactive
    # setup `vim` keybindings in fish
    fish_vi_key_bindings

    # when there is a command in `$PATH` `fish` will highlight it in `green`
    set fish_color_command "green"

    # there are settings in `alacritty` and `fish` to make the cursor shaped like a block. This is the configuration for `fish` 
    set -gx fish_cursor_default block
    set -gx fish_cursor_insert block
    set -gx fish_cursor_replace block
    set -gx fish_cursor_replace_one block
    set -gx fish_cursor_visual block

    # these are the aliases
    alias ls="eza --icons --tree --level 1"
    alias vlc="open -a VLC"
    alias la="eza -lah --icons --tree --level 1"
    alias cat="bat"
    alias rm="rip"
    alias python="python3"

    # Commands to run in interactive sessions can go here
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    set -x EDITOR "nvim"
    set -Ux TERM "alacritty"
    fish_add_path ~/.local/manual/zig/bin/

    # `fish_greeting` is the command
    function fish_greeting
        clear
    end

    # file to `source` used for `cargo` 
    source "$HOME/.cargo/env.fish"
    # initialize `starship` with configuration tailored to `fish` shell
    starship init fish | source
    # initialize `zoxide` with configuration tailored to `fish` shell
    zoxide init fish | source
    # initialize `atuin` with configuration tailored to `fish` shell
    atuin init fish | source
end
