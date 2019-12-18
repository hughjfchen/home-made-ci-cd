#!/usr/bin/env bash
### set this flag to make sure exit code correct
set -Eeuo pipefail

### turn path within script into absolute path
SCRIPT_ABS_PATH_RAW=$(dirname $0)
# turn SCRIPT_ABS_PATH into absolute path
case ${SCRIPT_ABS_PATH_RAW} in
    /*) SCRIPT_ABS_PATH=${SCRIPT_ABS_PATH_RAW} ;;
    *) SCRIPT_ABS_PATH=$PWD/${SCRIPT_ABS_PATH_RAW} ;;
esac

### change working path to the project home path
cd ${SCRIPT_ABS_PATH}/../../..

${SCRIPT_ABS_PATH}/prepare.sh
${SCRIPT_ABS_PATH}/deployment/prepare.sh

${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/undeploy.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/deploy.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/deployment/finishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/undeploy.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/deploy.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/deployment/finishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/undeploy.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/deploy.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/deployment/finishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/deployment/deploy.sh
${SCRIPT_ABS_PATH}/deployment/finishing.sh
${SCRIPT_ABS_PATH}/finishing.sh

${SCRIPT_ABS_PATH}/prepare.sh
${SCRIPT_ABS_PATH}/test/prepare.sh

${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/untest.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/test.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/test/finishing.sh
${SCRIPT_ABS_PATH}/../../../persist/postgresql/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/untest.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/test.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/test/finishing.sh
${SCRIPT_ABS_PATH}/../../../broker/mosquitto/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/untest.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unfinishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/unprepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/prepare.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/test.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/test/finishing.sh
${SCRIPT_ABS_PATH}/../../../core-and-api/DevOps/gcp/test/finishing.sh

${SCRIPT_ABS_PATH}/test/test.sh
${SCRIPT_ABS_PATH}/test/finishing.sh
${SCRIPT_ABS_PATH}/finishing.sh
