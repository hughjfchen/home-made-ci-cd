#!/usr/bin/env bash
set -Eeuo pipefail

guard_bash_error () {
    set -Eeuo pipefail
}

# Log levels
INFO=0
WARN=1
ERROR=2
FATAL=3
DEBUG=4
DEFAULT_LOG_LEVEL=${ERROR}

my_exit () {
    echo "EXIT: - [HOST:$(hostname)]: - $(date +"%Y-%m-%d %H:%M:%S") - $1"
    exit "$2"
}

msg () {
    if [ "$1" -le ${DEFAULT_LOG_LEVEL} ]; then
        echo "[HOST:$(hostname)]: - $(date +"%Y-%m-%d %H:%M:%S") - $2"
    fi
}

info () {
    msg ${INFO} "INFO: - $1"
}

warn () {
    msg ${WARN} "WARNING: - $1"
}

error () {
    msg ${ERROR} "ERROR: - $1"
}

fatal () {
    msg ${FATAL} "FATAL: - $1"
}

debug () {
    msg ${DEBUG} "DEBUG: - $1"
}

begin_banner () {
    info "$1 - $2 phase - begin"
}

done_banner () {
    info "$1 - $2 phase - done"
}

### turn path within script into absolute path
### must pass the calling string of the script as the first parameter
### e.g., ./path_to_script/script.sh
### or, /root/path_to_script/script.sh
### return the absolute path to the script with "echo" command
turn_to_absolute_path () {
    local SCRIPT_ABS_PATH_RAW
    SCRIPT_ABS_PATH_RAW="$(dirname "$1")"
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
    local up_level=.
    local my_loop=10 # guard not to loop forever
    while [ ${my_loop} -gt 0 ]
    do
        if [ -d "$1/${up_level}"/DevOps ] ; then
           break
        fi
        up_level=${up_level}/..
        my_loop=$((my_loop - 1))
    done
    if [ ${my_loop} -eq 10 ]; then
        my_exit "Too many level up within the searching for DevOps directory,abort." 1
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
	if [ "${MY_THE_DISTRIBUTION_ID}" == "ubuntu" ]; then
	    MY_THE_DISTRIBUTION_VERSION=$(grep -w "VERSION_ID" /etc/os-release |awk -F"=" '{print $NF}'|sed 's/"//g')
        else
            MY_THE_DISTRIBUTION_VERSION=$(grep -w "VERSION_ID" /etc/os-release |awk -F"=" '{print $NF}'|awk -F"." '{print $1}'|sed 's/"//g')
	fi
        echo "${MY_THE_DISTRIBUTION_ID} ${MY_THE_DISTRIBUTION_VERSION}"
    elif type uname > /dev/null 2>&1; then
        MY_THE_DISTRIBUTION_ID=$(uname -s)
        MY_THE_DISTRIBUTION_VERSION=$(uname -r)
        echo "${MY_THE_DISTRIBUTION_ID} ${MY_THE_DISTRIBUTION_VERSION}"
    else
        echo ""
    fi
}

### guard that the caller of the script must be root or has sudo right
guard_root_or_sudo () {
    if [[ $EUID -gt 0 ]] && ! sudo -v >/dev/null 2>&1; then
        return 1
    else
        return 0
    fi
}

### init script with check if root or sudo
init_with_root_or_sudo () {
    guard_bash_error

    if ! guard_root_or_sudo; then
        my_exit "You must be root or you must be sudoer to prepare the env for CI/CD." 1
    fi

    SCRIPT_ABS_PATH=$(turn_to_absolute_path "$1")

    change_CD_to_project_root "${SCRIPT_ABS_PATH}"

    THE_DISTRIBUTION_ID_VERSION=$(check_dist_or_OS)
    THE_DISTRIBUTION_ID=$(echo "${THE_DISTRIBUTION_ID_VERSION}"|awk '{print $1}')
    THE_DISTRIBUTION_VERSION=$(echo "${THE_DISTRIBUTION_ID_VERSION}"|awk '{print $2}')
}

### init script without check if root or sudo
init_without_root_or_sudo () {
    guard_bash_error

    SCRIPT_ABS_PATH=$(turn_to_absolute_path "$1")

    change_CD_to_project_root "${SCRIPT_ABS_PATH}"

    THE_DISTRIBUTION_ID_VERSION=$(check_dist_or_OS)
    THE_DISTRIBUTION_ID=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $1}')
    THE_DISTRIBUTION_VERSION=$(echo ${THE_DISTRIBUTION_ID_VERSION}|awk '{print $2}')
}

### walk the folder and install the pkgs
install_sub_folder_pkgs () {
    for MY_PKG_DIR in "$1"/*
    do
        if [ -d "${MY_PKG_DIR}" ] ; then
            info "Processing installation for the folder ${MY_PKG_DIR} - begin"
            if [ -x "${MY_PKG_DIR}"/install.sh ] ; then
                if [ ! -x "${MY_PKG_DIR}"/uninstall.sh ] ; then
                    warn "There's a install.sh under ${MY_PKG_DIR} but no corresponding uninstall.sh"
                fi
                sudo sh -c "${MY_PKG_DIR}/install.sh" # run the install.sh to install pkgs customizedly
            else # install pkg accordingly with the corresponding pkg manager normally
                PKG_TO_INSTALL=""
                case $2 in
                    rpm)
                        for MY_PKG in "${MY_PKG_DIR}"/*.rpm
                        do
                            # check if the pkg has been installed
                            THE_RPM_N=$(rpm -qp --queryformat="%{NAME}" --nosignature "${MY_PKG}")
                            THE_RPM_V=$(rpm -qp --queryformat="%{VERSION}" --nosignature "${MY_PKG}")
                            if rpm -q "${THE_RPM_N}" > /dev/null ; then
                                INSTALLED_V=$(rpm -q --queryformat="%{VERSION}" "${THE_RPM_N}")
                            else
                                INSTALLED_V=""
                            fi
                            LESS_V=$(printf "%s\n" "${THE_RPM_V}" "${INSTALLED_V}" | sort -V | head -1)
                            if [ -n "${INSTALLED_V}" ] && [ "${LESS_V}" == "${THE_RPM_V}" ] ; then
                                info "the ${THE_RPM_N} with version ${INSTALLED_V}(Equal or Higher that ${THE_RPM_V}) has been installed, skipping..."
                            else
                                PKG_TO_INSTALL=$(printf "%s %s" "${MY_PKG}" "${PKG_TO_INSTALL}")
                            fi
                        done
                        if [ -n "${PKG_TO_INSTALL}" ] ; then
                            sudo yum install -y ${PKG_TO_INSTALL} #FIXIT: can we install forcefully if pkgs already installed?
                        fi
                        ;;
                    deb)
                        for MY_PKG in "${MY_PKG_DIR}"/*.deb
                        do
                            # check if the pkg has been installed
                            THE_PKG_N=$(dpkg-deb --field "${MY_PKG}" Package)
                            THE_PKG_V=$(dpkg-deb --field "${MY_PKG}" Version)
                            if dpkg-query --show "${THE_PKG_N}" > /dev/null ; then
                                INSTALLED_V=$(dpkg-query --show "${THE_PKG_N}" | awk '{print $2}')
                            else
                                INSTALLED_V=""
                            fi
                            LESS_V=$(printf "%s\n" "${THE_PKG_V}" "${INSTALLED_V}" | sort -V | head -1)
                            if [ -n "${INSTALLED_V}" ] && [ "${LESS_V}" == "${THE_PKG_V}" ]; then
                                info "the ${THE_PKG_N} with version ${INSTALLED_V}(Equal or Higher that ${THE_PKG_V}) has been installed, skipping..."
                            else
                                PKG_TO_INSTALL=$(printf "%s %s" "${MY_PKG}" "${PKG_TO_INSTALL}")
                            fi
                        done
                        if [ -n "${PKG_TO_INSTALL}" ] ; then
                            sudo dpkg -i --nodeps ${PKG_TO_INSTALL} #FIXIT: can we install forcefully if pkgs already installed?
                        fi
                        ;;
                    *) my_exit "not supported pkg format, exit..." 222
                       ;;
                esac
            fi
            info "Processing installation for the folder ${MY_PKG_DIR} - done"
        fi
    done
}

### walk the folder and uninstall the pkgs
uninstall_sub_folder_pkgs () {
    for MY_PKG_DIR in "$1"/*
    do
        if [ -d "${MY_PKG_DIR}" ] ; then
            info "Processing uninstallation for the folder ${MY_PKG_DIR} - begin"
            if [ -x "${MY_PKG_DIR}"/uninstall.sh ] ; then
                if [ ! -x "${MY_PKG_DIR}"/install.sh ] ; then
                    warn "There's an uninstall.sh under ${MY_PKG_DIR} but no corresponding install.sh"
                fi
                sudo sh -c "${MY_PKG_DIR}/uninstall.sh" # run the uninstall.sh to uninstall pkgs customizedly
            else # uninstall pkg accordingly with the corresponding pkg manager normally
                PKG_TO_UNINSTALL=""
                case $2 in
                    rpm)
                        for MY_PKG in "${MY_PKG_DIR}"/*.rpm
                        do
                            # check if the pkg has been installed
                            THE_RPM_N=$(rpm -qp --queryformat="%{NAME}" --nosignature "${MY_PKG}")
                            THE_RPM_V=$(rpm -qp --queryformat="%{VERSION}" --nosignature "${MY_PKG}")
                            if rpm -q "${THE_RPM_N}" > /dev/null ; then
                                INSTALLED_V=$(rpm -q --queryformat="%{VERSION}" "${THE_RPM_N}")
                            else
                                INSTALLED_V=""
                            fi
                            if [ -z "${INSTALLED_V}" ] || [ ! "${INSTALLED_V}" == "${THE_RPM_V}" ]; then
                                info "the ${THE_RPM_N} with version ${THE_RPM_V}(installed version:${INSTALLED_V}) has not been installed, skipping..."
                            else
                                PKG_TO_UNINSTALL=$(printf "%s %s" "${THE_RPM_N}" "${PKG_TO_UNINSTALL}")
                            fi
                        done
                        if [ -n "${PKG_TO_UNINSTALL}" ] ; then
                            sudo rpm -e ${PKG_TO_UNINSTALL}
                        fi
                        ;;
                    deb)
                        for MY_PKG in "${MY_PKG_DIR}"/*.deb
                        do
                            # check if the pkg has been installed
                            THE_PKG_N=$(dpkg-deb --field "${MY_PKG}" Package)
                            THE_PKG_V=$(dpkg-deb --field "${MY_PKG}" Version)
                            if dpkg-query --show "${THE_PKG_N}" > /dev/null 2>&1 ; then
                                INSTALLED_V=$(dpkg-query --show "${THE_PKG_N}" | awk '{print $2}')
                            else
                                INSTALLED_V=""
                            fi
                            if [ -z "${INSTALLED_V}" ] || [ ! "${INSTALLED_V}" == "${THE_PKG_V}" ]; then
                                info "the ${THE_PKG_N} with version ${THE_PKG_V}(installed version:${INSTALLED_V}) has not been installed, skipping..."
                            else
                                PKG_TO_UNINSTALL=$(printf "%s %s" "${THE_PKG_N}" "${PKG_TO_UNINSTALL}")
                            fi
                        done
                        if [ -n "${PKG_TO_UNINSTALL}" ] ; then
                            sudo dpkg --purge ${PKG_TO_UNINSTALL} #FIXIT: can we install forcefully if pkgs already installed?
                        fi
                        ;;
                    *) my_exit "not supported pkg format, exit..." 222
                       ;;
                esac
            fi
            info "Processing uninstallation for the folder ${MY_PKG_DIR} - done"
        fi
    done
}
