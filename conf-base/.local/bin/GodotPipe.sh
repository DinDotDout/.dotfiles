#!/bin/bash
[ -n "$1" ] && file=$1
# [ -n "$2" ] && line=$2
# [ -n "$3" ] && col=$3
nvim --server ~/.cache/nvim/godot.pipe --remote-send ':e '$file'<CR>'
# nvim --server ~/.cache/nvim/godot.pipe --remote-send '<C-\><C-N>:n '$file'<CR>:call cursor('$line', '$col')<CR>' 
