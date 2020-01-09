#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "deploy unprepare"

if [ -d /var/MY_SUB_PROJECT_NAME ]; then
    info "/var/MY_SUB_PROJECT_NAME directory found, delete it..."
    sudo rm -fr /var/MY_SUB_PROJECT_NAME
fi

set +e
myUser2=$(awk -F":" '{print $1}' /etc/passwd | grep -w MY_SUB_PROJECT_NAME)
if [ "X${myUser2}" != "X" ]; then
    info "MY_SUB_PROJECT_NAME user defined, delete it..."
    sudo userdel -fr MY_SUB_PROJECT_NAME
fi

myGroup2=$(awk -F":" '{print $1}' /etc/group | grep -w MY_SUB_PROJECT_NAME)
if [ "X${myGroup2}" != "X" ]; then
    info "MY_SUB_PROJECT_NAME group defined, delete it..."
    sudo groupdel -f MY_SUB_PROJECT_NAME
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
    Darwin) warn "Don't konw how to uninstall packages for MacOs, skip"
            ;;
    *) my_exit "Unsupported OS/Distribution,abort" 1
       ;;
esac

done_banner "MY_SUB_PROJECT_NAME" "deploy unprepare"
