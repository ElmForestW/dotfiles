if status is-interactive
    set fish_greeting

    starship init fish --print-full-init | source
    zoxide init fish | source
    fzf --fish | source

    abbr --add -- v 'nvim'
    abbr --add -- gi 'lazygit'

    alias vim=nvim
    alias ls=eza
    alias tree="eza --tree"
end

export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

export EDITOR=nvim
export TERMINAL=foot
export http_proxy=127.0.0.1:1080
export https_proxy=127.0.0.1:1080

export GNUPGHOME=$XDG_DATA_HOME/gnupg
export CARGO_HOME=$XDG_DATA_HOME/cargo
export GOPATH=$XDG_DATA_HOME/go

export HISTFILE=$XDG_STATE_HOME/bash_history
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history

fish_add_path $XDG_DATA_HOME/cargo/bin
