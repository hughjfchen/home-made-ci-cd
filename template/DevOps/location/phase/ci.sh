#!/usr/bin/env sh
set -e
SCRIPT_ABS_PATH_RAW=$(dirname $0)
# turn SCRIPT_ABS_PATH into absolute path
case ${SCRIPT_ABS_PATH_RAW} in
    /*) SCRIPT_ABS_PATH=${SCRIPT_ABS_PATH_RAW} ;;
    *) SCRIPT_ABS_PATH=$PWD/${SCRIPT_ABS_PATH_RAW} ;;
esac

${SCRIPT_ABS_PATH}/prepare.sh

${SCRIPT_ABS_PATH}/persist/postgresql/DevOps/ci.sh
${SCRIPT_ABS_PATH}/broker/mosquitto/DevOps/ci.sh
${SCRIPT_ABS_PATH}/core/DevOps/ci.sh
${SCRIPT_ABS_PATH}/API/DevOps/ci.sh
${SCRIPT_ABS_PATH}/DevOps/ci.sh

