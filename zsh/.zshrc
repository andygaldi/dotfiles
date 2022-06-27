#!/bin/zsh

# +---------+
# | PRIVATE |
# +---------+
# Load private environment variables
[ -f $DOTFILES/private.zsh ] && . $DOTFILES/private.zsh


# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +------------+
# | COMPLETION |
# +------------+

# Add .zsh to fpath for git autocompletion
zstyle ':completion:*:*:git:*' script $DOTFILES/zsh/git/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# # +--------+
# # | PROMPT |
# # +--------+
eval "$(starship init zsh)"
# # The following is adapted from here: https://salferrarello.com/zsh-git-status-prompt/

# # Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
# autoload -Uz add-zsh-hook vcs_info
# # Enable substitution in the prompt.
# setopt prompt_subst
# # Run vcs_info just before a prompt is displayed (precmd)
# add-zsh-hook precmd vcs_info
# # add ${vcs_info_msg_0} to the prompt
# # e.g. here we add the Git information in red  
# PROMPT='%F{green}%T%f %1~ %F{blue}${vcs_info_msg_0_}%f > '

# # Enable checking for (un)staged changes, enabling use of %u and %c
# zstyle ':vcs_info:*' check-for-changes true
# # Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
# zstyle ':vcs_info:*' unstagedstr ' *'
# zstyle ':vcs_info:*' stagedstr ' +'
# # Set the format of the Git information for vcs_info
# zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
# zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# +-----+
# | Git |
# +-----+

# Add command gitit to open Github repo in default browser from a local repo
autoload -U gitit

# Release tag alias
release-tag-main() {
  GIT_TIMESTAMP=$(date -u "+%Y%m%d.%H%M%S");
  GIT_REPO_NAME=$(git config --get remote.origin.url | awk -F/ '{print $2}' | awk -F. '{print $1}');
  if [[ $# -eq 1 ]] ; then
     git checkout main;
     git pull;
     echo "Tagging and pushing with release-$1-$GIT_TIMESTAMP"
     echo "https://github.com/zelus-analytics/$GIT_REPO_NAME/releases/tag/release-$1-$GIT_TIMESTAMP"
     sleep 3
     git tag release-$1-$GIT_TIMESTAMP
     git push origin release-$1-$GIT_TIMESTAMP
  else
     echo "Error: requires exactly one argument"
  fi
}

release-tag-commit() {
  GIT_TIMESTAMP=$(date -u "+%Y%m%d.%H%M%S");
  GIT_REPO_NAME=$(git config --get remote.origin.url | awk -F/ '{print $2}' | awk -F. '{print $1}');
  if [[ $# -eq 1 ]] ; then
     echo "Tagging and pushing with release-$1-$GIT_TIMESTAMP"
     echo "https://github.com/zelus-analytics/$GIT_REPO_NAME/releases/tag/release-$1-$GIT_TIMESTAMP"
     sleep 3
     git tag release-$1-$GIT_TIMESTAMP
     git push origin release-$1-$GIT_TIMESTAMP
  else
     echo "Error: requires exactly one argument"
  fi
}

# +-------+
# | pyenv |
# +-------+

# # Needed for pyenv. Homebrew install of pyenv doen't auto add this automatically
# # From https://stackoverflow.com/questions/56463930/interpreters-installed-via-pyenv-are-not-added-to-path
# export PATH=$(pyenv root)/shims:$PATH
# Commands to autoactivate virtual envs and enable autocomplete
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# For pyenv edits to PATH as specified here: https://github.com/pyenv/pyenv#homebrew-on-macos
eval "$(pyenv init --path)" # Sets up your shims path. This is the only requirement for pyenv to function properly.
eval "$(pyenv init -)" # Installs autocompletion, Rehashes shims (From time to time you'll need to rebuild your shim files. Doing this on init makes sure everything is up to date), and Installs `pyenv` into the current shell as a shell function (allows pyenv and plugins to change variables in your current shell, making commands like pyenv shell possible)

# +----------------------+
# | Google Cloud SDK CLI |
# +----------------------+

source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# +----------------------+
# | Kubernetes           |
# +----------------------+
source <(kubectl completion zsh)

# +----------------------+
# | direnv           |
# +----------------------+
eval "$(direnv hook zsh)"
