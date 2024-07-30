# enables truecolor for fish shell
set -gx COLORTERM truecolor

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# ensure git prompt updates without lag
# https://github.com/pure-fish/pure/wiki/Async-git-Prompt
set -g async_prompt_functions _pure_prompt_git

# load asdf runtime version manager
# https://asdf-vm.com/
switch "$OSTYPE"
    case 'darwin*'
        source /usr/local/opt/asdf/libexec/asdf.fish
end

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

# add nvim to path
switch "$OSTYPE"
    case 'darwin*'
    case '*'
        export PATH="$PATH:/opt/nvim-linux64/bin"
end
