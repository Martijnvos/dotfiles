#!/bin/sh

#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias irssi='irssi --home ~/.config/irssi'
alias {v,vi,vim}='nvim'

PS1='\W \$ ' # Shell prompt format

# Turn off Software Flow control so Ctrl + S doesn't lock terminal
# More info: https://unix.stackexchange.com/a/72092
stty -ixon

## Applies the pywal theme to new terminals
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

## Sets up the git alias called dotfiles to reference the bare repo in .dotfiles
# Check the 'Tracking dotfiles directly with Git' subsection under the Dotfiles section in the Arch wiki for more information
alias dotfiles='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
