if status is-interactive
  abbr -a refreshpath "set -e fish_user_paths"
  abbr -a dot "cd ~/dotfiles"
  abbr -a dt "cd ~/Desktop"
  abbr -a gp "git push"
  alias v="nvim"

  abbr -a kubectl-configs "kubectl config get-contexts"
  abbr -a kubectl-obc "kubectl config use-context OBC-TFC"
  abbr -a kubectl-obc-mon "kubectl config use-context OBC-TFC-MON"
  abbr -a kubectl-hd2 "kubectl config use-context HD2-TFC"
  abbr -a kubectl-hd3 "kubectl config use-context HD3-TFC"

  # nix-darwin switch
  abbr -a nds "sudo darwin-rebuild switch --flake ~/.config/nix-darwin#mbp"

  # so usefull to just have saved
  abbr -a nxs "nix run .#homeConfigurations.debian.activationPackage --extra-experimental-features nix-command --extra-experimental-features flakes -- switch"

  # home-manager switch
  abbr -a hms "home-manager switch --flake ~/.config/nix#debian"

  # nix update stuff
  abbr -a nuf "nix flake update --flake ~/.config/nix-darwin"

  # start a simple web server for local files with Caddy
  alias serve="echo 'Starting local webserver with Caddy on http://localhost:8000'; caddy file-server --listen :8000 --browse"

  # ip addresses
  function ip
    echo "Public IP: "(dig +short myip.opendns.com @resolver1.opendns.com)
  end

  if test (uname) = Darwin
    function localip
      echo "Local IP: "(ipconfig getifaddr en0)
    end
    function ips
      ifconfig | awk '/inet6? /{print $2}' | sed 's/%.*$//'
    end
  else
    function localip
      echo "Local IP: "(hostname -I | awk '{print $1}')
    end
    function ips
      ip -brief addr | awk '{print $1, $3}'
    end
  end

  if test -f /etc/os-release
    if grep -qi arch /etc/os-release
      alias hx="helix"
    end
  end

  # bat modern cat alternative
  if command -v bat >/dev/null
    alias cat="bat"
  end

  # eza mordern ls alternative
  if command -v eza >/dev/null
    alias ls="eza --group-directories-first"
  end
end
