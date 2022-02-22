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

# Google Application Credentials file generated and saved in the below location by running the following (after google-cloud-sdk has been installed)
# $ gcloud auth application-default login 
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json