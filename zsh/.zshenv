#!/bin/zsh

################################
# EXPORT ENVIRONMENT VARIABLES #
################################
# adapted from https://thevaluable.dev/zsh-install-configure-mouseless/

export DOTFILES="$HOME/projects/dotfiles"

# Set the default editor to vim
export EDITOR=vim

# zsh history (will default to store command line history in the file ~/.zsh_history)
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file