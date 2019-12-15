#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

${SCRIPT_ABS_PATH}/prepare.sh
${SCRIPT_ABS_PATH}/build/prepare.sh

${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/unbuild.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/build.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/build/finishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/unbuild.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/build.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/build/finishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/unbuild.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/build.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/build/finishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/build/build.sh
${SCRIPT_ABS_PATH}/build/finishing.sh
${SCRIPT_ABS_PATH}/finishing.sh
