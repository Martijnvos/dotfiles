#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export BROWSER="brave"
export TERMINAL="urxvt-unicode"
export EDITOR="nano"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# Android / react-native variables
export ANDROID_HOME=$HOME/Android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Dotnet tools
export PATH=$PATH:~/.dotnet/tools

# Adds the user scripts to PATH recursively
export PATH="$PATH:$(du $HOME/.local/bin/ | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
