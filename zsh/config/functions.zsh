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
