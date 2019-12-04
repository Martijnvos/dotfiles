[ -f "$HOME/.xprofile" ] && . ~/.xprofile

# Make sure natural scrolling is always turned on for the trackpad
xinput --set-prop "SYNA8005:00 06CB:CD8C Touchpad" "libinput Natural Scrolling Enabled" 1

exec i3
