#!/usr/bin/env bash

if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

begin_banner "Top level" "unfinishing"

case ${THE_DISTRIBUTION_ID} in
    rhel) if [ "${THE_DISTRIBUTION_VERSION}" != "7" ] && [ "${THE_DISTRIBUTION_VERSION}" != "8" ]; then
	            my_exit "This CI/CD script only supports RHEL 7.x or 8.x, will abort." 1
          fi
          ;;
    debian) if [ "${THE_DISTRIBUTION_VERSION}" != "9" ] && [ "${THE_DISTRIBUTION_VERSION}" != "10" ] && [ "${THE_DISTRIBUTION_VERSION}" != "11" ]; then
                my_exit "This CI/CD script only supports debian 9.x, 10.x or 11.x, will abort" 1
            fi
            ;;
    ubuntu) if [ "${THE_DISTRIBUTION_VERSION}" != "16.04" ] && [ "${THE_DISTRIBUTION_VERSION}" != "18.04" ] && [ "${THE_DISTRIBUTION_VERSION}" != "20.04" ]; then
                my_exit "This CI/CD script only supports ubuntu 16.04, 18.04 or 20.04, will abort" 1
            fi
            ;;
    centos) if [ "${THE_DISTRIBUTION_VERSION}" != "7" ] && [ "${THE_DISTRIBUTION_VERSION}" != "8" ]; then
                my_exit "This CI/CD script only support Centos 7.x or 8.x, will abort" 1
            fi
            ;;
    Darwin) info "Please note that MacOS only support as a development environment."
            ;;
    *) my_exit "Unsupported linux distribution, will abort" 1
       ;;
esac

done_banner "Top level" "unfinishing"
