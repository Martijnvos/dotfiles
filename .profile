#!/bin/sh

# ~/.profile
#

export BROWSER="brave"
export TERMINAL="urxvt-unicode"
export EDITOR="vim"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Home directory cleanup
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"

export GNUPGHOME="$HOME/.local/share/gnupg"
export VIMINIT="source ~/.config/vim/vimrc"
export HISTFILE="$HOME/.local/share/bash_history"
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # Might break some DMs
export XINITRC="$HOME/.config/x11/xinitrc"

# Android / react-native variables
export ANDROID_HOME=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Turn Dotnet telemetry off
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Dotnet tools
export PATH=$PATH:~/.dotnet/tools

# Adds the user scripts to PATH recursively
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx $HOME/.config/x11/xinitrc
