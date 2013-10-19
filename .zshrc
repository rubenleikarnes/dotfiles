# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path additions
# List items in the reverse order you want them to appear in $PATH (i.e. last items appear first ).
PATH=/usr/local/opt/ruby/bin:$PATH # Newer Ruby version
PATH=/usr/local/opt/php54:$PATH # Newer PHP version
PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH # Updated coreutinls
PATH=/usr/local/share/npm/bin:$PATH # NPM
PATH=/usr/local/share:$PATH # Local share
PATH=/usr/local/bin:$PATH # User binaries
PATH=$HOME/bin:$PATH # Personal binaries
 
export PATH

# Set name of the theme to load.
ZSH_THEME="pure"

# How often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Plugins settings
ZSH_TMUX_AUTOSTART="true"

# Which plugins would you like to load? 
plugins=(git tmux brew battery osx sublime zsh-syntax-highlighting)

# Run the following files
source $ZSH/oh-my-zsh.sh
source $HOME/.zshalias
