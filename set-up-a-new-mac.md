# Set up a new Mac

First, clone this repository and `cd` into it

```zsh
mkdir ~/projects
cd ~/projects
git clone https://github.com/andygaldi/dotfiles.git
cd dotfiles
```

## Install necessary applications

1. Install Homebrew (follow the directions at https://docs.brew.sh/Installation)

2. Install all applications in Brewfile
```zsh
brew bundle
```
## Set up terminal
1. Create a symbolic link for the repo version of `.zshrc` and `.zshenv` to the home directory

```zsh
# The path to the original needs to be relative to the location of the symbolic link, so be explicit
ln -s ~/projects/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/projects/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/projects/dotfiles/zsh/starship.toml ~/.config/startship.toml
```

2. Copy `git-completion.zsh` as recommended. See `dotfiles/zsh/git/README.md` for more details.
```zsh
mkdir ~/.zsh
cp ~/projects/dotfiles/zsh/git/git-completion.zsh ~/.zsh/_git
```

3. Restart terminal

## Configure Git
Before you can start using Git, you need to configure it. Run each of the following lines on the command line to make sure everything is set up.

```zsh
# sets up Git with your name
git config --global user.name "<Your-Full-Name>"

# sets up Git with your email
git config --global user.email "<your-email-address>"

# makes sure that Git output is colored
git config --global color.ui auto

# displays the original state in a conflict
git config --global merge.conflictstyle diff3

# associate git with vscode
# If you use a different editor, then do a quick search on Google for "associate X text editor with Git" (replace the X with the name of your code editor).
git config --global core.editor "code --wait"

# configure the initial branch name to use in all new repositories
git config --global init.defaultBranch "main"

# displays global configs
git config --list
```