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

# uninstall third-party dependencies
case ${THE_DISTRIBUTION_ID} in
    debian) for MY_DEB_PKG in $(ls ${SCRIPT_ABS_PATH}/non-docker-dependencies/*.deb)
            do
                if dpkg -s $(echo ${MY_DEB_PKG}|awk -F"_" '{print $1}') > /dev/null 2>&1; then
                    dpkg -r $(echo ${MY_DEB_PKG}|awk -F"_" '{print $1}')
                fi
            done
            ;;
    centos|rhel) for MY_RPM_PKG in $(ls ${SCRIPT_ABS_PATH}/non-docker-dependencies/*.rpm)
                 do
                     if rpm -q $(basename ${MY_RPM_PKG} '.rpm') > /dev/null 2>&1; then
                         rpm -e $(basename ${MY_RPM_PKG} '.rpm')
                     fi
                 done
                 ;;
    Darwin) echo "Don't konw how to uninstall packages for MacOs, skip"
            ;;
    *) echo "Unsupported OS/Distribution,abort"
       exit 1
       ;;
esac
