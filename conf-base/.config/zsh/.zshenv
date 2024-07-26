# Adds ~/.local/bin and subfolders to $PATH
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:${$(find ~/.local/bin -maxdepth 1 -type d -printf %p:)%%:}"

# Removed in favor of using zoxide to avoid poluting the completion space
# Quick path access
# export CDPATH=.:"$HOME/Documents/projects/":"$HOME/.config/"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export VISUAL="nvim"

# export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT='-c' # Fix man pages with colors
export MANPAGER="sh -c 'col -bx | bat --theme gruvbox-dark -l man -p'" # Specify theme as base16 is plain

# default apps
export TERMINAL="kitty"
export BROWSER="firefox"
export EDITOR="nvim"

export MYVIMRC=~/.config/nvim/init.lua

export LESSHISTFILE="-"

# Move config files
# export GTK3_RC_FILES="$XDG_CONFIG_HOME"/gtk-3.0/gtkrc
export GTK3_RC_FILES="$XDG_CONFIG_HOME"/gtk-3.0/settings.ini
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export NVM_DIR="$HOME/.config/nvm"
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export QT_QPA_PLATFORMTHEME=qt5ct
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
# export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# export LC_ALL=en_US.UTF-8
