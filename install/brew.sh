# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install packages

apps=(
  cfn-lint
  diff-so-fancy
  git
  git-extras
  git-secrets
  hub
  hub
  jq
  thefuck
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
  slack
  sourcetree
  spectacle
  visual-studio-code
  zoom
)

brew cask install "${caskapps[@]}"