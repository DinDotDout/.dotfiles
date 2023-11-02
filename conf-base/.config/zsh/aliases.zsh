#!/bin/sh
# alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# pacman
alias \
  p='pacman' \
  sp='sudo pacman' \
  sps='sudo pacman -S' \
  spr='sudo pacman -R' \
  pq='pacman -Q' \

# Verbosity and settings that you pretty much just always are going to want.
alias \
  cp="cp -iv" \
  mv="mv -iv" \
  rm="rm -vI" \
  bc="bc -ql" \
  rsync="rsync -vrPlu" \
  mkd="mkdir -pv" \
  yt="yt-dlp --embed-metadata -i" \
  yta="yt -x -f bestaudio/best" \
  ytt="yt --skip-download --write-thumbnail" \
  ffmpeg="ffmpeg -hide_banner"

# Color
alias \
	ls="ls -hN --color=auto --group-directories-first" \
  la='ls -A'
  ll='ls -l'
  grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi" \
	ip="ip -color=auto"

alias \
  z="zathura" \
  g="git" \
  lf="lfub" \
  rn="ranger"

alias \
  nv='nvim' \
  gnvim="nvim --listen $HOME/.cache/nvim/godot.pipe $HOME/projects/continuum_world/game/" \
  conf="ranger $HOME/.config/" \
  dot="ranger $HOME/.dotfiles/" \
  # conf="lf $HOME/.config/" \
  # dot="lf $HOME/.dotfiles/" \

alias gpt="com.microsoft.Edge --app='https://www.bing.com/search?form=NTPCHB&q=Bing+AI&showconv=1' &"
