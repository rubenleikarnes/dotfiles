set -gx COLORTERM truecolor

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# https://github.com/pure-fish/pure/wiki/Async-git-Prompt
set -g async_prompt_functions _pure_prompt_git

source /usr/local/opt/asdf/libexec/asdf.fish

source ~/.config/fish/alias.fish
