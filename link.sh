#!/usr/bin/env bash

# Credits to https://github.com/nicknisi/dotfiles/blob/master/install/link.sh

set -euo pipefail

DOTFILES="$HOME/dotfiles"
BACKUPDIR="$HOME/.dotfiles-backup-$(date +'%Y%m%d-%H%M%S')"
LEGACY="$DOTFILES/legacy"

g_list() { printf "  \033[1;32m✔ %s \033[0m\n" "$1"; }
y_list() { printf "  \033[1;33m✔\033[0m %s\n" "$1"; }

link_file() {
    local file="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        y_list "~${target#$HOME} already exists... backing up."
        mkdir -p "$BACKUPDIR"
        mv "$target" "$BACKUPDIR/"
    fi

    g_list "Creating symlink for $file"
    ln -s "$file" "$target"
}

printf '\nCreating symlinks\n'
echo "=============================="
while IFS= read -r file; do
    link_file "$file" "$HOME/.$(basename "$file" '.symlink')"
done < <(find -H "$LEGACY" -maxdepth 3 -name '*.symlink')


printf '\nCreating .config symlinks\n'
echo "=============================="
while IFS= read -r dir; do
    # Skip dirs that contain .symlink files (handled by the loop above)
    if ls "$dir"/*.symlink >/dev/null 2>&1; then
        continue
    fi
    name="$(basename "$dir")"
    link_file "$dir" "$HOME/.config/$name"
done < <(find "$LEGACY" -maxdepth 1 -mindepth 1 -type d)


if [ -d "$HOME/Sync/.auth" ]; then
    printf '\nCreating symlinks for auth files in Sync.com\n'
    echo "=============================="
    while IFS= read -r file; do
        target="$HOME/.$(basename "$file" '.symlink')"

        if [ -e "$target" ] || [ -L "$target" ]; then
            y_list "~${target#$HOME} already exists... Skipping."
        else
            g_list "Creating symlink for $file"
            ln -s "$file" "$target"
        fi
    done < <(find -H "$HOME/Sync/.auth" -maxdepth 3 -name '*.symlink')
fi
