#!/bin/bash

#exitoption=1
#while [ $exitoption -eq 1 ]; do
cmd=(dialog --separate-output --no-tags
             --backtitle 'Wearable OS Builder Tool'
             --title 'New wearable OS - Simple device functionalities selection'
             --checklist 'Select the assertives which better describe your wearable device:' 0 0 0)
options=(1 'Has a simple display?' $SIMPLEDEV_HASDISPLAY 
         2 'Can be considered as an IoT device?' $SIMPLEDEV_IOT
         3 'Sensitize large amounts of data?' $SIMPLEDEV_SENDLARGEDATA
	 4 'Receive large amounts of data?' $SIMPLEDEV_RECVLARGEDATA
         5 'Sensitize small amounts of data?' $SIMPLEDEV_SENDSMALLDATA
	 6 'Receive small amounts of data?' $SIMPLEDEV_RECVSMALLDATA)
choices_sim=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

# Reinitilize vars values to keep the coherence only when OK is pressed
pressedKey=$?
if [[ $pressedKey -ne 1  &&  $pressedKey -ne 255 ]] 
then
   SIMPLEDEV_HASDISPLAY=off;
   SIMPLEDEV_IOT=off;
   SIMPLEDEV_SENDLARGEDATA=off;
   SIMPLEDEV_RECVLARGEDATA=off;
   SIMPLEDEV_SENDSMALLDATA=off;
   SIMPLEDEV_RECVSMALLDATA=off;

   for choice in $choices_sim
   do
      case $choice in
         1) SIMPLEDEV_HASDISPLAY=on;;
         2) SIMPLEDEV_IOT=on;;
         3) SIMPLEDEV_SENDLARGEDATA=on;;
         4) SIMPLEDEV_RECVLARGEDATA=on;;
         5) SIMPLEDEV_SENDSMALLDATA=on;;
         6) SIMPLEDEV_RECVSMALLDATA=on;;
      esac
   done
fi
# if CANCEL or ESC key is pressed...
#[ $? -ne 0 ] && break
#done
