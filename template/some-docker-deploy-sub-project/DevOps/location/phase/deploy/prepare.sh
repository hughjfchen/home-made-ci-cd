#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

if [ ! -L ${SCRIPT_ABS_PATH}/../../../../result ]; then
    echo "no postgrest build result found, make sure you build it"
    exit 1
fi

sg docker -c "docker load -i ${SCRIPT_ABS_PATH}/../../../../result"

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
    sudo useradd -G docker -m -p ${PTM_POSTGRES_DB_PASSWORD} --uid 999 --gid 999 postgres
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
    sudo useradd -G docker -m -p Passw0rd --uid 90001 --gid 90001 postgrest
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

# cmdPath=$(docker image inspect ${imageTag} | grep "/nix/store/" | awk -F"/" '{print "/nix/store/"$4}')
sudo su -p -c "sed \"s:PTM_POSTGRES_DB_PASSWORD:${PTM_POSTGRES_DB_PASSWORD}:g\" < ${SCRIPT_ABS_PATH}/docker-compose.yml > /var/postgrest/docker-compose-postgrest.yml.01" postgrest
sudo su -p -c "sed \"s:ptm_postgres_data_path:${ptm_postgres_data_path}:g\" < /var/postgrest/docker-compose-postgrest.yml.01 > /var/postgrest/docker-compose-postgrest.yml.02" postgrest
sudo su -p -c "sed \"s:ptm_postgrest_sql_init_path:${ptm_postgrest_sql_init_path}:g\" < /var/postgrest/docker-compose-postgrest.yml.02 > /var/postgrest/docker-compose-postgrest.yml.03" postgrest
sudo su -p -c "sed \"s:PTM_POSTGRES_DOCKER_BUILD_PATH:${PTM_POSTGRES_DOCKER_BUILD_PATH}:g\" < /var/postgrest/docker-compose-postgrest.yml.03 > /var/postgrest/docker-compose-postgrest.yml" postgrest
