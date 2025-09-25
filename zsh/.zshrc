# Download plugins
PLUGINS_DIR=${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins
if [[ ! -e $PLUGINS_DIR ]]; then
  mkdir -p $PLUGINS_DIR
fi
if [[ ! -e $PLUGINS_DIR/fast-syntax-highlighting ]]; then
  git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git $PLUGINS_DIR/fast-syntax-highlighting
fi
if [[ ! -e $PLUGINS_DIR/zsh-autosuggestions ]]; then
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $PLUGINS_DIR/zsh-autosuggestions
fi
if [[ ! -e $PLUGINS_DIR/powerlevel10k ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PLUGINS_DIR/powerlevel10k
fi

# Activate Powerlevel10k Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Zsh options
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}"
bindkey -e
setopt autocd
setopt correctall
setopt sharehistory

# PS1="%F{cyan}%~%f > "
HISTFILE=${XDG_STATE_HOME:-$HOME/.local/state}/zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
POWERLEVEL9K_CONFIG_FILE="$HOME/.config/zsh/p10k.zsh"
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

alias ls="ls --color"
alias ll="ls --color -lh"
alias la="ls --color -lAh"
alias v="nvim"
alias vim="nvim"
alias gi="lazygit"

# Load plugins
source $PLUGINS_DIR/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS_DIR/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/p10k.zsh

# Load external programs
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
