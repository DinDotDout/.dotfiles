# ~/.zshrc
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
# Keep in case we remove plugin manager
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge" #  Some okay defaults for zsh (set before own aliases)
plug "zsh-users/zsh-syntax-highlighting"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/bindings.zsh"

# Fuzzyfinding stuff
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Load and initialise completion system
autoload -Uz compinit
compinit
# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------------------
# PYWAL -----------------------------------------------------
cat ~/.cache/wal/sequences

# -----------------------------------------------------
# PFETCH
# -----------------------------------------------------
pokemon-colorscripts --no-title -n gengar
