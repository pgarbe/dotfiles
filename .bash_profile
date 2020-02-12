# Load our dotfiles like ~/.bash_prompt, etc…
#   ~/.extra can be used for settings you don’t want to commit,
#   Use it to configure your PATH, thus it being first in line.
for file in ~/.{extra,bash_prompt,exports,aliases,functions,path}; do
    [ -r "$file" ] && source "$file"
done
unset file

# source: https://github.com/Bash-it/bash-it/tree/master/completion/available
# Add tab completion for many Bash commands
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi

# Completion: AWS
[[ -x "$(which aws_completer)" ]] && complete -C "$(which aws_completer)" aws


# Add completion for Makefile
# see http://stackoverflow.com/a/38415982/1472048
complete -W "\`grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_-]*$//'\`" make

# Brew completion
if which brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)

  if [ -f "$BREW_PREFIX"/etc/bash_completion.d/brew ]; then
    . "$BREW_PREFIX"/etc/bash_completion.d/brew
  fi

  if [ -f "$BREW_PREFIX"/Library/Contributions/brew_bash_completion.sh ]; then
    . "$BREW_PREFIX"/Library/Contributions/brew_bash_completion.sh
  fi
fi

# # generic colouriser
# GRC=`which grc`
# if [ "$TERM" != dumb ] && [ -n "$GRC" ]
#     then
#         alias colourify="$GRC -es --colour=auto"
#         alias configure='colourify ./configure'
#         for app in {diff,make,gcc,g++,ping,traceroute}; do
#             alias "$app"='colourify '$app
#     done
# fi

# # highlighting inside manpages and elsewhere
# export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           # end mode
# export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# ##
# ## gotta tune that bash_history…
# ##

# # Enable history expansion with space
# # E.g. typing !!<space> will replace the !! with your last command
# bind Space:magic-space

# # Use standard ISO 8601 timestamp
# # %F equivalent to %Y-%m-%d
# # %T equivalent to %H:%M:%S (24-hours format)
# export HISTTIMEFORMAT='%F %T '

# # keep history up to date, across sessions, in realtime
# #  http://unix.stackexchange.com/a/48113
# export HISTCONTROL="erasedups:ignoreboth"       # no duplicate entries
# export HISTSIZE=100000                          # big big history (default is 500)
# export HISTFILESIZE=$HISTSIZE                   # big big history
# type shopt &> /dev/null && shopt -s histappend  # append to history, don't overwrite it

# # Don't record some commands
# export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# # Save multi-line commands as one command
# shopt -s cmdhist

# # Save and reload the history after each command finishes
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# # ^ the only downside with this is [up] on the readline will go over all history not just this bash session.



# # # z beats cd most of the time. `brew install z`
# # if which brew > /dev/null; then
# #     zpath="$(brew --prefix)/etc/profile.d/z.sh"
# #     [ -s $zpath ] && source $zpath
# # fi;

# ##
# ## Completion…
# ##

# # if [[ -n "$ZSH_VERSION" ]]; then  # quit now if in zsh
# #     return 1 2> /dev/null || exit 1;
# # fi;

# Sorry, very MacOS centric here. :/
# if  which brew > /dev/null; then

#     # bash completion.
#     if [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
#         source "$(brew --prefix)/share/bash-completion/bash_completion";
#     elif [ -f /etc/bash_completion ]; then
#         source /etc/bash_completion;
#     fi

#     # homebrew completion
#     source "$(brew --prefix)/etc/bash_completion.d/brew"

#     # hub completion
#     if  which hub > /dev/null; then
#         source "$(brew --prefix)/etc/bash_completion.d/hub.bash_completion.sh";
#     fi;
# fi;


# Enable tab completion for `g` by marking it as an alias for `git`
# if type __git_complete &> /dev/null; then
#     __git_complete g __git_main
# fi;

# # Add tab completion for `defaults read|write NSGlobalDomain`
# # You could just use `-g` instead, but I like being explicit
# complete -W "NSGlobalDomain" defaults


##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell;

# Autocorrect on directory names to match a glob.
shopt -s dirspell 2> /dev/null

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
