# Path additions
# List items in the reverse order you want them to appear in $PATH (i.e. last items appear first ).
PATH=/usr/local/opt/ruby/bin:$PATH # Newer Ruby version
PATH=/usr/local/opt/php54:$PATH # Newer PHP version
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH # Updated coreutinls
PATH=/usr/local/share/npm/bin:$PATH # NPM
PATH=/usr/local/share:$PATH # Local share
PATH=/usr/local/bin:$PATH # User binaries
PATH=/usr/local/lib:$PATH # User library
PATH=$HOME/.bin:$PATH # Personal binaries
 
export PATH

# Antigen
ZSHA_BASE=$HOME/dotfiles/zsh
source $ZSHA_BASE/.antigen/antigen.zsh

# Antigen bundles
antigen-use oh-my-zsh

# Oh-my-zsh plugins
antigen-bundles <<EOBUNDLES
	git
	git-extras
	docker
	command-not-found
	sublime
	z

	Tarrasch/zsh-bd
	sindresorhus/pure
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
EOBUNDLES

if [ "$OSTYPE"="darwin11.0" ]; then
	antigen-bundle brew
	antigen-bundle osx
fi

antigen-apply

# How often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=3

source $HOME/.zshalias
source $HOME/.zlocal

# Sets default typeset to UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

# Link Homebrew casks in `/Applications` rather than `~/Applications`
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Base16 Shell
BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Asks before rm foo/*
unsetopt RM_STAR_SILENT

# Waits 10s when rm foo/*
setopt RM_STAR_WAIT

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

sh '/usr/local/etc/profile.d/z.sh'

# Dcoker exports
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ruben/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
