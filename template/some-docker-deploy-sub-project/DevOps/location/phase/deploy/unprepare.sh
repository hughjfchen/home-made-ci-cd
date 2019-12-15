#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

if [ -d /var/postgrest ]; then
    echo "/var/postgrest directory found, delete it..."
    sudo rm -fr /var/postgrest
fi

if [ -d /var/postgres/data ]; then
    echo "/var/postgres data directory found, delete whole /var/postgres..."
    sudo rm  -fr /var/postgres
fi

set +e
myUser2=$(awk -F":" '{print $1}' /etc/passwd | grep -w postgrest)
if [ "X${myUser2}" != "X" ]; then
    echo "postgrest user defined, delete it..."
    sudo userdel -fr postgrest
fi

myGroup2=$(awk -F":" '{print $1}' /etc/group | grep -w postgrest)
if [ "X${myGroup2}" != "X" ]; then
    echo "postgrest group defined, delete it..."
    sudo groupdel -f postgrest
fi

myUser1=$(awk -F":" '{print $1}' /etc/passwd | grep -w postgres)
if [ "X${myUser1}" != "X" ]; then
    echo "postgres user defined, delete it..."
    sudo userdel -fr postgres
fi

myGroup1=$(awk -F":" '{print $1}' /etc/group | grep -w postgres)
if [ "X${myGroup1}" != "X" ]; then
    echo "postgres group defined, delete it..."
    sudo groupdel -f postgres
fi
set -e

PGS_IMAGES=$(sg docker -c "docker images"|grep -w postgrest|awk '{print $3}')
for PGS_IMAGE in ${PGS_IMAGES}
do
    sg docker -c "docker image rm -f ${PGS_IMAGE}"
done
PGSDB_IMAGES=$(sg docker -c "docker images"|grep -w postgrest_db|awk '{print $3}')
for PGSDB_IMAGE in ${PGSDB_IMAGES}
do
    sg docker -c "docker image rm -f ${PGSDB_IMAGE}"
done
PG_IMAGES=$(sg docker -c "docker images"|grep -w postgres|awk '{print $3}')
for PG_IMAGE in ${PG_IMAGES}
do
    sg docker -c "docker image rm -f ${PG_IMAGE}"
done
