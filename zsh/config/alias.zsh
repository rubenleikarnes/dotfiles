# Shortcuts
alias g="git"
alias v="nvim"
alias t="tmux"
alias vim="nvim"
alias rvim="/usr/bin/vim"

# reload zsh config
alias reload!='source ~/.zshrc'

# Helpers
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Folders and path
alias cd..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd/='cd /'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# List 10 last paths
alias q='dirs -v | head -10'

# Specific folder shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias dot="cd ~/dotfiles"

# Github stars to pinboard
alias pinstars="python ~/Repos/pin-stars/pin-github-stars.py -u rub1"

# htop needs to run as root, bug not showing cpu and mem usage
alias htop='sudo htop'

# List all files colorized in long format
alias l="ls -l --human-readable --color"

# List all files colorized in long format, including dot files
alias la="ls -l --all --human-readable --group-directories-first --color"

# List only directories
alias lsd='ls -l --color | grep "^d"'

# List only files
alias lsf='ls -l --color | grep -v "^d"'


# Get week number
alias week='date +%V'

# Rake db:migrate
alias rdbm='rake db:migrate'

# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" -L 3 | less -FRNX;
}

# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
	if [ $# -eq 0 ]; then
		subl .;
	else
		subl "$@";
	fi;
}

# `o` with no arguments opens the current directory, otherwise opens the given
# location
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade -all; brew cleanup; npm update -g; gem update --system; gem update;echo " "; mas outdated; mas upgrade; echo  "  \033[1;30m✔\033[0m  Everything is up to date"'

# Force update macos
alias forcesystemupdate="sudo softwareupdate -i --all --verbose"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
# New on High Sierra, it needs recreate ~/.Trash after deleting it
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; mkdir ~/.Trash"

# Use bat instad of cat
alias cat="bat"
alias ccat="\cat"
