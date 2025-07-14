# add nix bin to path?
set -x PATH $PATH /run/current-system/sw/bin

# add user ~/.bin folder to path
set -x PATH $PATH $HOME/.bin

# add user ~/.local/bin folder to path
set -x PATH $PATH $HOME/.local/bin

# add homebrew to path?
set -x PATH $PATH /opt/homebrew/bin

# enables truecolor for fish shell
set -gx COLORTERM truecolor

# ensure git prompt updates without lag
# https://github.com/pure-fish/pure/wiki/Async-git-Prompt
set -g async_prompt_functions _pure_prompt_git

# set default editor
set -gx EDITOR hx

# for some reason the helix command is "helix" instead of "hx" on arch...
set uname (uname)
if test "$uname" = "Linux" -a -f /etc/os-release
  if grep -qi arch /etc/os-release
    set -gx EDITOR helix
  end
end

# load personal aliases
source ~/.config/fish/alias.fish

# because fish does not honor ~/.hushlogin
# https://fishshell.com/docs/current/faq.html#how-do-i-change-the-greeting-message
set -U fish_greeting

# hide go from home
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

# add laravel valet to path
set -x PATH $PATH $HOME/.composer/vendor/bin

# kubectl plugin manager https://krew.sigs.k8s.io/docs/user-guide/quickstart/
set -gx PATH $PATH $HOME/.krew/bin
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

# asdf paths
# for time being asdf has been installed manually and just placed in ~/.asdf, waiting for nix to update their package
set -x ASDF_DATA_DIR $HOME/.asdf
set -x PATH $ASDF_DATA_DIR/shims $PATH

# openjdk
set -x PATH $PATH /opt/homebrew/opt/openjdk/bin
set -gx JAVA_HOME /opt/homebrew/opt/openjdk

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
end
