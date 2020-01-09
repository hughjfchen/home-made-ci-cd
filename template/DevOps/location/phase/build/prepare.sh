#!/usr/bin/env bash

if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "Top level" "build prepare"

set +u
[[ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]] && . $HOME/.nix-profile/etc/profile.d/nix.sh
set -u

if ! type nix-build >/dev/null 2>&1; then
    info "no nix-build found, trying to install it"
    case ${THE_DISTRIBUTION_ID} in
      debian)
        sudo sysctl kernel.unprivileged_userns_clone=1
        curl https://nixos.org/nix/install | sh
	      ;;
      Darwin)
        curl https://nixos.org/nix/install | sh
	      ;;
      rhel|centos)
        curl https://nixos.org/releases/nix/nix-2.1.3/install | sh
	      ;;
      *) ;;
    esac
    set +u
    . $HOME/.nix-profile/etc/profile.d/nix.sh
    set -u
fi

if ! type patchelf >/dev/null 2>&1; then
    info "no patchelf found, trying to install it"
    nix-env --install patchelf
fi

if ! type cabal2nix >/dev/null 2>&1; then
    info "no cabal2nix found, trying to install it"

    nix-env --install cabal2nix
fi

if ! type nix-prefetch-git >/dev/null 2>&1; then
    info "no nix-prefetch-git found, trying to install it"
    nix-env --install nix-prefetch-git
fi

if ! type cabal >/dev/null 2>&1; then
    info "no cabal-install found, trying to install it"
    nix-env --install cabal-install
fi

if ! type nodejs >/dev/null 2>&1 && ! type node >/dev/null 2>&1; then
    info "no nodejs found, trying to install it"
    case ${THE_DISTRIBUTION_ID} in
      debian)
          curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
          sudo apt-get update
          sudo apt-get install -y nodejs
	        ;;
      Darwin)
          if type brew > /dev/null 2>&1; then
              brew install node@10
          else
              curl "https://nodejs.org/dist/latest-v10.x/node-${VERSION:-$(wget -qO- https://nodejs.org/dist/latest-v10.x/ | sed -nE 's|.*>node-(.*)\.pkg</a>.*|\1|p')}.pkg" > "$HOME/Downloads/node-latest-v10.x.pkg" && sudo installer -store -pkg "$HOME/Downloads/node-latest-v10.x.pkg" -target "/"
          fi
          ;;
      rhel|centos)
          curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
          sudo yum install -y nodejs
	        ;;
      *) ;;
    esac
fi

done_banner "Top level" "build prepare"
