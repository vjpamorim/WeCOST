#!/bin/bash

result=$(
      dialog --stdout --backtitle 'Wearable OS Builder Tool' \
      --title 'Output Dir' \
      --inputbox 'Input the path where the output OS must be placed:' 8 60 $CONF_OUTDIR_PATH 1>./outputdir.txt);
pressedKey=$?
OUTDIR_PATH=$(cat ./outputdir.txt)
rm -rf ./outputdir.txt

if [[ "$OUTDIR_PATH" = "" && "$CONF_OUTDIR_PATH" = "" ]]; then
   dialog --backtitle 'Wearable OS Builder Tool' \
          --msgbox 'Invalid path!!' 0 0
else
   if [ "$OUTDIR_PATH" != "" ]; then
      CONF_OUTDIR_PATH=$OUTDIR_PATH
   fi
fi

# if CANCEL or ESC key is pressed...
[ $? -ne 0 ] && break

