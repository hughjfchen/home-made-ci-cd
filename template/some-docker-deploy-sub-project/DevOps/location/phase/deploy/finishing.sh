#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "deploy finishing"

# clean up the docker login info
[[ -d ~/.docker ]] && sudo rm -fr ~/.docker

done_banner "MY_SUB_PROJECT_NAME" "deploy finishing"
