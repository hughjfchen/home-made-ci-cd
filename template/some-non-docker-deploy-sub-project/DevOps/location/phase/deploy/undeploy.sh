#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

for PATH_TO_REMOVE in $(tar zPtf ./postgresqt-5.2.0.tar.gz|awk -F"/" '{print $4}'|sort|uniq)
do
    sudo rm -fr /nix/store/${PATH_TO_REMOVE}
done

