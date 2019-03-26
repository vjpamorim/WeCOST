#!/bin/bash
exitnewso=1
while [ $exitnewso -eq 1 ]; do
   answer=$(
      dialog --stdout --no-tags \
      --backtitle 'Wearable OS Builder Tool' \
      --title 'New Wearable OS' \
      --menu 'Select the complexity level of your wearable device:'\
      10 50 0 \
      1 'Simple' \
      2 'Intermediate' \
      3 'Complex' )

   # if CANCEL or ESC key is pressed...
   [ $? -ne 0 ] && break

   # Call the related scripts according to the selected option
   case "$answer" in
      1) source ./src/simpleDevice.sh;;
      2) source ./src/intermediateDevice.sh;;
      3) source ./src/complexDevice.sh;;
   esac 
done
