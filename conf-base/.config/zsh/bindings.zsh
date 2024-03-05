#!/bin/sh

# Jump words with ctrl arrowkeys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Use lf to switch directories and bind it to ctrl-o
rangercd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    ranger --choosedir="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

lfcd () {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM PWR EXIT' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' '^urangercd\n'
bindkey -s '^n' 'nvim .\n'
bindkey -s '^y' 'yazi\n'
bindkey -s '^f' "tmux-sessionizer\n"

# Shell-GPT integration ZSH v0.1
# _sgpt_zsh() {
# if [[ -n "$BUFFER" ]]; then
#     _sgpt_prev_cmd=$BUFFER
#     BUFFER+="⌛"
#     zle -I && zle redisplay
#     BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd")
#     zle end-of-line
# fi
# }
# zle -N _sgpt_zsh
# bindkey ^g _sgpt_zsh


