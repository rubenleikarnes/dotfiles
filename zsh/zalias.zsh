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

# Jump alias for z
alias j='z'

# List 10 last paths
alias q='dirs -v | head -10'

# Specific folder shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias dot="cd ~/dotfiles"
alias temp="cd ~/Projects/_temp"

# Github stars to pinboard
alias pinstars="python ~/Repos/pin-stars/pin-github-stars.py -u rub1"

# oh-my-zsh warning for bower
alias bower='noglob bower'

# htop needs to run as root, bug not showing cpu and mem usage
alias htop='sudo htop'

# Enable aliases to be sudo’ed
# alias sudo='sudo '

# show line numbers in cat
alias cat="cat -n"

# Windows command for clear
alias cls=clear

# often screw this up
alias sl=ls

# List all files colorized in long format
alias l="ls -l --human-readable --color"

# List all files colorized in long format, including dot files
alias la="ls -l --all --human-readable --group-directories-first --color"

# List only directories
alias lsd='ls -l --color | grep "^d"'

# List only files
alias lsf='ls -l --color | grep -v "^d"'

# Prezto stole localtunnel alias
unalias lt

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

# 'code' opens files/folders in Visual Studios Code
function code() {
	VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*;
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

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop true && killall Finder"

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}";
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}"
	local ip=127.0.0.1
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}"
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi;
}

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Show top 10 used commands
function stats() {
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

# Colored Man Pages With less Command
# http://www.cyberciti.biz/faq/linux-unix-colored-man-pages-with-less-command/
function man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# Find files in current dir and subdirs
function ff() {
	ack -f | ack "$1"
}

# Open twitch stream in VLC
function twitch() {
	if [[ -n $2 ]]; then
		livestreamer twitch.tv/$1 $2
	elif [[ -n $1 ]]; then
		livestreamer twitch.tv/$1 720p30 
	else
		echo "You need to specify what stream to watch"
	fi
}

# Open twitch stream chat in default browser
function twchat() {
	if [[ -n $1 ]]; then
		open http://www.twitch.tv/$1/chat
	else
		echo "You need to specify what stream chat to open"
	fi
}

# Open new note file in sublime or open notes folder in sublime
function notes() {
	NOTES=~/Dropbox/Notes

	if [[ $1 == s ]]; then
		subl $NOTES -na
	elif [[ -n $1 ]]; then
		# If sublime is editor, open new window and add notes folder to tree
		if [[ $EDITOR == "subl" ]]; then
			$EDITOR $NOTES -na
		fi

		$EDITOR $NOTES/$1.md
	else
		$EDITOR $NOTES
	fi
}

# print available colors and their numbers
# copied from https://github.com/nicknisi/dotfiles/blob/master/zsh/functions.zsh
function colors() {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}m colour${i}"
        if (( $i % 5 == 0 )); then
            printf "\n"
        else
            printf "\t"
        fi
    done
}

# Extract archives - use: extract <file>
# Credits to http://dotfiles.org/~pseup/.bashrc
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) rar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

