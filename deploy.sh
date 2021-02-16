#!/bin/bash

TARGET_SCRIPT="install_firefox_addon.sh"

INSTALL_DIR="/usr/local/bin"

INSTALL_FLAG="install"

UNINSTALL_FLAG="uninstall"

#Substitute if the argument length is 1
if [ $# -eq 1 ]; then
   IO=$1
else
   echo "Argument excess or deficiency. Processing flag (installation = ${INSTALL_FLAG} /Uninstall = ${UNINSTALL_FLAG}) To specify. (1 piece)"
   exit 1
fi

if [ ${IO} = ${INSTALL_FLAG} ]; then
    echo "Installation"
    chmod a+rx ${TARGET_SCRIPT} && cp -f ${TARGET_SCRIPT} ${INSTALL_DIR} && echo "Successful installation" && exit 0
    echo "Installation failure"
    exit 2
fi

if [ ${IO} = ${UNINSTALL_FLAG} ]; then
    echo "Uninstall"
    rm -f "${INSTALL_DIR}/${TARGET_SCRIPT}" && echo "Uninstall successful" && exit 0
    echo "Uninstall failure"
    exit 3
fi

echo "Argument error ${INSTALL}"
exit 4
