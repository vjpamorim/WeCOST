#!/bin/bash
exitnewso=1
while [ $exitnewso -eq 1 ]; do
   answer=$(
      dialog --stdout --no-tags \
      --backtitle 'Wearable OS Builder Tool' \
      --title 'New Wearable OS' \
      --menu 'Select the complexity level and hardware components of your wearable device:'\
      10 50 0 \
      1 'Complexity Level' \
      2 'Hardware Components' )

   # if CANCEL or ESC key is pressed...
   [ $? -ne 0 ] && break

   # Call the related scripts according to the selected option
   case "$answer" in
      1) source ./src/complexity.sh;;
      2) source ./src/hardwareComps.sh;;
   esac 
done
