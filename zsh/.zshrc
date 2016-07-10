#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Path additions
# List items in the reverse order you want them to appear in $PATH (i.e. last items appear first ).
PATH=/usr/local/opt/ruby/bin:$PATH # Newer Ruby version
PATH=/usr/local/opt/php54:$PATH # Newer PHP version
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH # Updated coreutinls
PATH=/usr/local/share:$PATH # Local share
PATH=/usr/local/bin:$PATH # User binaries
PATH=/usr/local/lib:$PATH # User library
PATH=$HOME/.bin:$PATH # Personal binaries

 
export PATH

if [ -f $HOME/.termsupport.zsh ]; then
	source $HOME/.termsupport.zsh
fi

if [ -f $HOME/.zlocal ]; then
	source $HOME/.zlocal
fi

if [ -f $HOME/.zalias ]; then
	source $HOME/.zalias
fi


# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Base16 Shell
# BASE16_SCHEME="ocean"
# BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Asks before rm foo/*
unsetopt RM_STAR_SILENT

# Waits 10s when rm foo/*
setopt RM_STAR_WAIT

if [ -f '/usr/local/etc/profile.d/z.sh' ]; then
	source '/usr/local/etc/profile.d/z.sh'
fi


# Dcoker exports
#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/ruben/.boot2docker/certs/boot2docker-vm
#export DOCKER_CERT_PATH=/Users/ruben/.docker/machine/machines/default/
#export DOCKER_TLS_VERIFY=1


settitle() {
    printf "\033k$1\033\\"
}

# This will highlight any time you type rm -rf in red
ZSH_HIGHLIGHT_PATTERNS=('rm -rf*' 'fg=white,bold,bg=red')

# Some options for our Zsh history. These will set our history to allow a ton more entires, ignore duplicate commands, and ignore some of the commands we don’t need a history of. This is useful because if you want to search for that command you ran a few weeks ago, you can do that a lot easier.
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# Rbenv stuff
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# global node modules
export NODE_PATH=/usr/local/lib/node_modules
