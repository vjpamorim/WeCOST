#!/bin/bash

result=$(
      dialog --stdout --backtitle 'Wearable OS Builder Tool' \
      --title 'Load Configurations' \
      --inputbox 'Input the filename you want to use to load the previously saved configurations:' 8 60 '' 1>./loadconf.txt);
pressedKey=$?
CONF_LOADCONF_PATH=$(cat ./loadconf.txt)
rm -rf ./loadconf.txt

if [ "$CONF_LOADCONF_PATH" = "" ]; then
   dialog --backtitle 'Wearable OS Builder Tool' \
          --msgbox 'Invalid filename!!' 0 0
else
   source $CONF_LOADCONF_PATH
fi

# if CANCEL or ESC key is pressed...
[ $? -ne 0 ] && break

