#!/bin/bash

# Creating a trap to remove $BUILDROOT_URL when some signal is received
#trap "rm -rf $BUILDROOT_URL; exit" SIGHUP SIGINT SIGTERM

#exec 3>&1;
result=$(
      dialog --stdout --backtitle 'Wearable OS Builder Tool' \
      --title 'Buildroot url' \
      --inputbox 'Input the url in case it should be downloaded:' 8 60 $CONF_BUILDROOT_URL 1>./input.txt);
pressedKey=$?
BUILDROOT_URL=$(cat ./input.txt)
rm -rf ./input.txt

if [[ "$BUILDROOT_URL" = "" && "$CONF_BUILDROOT_URL" = "" ]]; then
   dialog --backtitle 'Wearable OS Builder Tool' \
          --msgbox 'Invalid url!!' 0 0
else
   if [ "$BUILDROOT_URL" != "" ]; then
      CONF_BUILDROOT_URL=$BUILDROOT_URL
   fi
fi

# if CANCEL or ESC key is pressed...
[ $? -ne 0 ] && break
