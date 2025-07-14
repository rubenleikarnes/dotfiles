status is-interactive; and begin
  abbr -a dot "cd ~/dotfiles"
  abbr -a dt "cd ~/Desktop"
  abbr -a gp "git push"
  alias v="nvim"

  abbr -a kubectl-configs "kubectl config get-contexts"
  abbr -a kubectl-tfc "kubectl config use-context obc-app"
  abbr -a kubectl-tfc-monitoring "kubectl config use-context obc-monitor"
  abbr -a kubectl-orbstack "kubectl config use-context orbstack"

  # nix-darwin switch
  abbr -a nds "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#mbp"

  # so usefull to just have saved
  abbr -a nxs "nix run .#homeConfigurations.debian.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes -- switch"

  # home-manager switch
  abbr -a hms "home-manager switch --flake ~/.config/nix#debian"

  # nix update stuff
  abbr -a nuf "nix flake update --flake ~/.config/nix-darwin"

  # ip adresses
  if test (uname) = Darwin
    alias ip="echo Public IP: $(dig +short myip.opendns.com @resolver1.opendns.com)"
    alias localip="echo Local IP: $(ipconfig getifaddr en0)"
    alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
  end

  if test -f /etc/os-release
    if grep -qi arch /etc/os-release
      alias hx="helix"
    end
  end
end
