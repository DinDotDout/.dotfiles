# ~/.zshrc
function source_file_local() {
    local file_path="${ZDOTDIR:-$HOME}/$1"
    if [ -f "$file_path" ]; then
        source "$file_path"
        # echo "File $file_path does exist"
    else
        echo "File $file_path does not exist"
    fi
}
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "junegunn/fzf-git.sh"

# Alias expansion does not work with source local.
[ -f "${ZDOTDIR:-$HOME}/aliases" ] && source "${ZDOTDIR:-$HOME}/aliases"
source_file_local "defaults"
source_file_local "bindings"
source_file_local "vimzsh"

bindkey -r "^G" # unbing to allow rebinding in fzf-git
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)" # Start starship prompt
eval "$(zoxide init zsh)" # Better cd
eval "$(fzf --zsh)"

cat ~/.cache/wal/sequences # Terminal colors
pokemon-colorscripts --no-title -n gengar # Pokemon hehe
