#!/bin/sh

# ~/.profile
#

export BROWSER="brave"
export TERMINAL="alacritty"
export EDITOR="vim"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Alacritty font scaling
export WINIT_X11_SCALE_FACTOR=1

# Home directory cleanup
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export NPM_CONFIG_CACHE="$HOME/.cache/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"

export GNUPGHOME="$HOME/.local/share/gnupg"
export PASSWORD_STORE_DIR="$HOME/.local/share/pass"
export VIMINIT="source ~/.config/vim/vimrc"
export HISTFILE="$HOME/.local/share/bash_history"
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # Might break some DMs
export XINITRC="$HOME/.config/x11/xinitrc"

# Deno
export DENO_INSTALL="$HOME/.local/bin/deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Adds the user scripts to PATH recursively
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Start graphical server if it's not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx $HOME/.config/x11/xinitrc
