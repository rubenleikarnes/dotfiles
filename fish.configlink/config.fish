# PATH is managed via fish_add_path which deduplicates and persists across sessions.
# To reset all paths after removing an entry, run: set -e fish_user_paths

# add nix bin to path
fish_add_path /run/current-system/sw/bin

# add user ~/.bin folder to path
fish_add_path $HOME/.bin

# add user ~/.local/bin folder to path
fish_add_path $HOME/.local/bin

# add homebrew to path
fish_add_path /opt/homebrew/bin

if test (uname) = Darwin
  # add docker desktop to path
  fish_add_path /Applications/Docker.app/Contents/Resources/bin
end

# add dotfiles scripts to path
fish_add_path $HOME/dotfiles/scripts

# hide go from home
set -gx GOPATH $HOME/.go

# add go to path
fish_add_path $GOPATH/bin

# add laravel valet to path
fish_add_path $HOME/.composer/vendor/bin

# kubectl plugin manager https://krew.sigs.k8s.io/docs/user-guide/quickstart/
if set -q KREW_ROOT
  fish_add_path $KREW_ROOT/.krew/bin
else
  fish_add_path $HOME/.krew/bin
end

# asdf paths
# for time being asdf has been installed manually and just placed in ~/.asdf, waiting for nix to update their package
set -gx ASDF_DATA_DIR $HOME/.asdf
fish_add_path $ASDF_DATA_DIR/shims

# enables truecolor for fish shell
set -gx COLORTERM truecolor

# ensure git prompt updates without lag
# https://github.com/pure-fish/pure/wiki/Async-git-Prompt
set -g async_prompt_functions _pure_prompt_git

# set default editor
set -gx EDITOR hx

# for some reason the helix command is "helix" instead of "hx" on arch...
if test (uname) = "Linux" -a -f /etc/os-release
  if grep -qi arch /etc/os-release
    set -gx EDITOR helix
  end
end

# load personal aliases
source ~/.config/fish/alias.fish

# because fish does not honor ~/.hushlogin
# https://fishshell.com/docs/current/faq.html#how-do-i-change-the-greeting-message
set -U fish_greeting

# Commands to run in interactive sessions can go here
if status is-interactive
  # execute starship prompt, config is located in ~/.config/starship.toml
  # https://starship.rs/
  if command -v starship >/dev/null
    starship init fish | source
  end

  # load fzf
  if command -v fzf >/dev/null
    fzf --fish | source
  end

  # zoxide, and replace cd
  if command -v zoxide >/dev/null
    zoxide init fish --cmd cd | source
  end

  # enables parallel downloads by default
  set -gx HOMEBREW_DOWNLOAD_CONCURRENCY "auto"

  # disable analytics
  set -gx HOMEBREW_NO_ANALYTICS 1
end
