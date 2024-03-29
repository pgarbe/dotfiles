#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/.zshrc" ~
ln -sfv "$DOTFILES_DIR/.hushlogin" ~

# ln -sfv "$DOTFILES_DIR/.shell/aliases" ~
# ln -sfv "$DOTFILES_DIR/.shell/functions" ~
# ln -sfv "$DOTFILES_DIR/.shell/path" ~
# ln -sfv "$DOTFILES_DIR/.shell/variables" ~

# GnuPG
mkdir -p ~/.gnupg
chmod 700 ~/.gnupg

ln -sfv "$DOTFILES_DIR/gpg-agent.conf" ~/.gnupg/gpg-agent.conf
ln -sfv "$DOTFILES_DIR/gpg.conf" ~/.gnupg/gpg.conf
ln -sfv "$DOTFILES_DIR/sshcontrol" ~/.gnupg/sshcontrol

# Git
ln -sfv "$DOTFILES_DIR/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/.gitignore" ~

# VSCode
ln -sfv "$DOTFILES_DIR/vscode/settings.json" ~/Library/Application\ Support/Code/User/

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Package managers & packages
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/others.sh"
