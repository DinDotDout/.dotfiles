# ~/.zshrc
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge" #  Some okay defaults for zsh (set before own aliases)
plug "zsh-users/zsh-syntax-highlighting"



# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimzsh" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/vimzsh"
[ -f "${ZDOTDIR:-$HOME}/aliases" ] && source "${ZDOTDIR:-$HOME}/aliases"
[ -f "${ZDOTDIR:-$HOME}/bindings" ] && source "${ZDOTDIR:-$HOME}/bindings"
[ -f "${ZDOTDIR:-$HOME}/vimzsh" ] && source "${ZDOTDIR:-$HOME}/vimzsh"
bindkey -r "^G" # unbing to allow rebinding in fzf-git
[ -f "${ZDOTDIR:-$HOME}/plugins/fzf-git/fzf-git.sh" ] && source "${ZDOTDIR:-$HOME}/plugins/fzf-git/fzf-git.sh"

# Completion
autoload -Uz compinit
compinit
eval "$(starship init zsh)" # Start starship prompt
eval "$(zoxide init zsh)" # Better cd
eval "$(fzf --zsh)"

cat ~/.cache/wal/sequences # Terminal colors
pokemon-colorscripts --no-title -n gengar # Pokemon hehe
