# add nix bin to path?
set -x PATH $PATH /run/current-system/sw/bin

# add user ~/.bin folder to path
set -x PATH $PATH $HOME/.bin

# add homebrew to path?
set -x PATH $PATH /opt/homebrew/bin

# enables truecolor for fish shell
set -gx COLORTERM truecolor

if status is-interactive
  # Commands to run in interactive sessions can go here
end

# ensure git prompt updates without lag
# https://github.com/pure-fish/pure/wiki/Async-git-Prompt
set -g async_prompt_functions _pure_prompt_git

# load personal aliases
source ~/.config/fish/alias.fish

# execute starship prompt, config is located in ~/.config/starship.toml
# https://starship.rs/
starship init fish | source

# because fish does not honor ~/.hushlogin
# https://fishshell.com/docs/current/faq.html#how-do-i-change-the-greeting-message
set -U fish_greeting

# hide go from home
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

# add laravel valet to path
set -x PATH $PATH $HOME/.composer/vendor/bin

# load fzf
fzf --fish | source

# kubectl plugin manager https://krew.sigs.k8s.io/docs/user-guide/quickstart/
set -gx PATH $PATH $HOME/.krew/bin
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

# Ruby gem paths in home to ease permissions
#set -x GEM_HOME $HOME/.gem

# asdf paths
# for time being asdf has been installed manually and just placed in ~/.asdf, waiting for nix to update their package
set -x ASDF_DATA_DIR $HOME/.asdf
set -x PATH $ASDF_DATA_DIR/shims $PATH
