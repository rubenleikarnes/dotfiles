# Path additions
# List items in the reverse order you want them to appear in $PATH (i.e. last items appear first ).
PATH=/usr/local/opt/ruby/bin:$PATH # Newer Ruby version
PATH=/usr/local/opt/php54:$PATH # Newer PHP version
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH # Updated coreutinls
PATH=/usr/local/share/npm/bin:$PATH # NPM
PATH=/usr/local/share:$PATH # Local share
PATH=/usr/local/bin:$PATH # User binaries
PATH=$HOME/.bin:$PATH # Personal binaries
 
export PATH

# Antigen
ZSHA_BASE=$HOME/dotfiles/zsh
source $ZSHA_BASE/antigen/antigen.zsh

# Antigen bundles
antigen-use oh-my-zsh

# Oh-my-zsh plugins
antigen-bundles <<EOBUNDLES
	git
	git-extras
	brew
	command-not-found
	sublime

	Tarrasch/zsh-bd
	sindresorhus/pure
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
EOBUNDLES

if [ "$OSTYPE"="darwin11.0" ]; then
	antigen-bundle osx
fi

antigen-apply

# How often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=3

source $HOME/.zshalias

# Base16 Shell
BASE16_SCHEME="ocean"
BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL
