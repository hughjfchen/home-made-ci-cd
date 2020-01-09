#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "MY_SUB_PROJECT_NAME" "deploy prepare"

if [ ! -L ${SCRIPT_ABS_PATH}/../../../../result ]; then
    info "no MY_SUB_PROJECT_NAME build result found, suppose that the image would be pull from registry"
else
    sg docker -c "docker load -i ${SCRIPT_ABS_PATH}/../../../../result"
fi

MY_SUB_PROJECT_NAME_config_path="/var/MY_SUB_PROJECT_NAME/config"
MY_SUB_PROJECT_NAME_data_path="/var/MY_SUB_PROJECT_NAME/data"

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
    sudo useradd -G docker -m -p Passw0rd --uid 90001 --gid 90001 MY_SUB_PROJECT_NAME
fi

if [ ! -d /var/MY_SUB_PROJECT_NAME ]; then
    info "no /var/MY_SUB_PROJECT_NAME directory found, create it..."
    sudo mkdir -p /var/MY_SUB_PROJECT_NAME/data
    sudo mkdir -p /var/MY_SUB_PROJECT_NAME/config
    sudo chown -R MY_SUB_PROJECT_NAME:MY_SUB_PROJECT_NAME /var/MY_SUB_PROJECT_NAME
fi

MY_SUB_PROJECT_NAME_IMAGE_ID=$(docker images|grep -w MY_SUB_PROJECT_NAME|awk '{print $3}')
cmdPath=$(docker image inspect ${MY_SUB_PROJECT_NAME_IMAGE_ID} | grep "/nix/store/" | awk -F"/" '{print "/nix/store/"$4}')
sudo su -p -c "sed \"s:static_MY_SUB_PROJECT_NAME_nix_store_path:${cmdPath}:g\" < ${SCRIPT_ABS_PATH}/docker-compose.yml > /var/MY_SUB_PROJECT_NAME/docker-compose-MY_SUB_PROJECT_NAME.yml.01" MY_SUB_PROJECT_NAME
sudo su -p -c "sed \"s:MY_SUB_PROJECT_NAME_config_path:${MY_SUB_PROJECT_NAME_config_path}:g\" < /var/MY_SUB_PROJECT_NAME/docker-compose-MY_SUB_PROJECT_NAEM.yml.01 > /var/MY_SUB_PROJECT_NAME/docker-compose-MY_SUB_PROJECT_NAME.yml.02" MY_SUB_PROJECT_NAME 
sudo su -p -c "sed \"s:MY_SUB_PROJECT_NAME_data_path:${MY_SUB_PROJECT_NAME_data_path}:g\" < /var/MY_SUB_PROJECT_NAME/docker-compose-MY_SUB_PROJECT_NAME.yml.02 > /var/MY_SUB_PROJECT_NAME/docker-compose-MY_SUB_PROJECT_NAME.yml" MY_SUB_PROJECT_NAME

done_banner "MY_SUB_PROJECT_NAME" "deploy prepare"
