[ -f "$HOME/.xprofile" ] && . ~/.xprofile

# Make sure natural scrolling is always turned on for the trackpad
xinput --set-prop "SYNA8005:00 06CB:CD8C Touchpad" "libinput Natural Scrolling Enabled" 1

# Set the Windows key to be my compose key for things like ë
setxkbmap -option compose:lwin

exec i3
