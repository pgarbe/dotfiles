# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install packages

apps=(
  awscli
  cask
  diff-so-fancy
  dive
  git
  git-extras
  git-secrets
  gnupg
  hub
  jq
  pinentry
  tree
  wget
  zsh
  zsh-completions
)

brew install "${apps[@]}"

caskapps=(
  alfred
  amazon-chime
  dropbox
  docker
  firefox
  google-chrome
  slack
  sourcetree
  rectangle
  visual-studio-code
  zoom
)

brew install --cask "${caskapps[@]}"