#!/usr/bin/env bash
### set this flag to make sure exit code correct
set -Eeuo pipefail

### turn path within script into absolute path
SCRIPT_PATH_RAW=$(dirname $0)
# turn SCRIPT_PATH into absolute path
case ${SCRIPT_PATH_RAW} in
    /*) SCRIPT_PATH=${SCRIPT_PATH_RAW} ;;
    *) SCRIPT_PATH=$PWD/${SCRIPT_PATH_RAW} ;;
esac

### change working path to the project home path
cd ${SCRIPT_PATH}/../../..

${SCRIPT_PATH}/deployment/unfinishing.sh
${SCRIPT_PATH}/deployment/undeploy.sh
${SCRIPT_PATH}/deployment/unprepare.sh
${SCRIPT_PATH}/unfinishing.sh
${SCRIPT_PATH}/unprepare.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/unfinishing.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/undeploy.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/unprepare.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/unfinishing.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/unprepare.sh
