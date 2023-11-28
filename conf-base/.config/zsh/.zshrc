# ~/.zshrc
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
# Keep in case we remove plugin manager
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliases"
# [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/bindings"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/bindings.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit
# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------------------
# PYWAL
# -----------------------------------------------------
cat ~/.cache/wal/sequences

# -----------------------------------------------------
# PFETCH
# -----------------------------------------------------
# echo ""
pokemon-colorscripts --no-title -n axew
