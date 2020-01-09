#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "deploy unprepare"

if [ -d /var/MY_SUB_PROJECT_NAME]; then
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

MY_TO_REMOVE_IMAGES=$(sg docker -c "docker images"|grep -w MY_SUB_PROJECT_NAME|awk '{print $3}')
for MY_TO_REMOVE_IMAGE in ${MY_TO_REMOVE_IMAGES}
do
    sg docker -c "docker image rm -f ${MY_TO_REMOVE_IMAGE}"
done

done_banner "MY_SUB_PROJECT_NAME" "deploy unprepare"
