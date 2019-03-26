#!/bin/bash
exitnewso=1
while [ $exitnewso -eq 1 ]; do
   answer=$(
      dialog --stdout --no-tags \
      --backtitle 'Wearable OS Builder Tool' \
      --title 'Configurations' \
      --menu 'Select the item to configure:'\
      10 50 0 \
      1 'Buildroot path' \
      2 'Buildroot url' \
      3 'Architecture' \
      4 'Output dir' )

   # if CANCEL or ESC key is pressed...
   [ $? -ne 0 ] && break

   # Call the related scripts according to the selected option
   case "$answer" in
      1) source ./src/buildrootPath.sh;;
      2) source ./src/buildrootUrl.sh;;
      3) source ./src/architecture.sh;;
      4) source ./src/outputDir.sh;;
   esac 
done
