# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install packages

apps=(
  bash-completion2
  
#   bats
#   battery
#   coreutils
#   dockutil
#   ffmpeg
#   fasd
#   gifsicle
  git
  git-extras
  git-secrets
#   gnu-sed --with-default-names
#   gnupg2
#   grep --with-default-names
#   hub
#   httpie
  jq
#   peco
#   psgrep
  tree
  wget
)

brew install "${apps[@]}"

caskapps=(
  alfred
  dropbox
  firefox
  slack
  sourcetree
  spectacle
  visual-studio-code
)

brew cask install "${caskapps[@]}"