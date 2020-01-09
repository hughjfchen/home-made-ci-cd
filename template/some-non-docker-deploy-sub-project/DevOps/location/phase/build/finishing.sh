#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "build finishing"

info "Packing the nix build product and its dependencies into a tarbar for deployment"

#set +u to workaround the nix script temp.
set +u
. $HOME/.nix-profile/etc/profile.d/nix.sh
set -u

if [ -e ${SCRIPT_ABS_PATH}/../../../../result ]; then
  [[ -e ${SCRIPT_ABS_PATH}/../../../../MY_SUB_PROJECT_NAME.tar.gz ]] && rm -fr ./MY_SUB_PROJECT_NAME.tar.gz
  tar zPcf ./MY_SUB_PROJECT_NAME.tar.gz $(nix-store --query --requisites ${SCRIPT_ABS_PATH}/../../../../result)
else
  info "No ${SCRIPT_ABS_PATH}/../../../../result, can't pack tarball"
fi

done_banner "MY_SUB_PROJECT_NAME" "build finishing"
