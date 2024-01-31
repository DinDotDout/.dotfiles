#!/bin/sh

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
  gnv="nvim --listen /tmp/nvimsocket" \
  conf="ranger $HOME/.config/" \
  dotf="ranger $HOME/.dotfiles/" \
  roblox="cd /home/joan/.var/app/io.github.vinegarhq.Vinegar/data/vinegar/prefix/dosdevices/c:/users/joan/Documents" \
  studio="flatpak run io.github.vinegarhq.Vinegar studio"
alias gpt="com.microsoft.Edge --app='https://www.bing.com/search?form=NTPCHB&q=Bing+AI&showconv=1' &"
alias scripts="cd ~/.local/bin/"

alias \
  Qtile="startx"

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

