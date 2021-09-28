# Git Completion

`git-completion.bash` and `git-completion.zsh` were copied from https://github.com/git/git/tree/master/contrib/completion on 2021-09-28.

## Instructions followed

NOTE: These instructions are already incorporated in `dotfiles/set-up-a-new-mac.md`.

1. According to the comment at the top of `git-completion.zsh`, the recommended way to install this script is to make a copy of it as a file named '_git' inside any directory in your fpath.

```zsh
mkdir ~/.zsh
cp ~/projects/dotfiles/zsh/git/git-completion.zsh ~/.zsh/_git
```

2. All other directions to make this work are taken care of in `.zshrc`. Specifically, these (also in the comment at the top of `git-completion.zsh`)
```zsh
# You need git's bash completion script installed. By default bash-completion's
# location will be used (e.g. pkg-config --variable=completionsdir bash-completion).
#
# If your bash completion script is somewhere else, you can specify the
# location in your ~/.zshrc:
#
#  zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
```
