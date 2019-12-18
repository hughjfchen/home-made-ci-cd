#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

${SCRIPT_ABS_PATH}/prepare.sh
${SCRIPT_ABS_PATH}/build/prepare.sh
${SCRIPT_ABS_PATH}/build/build.sh
${SCRIPT_ABS_PATH}/build/finishing.sh

${SCRIPT_ABS_PATH}/deploy/prepare.sh
${SCRIPT_ABS_PATH}/deploy/deploy.sh
${SCRIPT_ABS_PATH}/deploy/finishing.sh
${SCRIPT_ABS_PATH}/finishing.sh
