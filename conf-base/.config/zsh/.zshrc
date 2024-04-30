# ~/.zshrc
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge" #  Some okay defaults for zsh (set before own aliases)
plug "zsh-users/zsh-syntax-highlighting"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings"

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Completion
autoload -Uz compinit
compinit

eval "$(starship init zsh)" # Start starship prompt
eval "$(zoxide init zsh)" # Better cd
cat ~/.cache/wal/sequences # Terminal colors
pokemon-colorscripts --no-title -n gengar # Pokemon hehe
