#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

if [ ! -e ${SCRIPT_ABS_PATH}/../../../../postgrest-5.2.0.tar.gz ]; then
    echo "no postgrest tarball found, make sure you build it and pack it as a tarball with its dependencies"
    exit 1
fi

# install third-party dependencies
case ${THE_DISTRIBUTION_ID} in
    debian) for MY_DEB_PKG in $(ls ${SCRIPT_ABS_PATH}/non-docker-dependencies/*.deb)
            do
                if ! dpkg -s $(echo ${MY_DEB_PKG}|awk -F"_" '{print $1}') > /dev/null 2>&1; then
                    dpkg -i --force-depends ${SCRIPT_ABS_PATH}/non-docker-dependencies/${MY_DEB_PKG}
                fi
            done
            ;;
    centos|rhel) for MY_RPM_PKG in $(ls ${SCRIPT_ABS_PATH}/non-docker-dependencies/*.rpm)
                 do
                     if ! rpm -q $(basename ${MY_RPM_PKG} '.rpm') > /dev/null 2>&1; then
                         rpm -i --nodeps ${SCRIPT_ABS_PATH}/non-docker-dependencies/${MY_RPM_PKG}
                     fi
                 done
                 ;;
    Darwin) echo "Don't konw how to install packages for MacOs, skip"
            ;;
    *) echo "Unsupported OS/Distribution,abort"
       exit 1
       ;;
esac

PTM_POSTGRES_DB_PASSWORD="Passw0rd"
PTM_POSTGRES_DOCKER_BUILD_PATH="${SCRIPT_ABS_PATH}"
ptm_postgres_data_path="/var/postgres/data"
ptm_postgrest_sql_init_path="${SCRIPT_ABS_PATH}/sql"

set +e
myGroup1=$(awk -F":" '{print $1}' /etc/group | grep -w postgres)
set -e
if [ "X${myGroup1}" = "X" ]; then
    echo "no postgres group defined yet, create it..."
    sudo groupadd -f --gid 999 postgres
fi

set +e
myUser1=$(awk -F":" '{print $1}' /etc/passwd | grep -w postgres)
set -e
if [ "X${myUser1}" = "X" ]; then
    echo "no postgres user defined yet, create it..."
    sudo useradd -m -p ${PTM_POSTGRES_DB_PASSWORD} --uid 999 --gid 999 postgres
fi

set +e
myGroup2=$(awk -F":" '{print $1}' /etc/group | grep -w postgrest)
set -e
if [ "X${myGroup2}" = "X" ]; then
    echo "no postgrest group defined yet, create it..."
    sudo groupadd -f --gid 90001 postgrest
fi

set +e
myUser2=$(awk -F":" '{print $1}' /etc/passwd | grep -w postgrest)
set -e
if [ "X${myUser2}" = "X" ]; then
    echo "no postgrest user defined yet, create it..."
    sudo useradd -m -p Passw0rd --uid 90001 --gid 90001 postgrest
fi

if [ ! -d ${ptm_postgres_data_path} ]; then
    echo "no ${ptm_postgres_data_path} directory found, create it..."
    sudo mkdir -p ${ptm_postgres_data_path}
    sudo chown -R postgres:postgres ${ptm_postgres_data_path}/..
fi

if [ ! -d /var/postgrest ]; then
    echo "no /var/postgrest directory found, create it..."
    sudo mkdir -p /var/postgrest
    sudo chown -R postgrest:postgrest /var/postgrest
fi

