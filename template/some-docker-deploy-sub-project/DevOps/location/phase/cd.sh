#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

${SCRIPT_ABS_PATH}/../../../../../DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../../../DevOps/gcp/test/deploy/prepare.sh
${SCRIPT_ABS_PATH}/prepare.sh
${SCRIPT_ABS_PATH}/deploy/prepare.sh
${SCRIPT_ABS_PATH}/deploy/deploy.sh
${SCRIPT_ABS_PATH}/deploy/finishing.sh
${SCRIPT_ABS_PATH}/finishing.sh
${SCRIPT_ABS_PATH}/../../../../../DevOps/gcp/test/deploy/deploy.sh
${SCRIPT_ABS_PATH}/../../../../../DevOps/gcp/test/deploy/finishing.sh
${SCRIPT_ABS_PATH}/../../../../../DevOps/gcp/test/finishing.sh
