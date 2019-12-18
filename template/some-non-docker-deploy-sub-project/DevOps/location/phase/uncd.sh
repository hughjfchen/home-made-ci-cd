#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

${SCRIPT_ABS_PATH}/deploy/unfinishing.sh
${SCRIPT_ABS_PATH}/deploy/undeploy.sh
${SCRIPT_ABS_PATH}/deploy/unprepare.sh
${SCRIPT_ABS_PATH}/unfinishing.sh
${SCRIPT_ABS_PATH}/unprepare.sh
