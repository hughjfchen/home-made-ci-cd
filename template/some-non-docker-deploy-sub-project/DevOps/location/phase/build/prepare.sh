#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "build prepare"

#set +u to workaround the nix script temperlately.
set +u
. $HOME/.nix-profile/etc/profile.d/nix.sh
set -u

# generate nix file for the project
#[[ -e ${SCRIPT_ABS_PATH}/../../../../MY_SUB_PROJECT_NAME.cabal ]] && cabal2nix . > ${SCRIPT_ABS_PATH}/nix/MY_SUB_PROJECT_NAME.nix
cabal2nix ${SCRIPT_ABS_PATH}/../../../.. > ${SCRIPT_ABS_PATH}/nix/MY_SUB_PROJECT_NAME.nix

done_banner "MY_SUB_PROJECT_NAME" "build prepare"
