#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "deploy prepare"

if [ ! -e ${SCRIPT_ABS_PATH}/../../../../MY_SUB_PROJECT_NAME.tar.gz ]; then
    my_exit "no MY_SUB_PROJECT_NAME tarball found, make sure you build it and pack it as a tarball with its dependencies" 1
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
    Darwin) warn "Don't konw how to install packages for MacOs, skip"
            ;;
    *) my_exit "Unsupported OS/Distribution,abort" 1
       ;;
esac

MY_SUB_PROJECT_NAME_data_path="/var/MY_SUB_PROJECT_NAME/data"
MY_SUB_PROJECT_NAME_config_path="/var/MY_SUB_PROJECT_NAME/config"

set +e
myGroup2=$(awk -F":" '{print $1}' /etc/group | grep -w MY_SUB_PROJECT_NAME)
set -e
if [ "X${myGroup2}" = "X" ]; then
    info "no MY_SUB_PROJECT_NAME group defined yet, create it..."
    sudo groupadd -f --gid 90001 MY_SUB_PROJECT_NAME
fi

set +e
myUser2=$(awk -F":" '{print $1}' /etc/passwd | grep -w MY_SUB_PROJECT_NAME)
set -e
if [ "X${myUser2}" = "X" ]; then
    info "no MY_SUB_PROJECT_NAME user defined yet, create it..."
    sudo useradd -m -p Passw0rd --uid 90001 --gid 90001 MY_SUB_PROJECT_NAME
fi

if [ ! -d /var/MY_SUB_PROJECT_NAME ]; then
    info "no /var/MY_SUB_PROJECT_NAME directory found, create it..."
    sudo mkdir -p /var/MY_SUB_PROJECT_NAME/data
    sudo mkdir -p /var/MY_SUB_PROJECT_NAME/config
    sudo chown -R MY_SUB_PROJECT_NAME:MY_SUB_PROJECT_NAME /var/MY_SUB_PROJECT_NAME
fi

done_banner "MY_SUB_PROJECT_NAME" "deploy prepare"
