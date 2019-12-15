#!/usr/bin/env sh
set -e
SCRIPT_PATH_RAW=$(dirname $0)
# turn SCRIPT_PATH into absolute path
case ${SCRIPT_PATH_RAW} in
    /*) SCRIPT_PATH=${SCRIPT_PATH_RAW} ;;
    *) SCRIPT_PATH=$PWD/${SCRIPT_PATH_RAW} ;;
esac

${SCRIPT_PATH}/prepare.sh

${SCRIPT_PATH}/persist/postgresql/DevOps/ci.sh
${SCRIPT_PATH}/broker/mosquitto/DevOps/ci.sh
${SCRIPT_PATH}/core/DevOps/ci.sh
${SCRIPT_PATH}/API/DevOps/ci.sh
${SCRIPT_PATH}/DevOps/ci.sh

