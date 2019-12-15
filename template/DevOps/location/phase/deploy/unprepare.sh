#!/usr/bin/env bash

if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

if type docker >/dev/null 2>&1; then
    echo "docker found, trying to uninstall it"
    case ${THE_DISTRIBUTION_ID} in
        rhel) echo "This script not know how to install docker-ce on RHEL, so that docker cna't be installed by this script. Ignore."
              ;;
        debian) my_arch=$(uname -m)
                if [ ${my_arch} = "aarch64" ]; then
                    docker_arm="arm64"
                else
                    docker_arm="amd64"
                fi
                sudo apt-get purge -y docker-ce docker-ce-cli containerd.io
                ;;
        centos) sudo yum erase -y docker-ce docker-ce-cli containerd.io
                ;;
        Darwin) if type brew > /dev/null 2>&1; then
                    brew cask uninstall docker
                    brew cask unlink docker
                else
                    echo "Don't know how to uninstall the docker desktop for macOS package."
                    echo "please refer to the installation web page for uninstallation instructions."
                fi
                ;;
        *) echo "Not supported distribution OS."
           ;;
    esac
fi

if type docker-compose >/dev/null 2>&1; then
    echo "docker-compose found, trying to uninstall it"
    case ${THE_DISTRIBUTION_ID} in
        rhel) echo "This script not know how to install docker-compose on RHEL, so that docker-compose cna't be installed by this script. Ignore."
              ;;
        debian) sudo apt-get purge -y docker-compose
                ;;
        centos) [[ -e /usr/local/bin/docker-compose ]] && sudo rm /usr/local/bin/docker-compose
                [[ -L /usr/bin/docker-compose ]] && sudo rm /usr/bin/docker-compose
                ;;
        Darwin) echo "docker-compose will be uninstalled with docker for desktop package. skip."
                ;;
        *) echo "Not supported distribution OS"
           ;;
    esac
fi
