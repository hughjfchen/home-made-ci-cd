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

${SCRIPT_PATH}/../../../../../DevOps/gcp/test/prepare.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/prepare.sh
${SCRIPT_PATH}/prepare.sh
${SCRIPT_PATH}/deployment/prepare.sh
${SCRIPT_PATH}/deployment/deploy.sh
${SCRIPT_PATH}/deployment/finishing.sh
${SCRIPT_PATH}/finishing.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/deploy.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/deployment/finishing.sh
${SCRIPT_PATH}/../../../../../DevOps/gcp/test/finishing.sh
