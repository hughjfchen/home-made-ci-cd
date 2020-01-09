#!/usr/bin/env bash
set -Eeuo pipefail

guard_bash_error () {
    set -Eeuo pipefail
}

### turn path within script into absolute path
### must pass the calling string of the script as the first parameter
### e.g., ./path_to_script/script.sh
### or, /root/path_to_script/script.sh
### return the absolute path to the script with "echo" command
turn_to_absolute_path () {
    local SCRIPT_ABS_PATH_RAW="$(dirname "$1")"
    # turn SCRIPT_ABS_PATH into absolute path
    case ${SCRIPT_ABS_PATH_RAW} in
        /*) echo "${SCRIPT_ABS_PATH_RAW}" ;;
        \.\.*) echo "$PWD/${SCRIPT_ABS_PATH_RAW}" ;;
        \.*) echo "$PWD/${SCRIPT_ABS_PATH_RAW}" ;;
        *) echo "$PWD" ;;
    esac
}

### change CD to up to the project root directory
### must pass the absolute path to the script as the first parameter
change_CD_to_project_root () {
    cd "$1"
    local up_level=..
    local my_loop=10 # guard not to loop forever
    until ls "${up_level}"|grep -w DevOps > /dev/null 2>&1 && [ ${my_loop} -gt 0 ]
    do
        up_level=${up_level}/..
        my_loop=$(expr ${my_loop} - 1)
    done
    if [ ${my_loop} -eq 0 ]; then
        echo "Too many level up within the searching for DevOps directory,abort."
        exit 1
    fi
    cd "$1/${up_level}"
}

### check OS and distribution
### return the OS distribution and ID with "echo" command
check_dist_or_OS () {
    local MY_THE_DISTRIBUTION_ID=""
    local MY_THE_DISTRIBUTION_VERSION=""
    if [ -e /etc/os-release ]; then
        MY_THE_DISTRIBUTION_ID=$(grep -w "ID" /etc/os-release |awk -F"=" '{print $NF}'|sed 's/"//g')
        MY_THE_DISTRIBUTION_VERSION=$(grep -w "VERSION_ID" /etc/os-release |awk -F"=" '{print $NF}'|awk -F"." '{print $1}'|sed 's/"//g')
        echo "${MY_THE_DISTRIBUTION_ID} ${MY_THE_DISTRIBUTION_VERSION}"
    else if type uname > /dev/null 2>&1; then
             MY_THE_DISTRIBUTION_ID=$(uname -s)
             MY_THE_DISTRIBUTION_VERSION=$(uname -r)
             echo "${MY_THE_DISTRIBUTION_ID} ${MY_THE_DISTRIBUTION_VERSION}"
         else
             echo ""
         fi
    fi
}

### guard that the caller of the script must be root or has sudo right
guard_root_or_sudo () {
    if [[ $EUID > 0 ]] && ! sudo -v >/dev/null 2>&1; then
        return 1
    else
        return 0
    fi
}

### init script with check if root or sudo
init_with_root_or_sudo () {
    guard_bash_error

    if ! guard_root_or_sudo; then
        echo "You must be root or you must be sudoer to prepare the env for CI/CD."
        exit 1
    fi

    SCRIPT_ABS_PATH=$(turn_to_absolute_path $0)

    change_CD_to_project_root ${SCRIPT_ABS_PATH}

    THE_DISTRIBUTION_ID_VERSION=$(check_dist_or_OS)
    THE_DISTRIBUTION_ID=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $1}')
    THE_DISTRIBUTION_VERSION=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $2}')
}

### init script without check if root or sudo
init_without_root_or_sudo () {
    guard_bash_error

    SCRIPT_ABS_PATH=$(turn_to_absolute_path $0)

    change_CD_to_project_root ${SCRIPT_ABS_PATH}

    THE_DISTRIBUTION_ID_VERSION=$(check_dist_or_OS)
    THE_DISTRIBUTION_ID=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $1}')
    THE_DISTRIBUTION_VERSION=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $2}')
}

usage_and_exit () {
            echo "Usage: init.sh [top <location> <phase>| sub-docker <sub project name to deploy on docker> <location> <phase>| sub-non-docker <sub project name to deploy with tarball> <location> <phase>]"
            exit 1
}

set +u
SCRIPT_ABS_PATH=$(turn_to_absolute_path $0)
case $1 in
    top) [[ "X$2" = "X" ]] && usage_and_exit
         [[ "X$3" = "X" ]] && usage_and_exit
         [[ ! -d ./DevOps/common ]] && (mkdir -p ./DevOps/common ; cp -R ${SCRIPT_ABS_PATH}/template/DevOps/common/* ./DevOps/common/)
         mkdir -p ./DevOps/"$2"/"$3"
         cp -R ${SCRIPT_ABS_PATH}/template/DevOps/location/phase/* ./DevOps/"$2"/"$3"/
         ;;
    sub-docker)
        [[ "X$2" = "X" ]] && usage_and_exit
        [[ "X$3" = "X" ]] && usage_and_exit
        [[ "X$4" = "X" ]] && usage_and_exit
        [[ ! -d ./DevOps/common ]] && (mkdir -p ./DevOps/common ; cp -R ${SCRIPT_ABS_PATH}/template/some-docker-deploy-sub-project/DevOps/common/* ./DevOps/common/)
        mkdir -p ./DevOps/"$3"/"$4"
        cp -R ${SCRIPT_ABS_PATH}/template/some-docker-deploy-sub-project/DevOps/location/phase/* ./DevOps/"$3"/"$4"/
        for FILE_TO_SED in $(grep -R MY_SUB_PROJECT_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_SUB_PROJECT_NAME/$2/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        for FILE_TO_SED in $(grep -R MY_LOCATION_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_LOCATION_NAME/$3/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        for FILE_TO_SED in $(grep -R MY_PHASE_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_PHASE_NAME/$4/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        if [ "X$3" = "Xlocal" ] && [ "X$4" = "Xdev" ] && [ -e ./"$2".cabal ]; then
            sed -i.bak.for.sed.inplace.edit "/nix-build/d" ./DevOps/"$3"/"$4"/build/build.sh
            rm -fr ./DevOps/"$3"/"$4"/build/build.sh.bak.for.sed.inplace.edit
        else
            sed -i.bak.for.sed.inplace.edit "/nix-shell/d" ./DevOps/"$3"/"$4"/build/build.sh
            rm -fr ./DevOps/"$3"/"$4"/build/build.sh.bak.for.sed.inplace.edit
        fi
        ;;
    sub-non-docker) 
        [[ "X$2" = "X" ]] && usage_and_exit
        [[ "X$3" = "X" ]] && usage_and_exit
        [[ "X$4" = "X" ]] && usage_and_exit
        [[ ! -d ./DevOps/common ]] && (mkdir -p ./DevOps/common ; cp -R ${SCRIPT_ABS_PATH}/template/some-non-docker-deploy-sub-project/DevOps/common/* ./DevOps/common/)
        mkdir -p ./DevOps/"$3"/"$4"
        cp -R ${SCRIPT_ABS_PATH}/template/some-non-docker-deploy-sub-project/DevOps/location/phase/* ./DevOps/"$3"/"$4"/
        for FILE_TO_SED in $(grep -R MY_SUB_PROJECT_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_SUB_PROJECT_NAME/$2/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        for FILE_TO_SED in $(grep -R MY_LOCATION_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_LOCATION_NAME/$3/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        for FILE_TO_SED in $(grep -R MY_PHASE_NAME ./DevOps/*|awk -F":" '{print $1}'|sort|uniq)
        do
            sed -i.bak.for.sed.inplace.edit "s/MY_PHASE_NAME/$4/g" ${FILE_TO_SED}
            rm -fr ${FILE_TO_SED}.bak.for.sed.inplace.edit
        done
        if [ "X$3" = "Xlocal" ] && [ "X$4" = "Xdev" ] && [ -e ./"$2".cabal ]; then
            sed -i.bak.for.sed.inplace.edit "/nix-build/d" ./DevOps/"$3"/"$4"/build/build.sh
            rm -fr ./DevOps/"$3"/"$4"/build/build.sh.bak.for.sed.inplace.edit
        else
            sed -i.bak.for.sed.inplace.edit "/nix-shell/d" ./DevOps/"$3"/"$4"/build/build.sh
            rm -fr ./DevOps/"$3"/"$4"/build/build.sh.bak.for.sed.inplace.edit
        fi
        ;;
    *) usage_and_exit
        ;;
esac
set -u
