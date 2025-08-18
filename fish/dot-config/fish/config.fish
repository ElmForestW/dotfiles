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


export EDITOR=nvim
export http_proxy=127.0.0.1:1080
export https_proxy=127.0.0.1:1080
