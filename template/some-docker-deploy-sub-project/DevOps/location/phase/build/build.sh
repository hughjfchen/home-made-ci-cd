#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "build build"

#set +u to workaround the nix script temperlately.
set +u
. $HOME/.nix-profile/etc/profile.d/nix.sh
set -u

if [ -f ${SCRIPT_ABS_PATH}/nix/MY_SUB_PROJECT_NAME.nix ]; then
    nix-shell ${SCRIPT_ABS_PATH}/nix/shell.nix
    nix-build -A MY_SUB_PROJECT_NAME-docker ${SCRIPT_ABS_PATH}/nix/default.nix
else
    info "No ${SCRIPT_ABS_PATH}/nix/MY_SUB_PROJECT_NAME.nix found, skip building"
fi

done_banner "MY_SUB_PROJECT_NAME" "build build"
