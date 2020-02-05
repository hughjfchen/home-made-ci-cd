#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "Cont. UnBuild"

# I don't think we need to undo the top-level finishing and prepare
#${SCRIPT_ABS_PATH}/../../../../DevOps/MY_LOCATION_NAME/MY_PHASE_NAME/unfinishing.sh
#${SCRIPT_ABS_PATH}/../../../../DevOps/MY_LOCATION_NAME/MY_PHASE_NAME/build/unfinishing.sh

${SCRIPT_ABS_PATH}/unfinishing.sh
${SCRIPT_ABS_PATH}/build/unfinishing.sh
${SCRIPT_ABS_PATH}/build/unbuild.sh
${SCRIPT_ABS_PATH}/build/unprepare.sh
${SCRIPT_ABS_PATH}/unprepare.sh

# I don't think we need this either
#${SCRIPT_ABS_PATH}/../../../../DevOps/MY_LOCATION_NAME/MY_PHASE_NAME/build/unprepare.sh
#${SCRIPT_ABS_PATH}/../../../../DevOps/MY_LOCATION_NAME/MY_PHASE_NAME/unprepare.sh

done_banner "MY_SUB_PROJECT_NAME" "Cont. UnBuild"
