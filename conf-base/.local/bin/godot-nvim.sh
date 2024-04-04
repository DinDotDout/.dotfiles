#!/bin/bash
[ -n "$1" ] && file=$1
[ -n "$2" ] && line=$2
[ -n "$3" ] && col=$3
nvim --server ~/.cache/nvim/godot.pipe --remote-send '<Cmd>n '$file'<CR><Cmd>call cursor('$line', '$col')<CR>'
