#!/bin/bash

# Creating a trap to remove $BUILDROOT_PATH when some signal is received
#trap "rm -rf $BUILDROOT_PATH; exit" SIGHUP SIGINT SIGTERM

#exec 3>&1;
result=$(
      dialog --stdout --backtitle 'Wearable OS Builder Tool' \
      --title 'Buildroot path' \
      --inputbox 'Input the full path to the Buildroot instalation root dir:' 8 60 $CONF_BUILDROOT_PATH 1>./input.txt);
pressedKey=$?
BUILDROOT_PATH=$(cat ./input.txt)
rm -rf ./input.txt

if [[ "$BUILDROOT_PATH" = "" && "$CONF_BUILDROOT_PATH" = "" ]]; then
   dialog --backtitle 'Wearable OS Builder Tool' \
          --msgbox 'Invalid path!!' 0 0
else
   if [ "$BUILDROOT_PATH" != "" ]; then
      CONF_BUILDROOT_PATH=$BUILDROOT_PATH
   fi
fi

# if CANCEL or ESC key is pressed...
[ $? -ne 0 ] && break
