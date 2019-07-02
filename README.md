# .files

These are my dotfiles. Take anything you want, but at your own risk.

## Install

On a sparkling fresh installation of MacOS:

    sudo softwareupdate -i -a
    xcode-select --install

Install the dotfiles with either Git or curl:

### Clone with Git

    git clone https://github.com/pgarbe/dotfiles.git ~/.dotfiles
    source ~/.dotfiles/install.sh

### Remotely install using curl

Alternatively, you can install this into `~/.dotfiles` remotely without Git using curl:

    sh -c "`curl -fsSL https://raw.github.com/pgarbe/dotfiles/master/remote-install.sh`"

Or, using wget:

    sh -c "`wget -O - --no-check-certificate https://raw.githubusercontent.com/pgarbe/dotfiles/master/remote-install.sh`"


## Credits

Many thanks to the [dotfiles community](http://dotfiles.github.io/) and the creators of the incredibly useful tools.
