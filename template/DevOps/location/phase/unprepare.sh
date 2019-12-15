#!/usr/bin/env bash
if ! type dirname > /dev/null 2>&1; then
    echo "Not even a linux or macOS, Windoze? We don't support it. Abort."
    exit 1
fi

. "$(dirname "$0")"/../../common/common.sh

init_with_root_or_sudo "$0"

case ${THE_DISTRIBUTION_ID} in
    rhel) if [ "${THE_DISTRIBUTION_VERSION}" != "7" ]; then
	            echo "This CI/CD script only supports RHEL 7.x, will abort."
              exit 1
          fi
          ;;
    debian) if [ "${THE_DISTRIBUTION_VERSION}" != "9" ]; then
                echo "This CI/CD script only supports debian 9.x, will abort"
                exit 1
            fi
            ;;
    centos) if [ "${THE_DISTRIBUTION_VERSION}" != "7" ]; then
                echoc "This CI/CD script only support Centos 7.x, will abort"
                exit 1
            fi
            ;;
    Darwin) echo "Please note that MacOS only support as a develoment environment."
            ;;
    *) echo "Unsupported linux distribution, will abort"
       exit 1
       ;;
esac

echo "Nothing to do for unprepare. Done"
