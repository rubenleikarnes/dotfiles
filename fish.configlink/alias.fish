alias dot="cd ~/dotfiles"
alias dt="cd ~/Desktop"
alias gp="git push"
alias v="nvim"

alias kubectl-configs="kubectl config get-contexts"
alias kubectl-tfc="kubectl config use-context obc-app"
alias kubectl-tfc-monitoring="kubectl config use-context obc-monitor"
alias kubectl-orbstack="kubectl config use-context orbstack"

# nix-darwin switch
alias nds="darwin-rebuild switch --flake ~/.config/nix-darwin#mbp"

# so usefull to just have saved
alias nxs="nix run .#homeConfigurations.debian.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes -- switch"

# home-manager switch
alias hms="home-manager switch --flake ~/.config/nix#debian"
