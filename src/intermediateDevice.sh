#!/bin/bash

#exitoption=1
#while [ $exitoption -eq 1 ]; do
cmd=(dialog  --separate-output --no-tags
             --backtitle 'Wearable OS Builder Tool'
             --title 'New wearable OS - Intermediate device functionalities selection'
             --checklist 'Select the assertives which better describe your wearable device:' 0 0 0)
options=(1 'Has interactivity with final user?' $INTERMDEV_HASINTERACTIVITY
	 2 'Draw "text" of screen?' $INTERMDEV_DRAWTEXT
         3 'Support 2D graphics?' $INTERMDEV_2DGRAPHS
         4 'Support 3D graphics?' $INTERMDEV_3DGRAPHS
         5 'AR/VR solution?' $INTERMDEV_ARVRSOL)
choices_int=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

# Reinitilize vars values to keep the coherence only when OK is pressed
pressedKey=$?
if [[ $pressedKey -ne 1 && $pressedKey -ne 255 ]] 
then
   INTERMDEV_HASINTERACTIVITY=off;
   INTERMDEV_DRAWTEXT=off;
   INTERMDEV_2DGRAPHS=off;
   INTERMDEV_3DGRAPHS=off;
   INTERMDEV_ARVRSOL=off;

   for choice in $choices_int
   do
      case $choice in
         1) INTERMDEV_HASINTERACTIVITY=on;;
         2) INTERMDEV_DRAWTEXT=on;;
         3) INTERMDEV_2DGRAPHS=on;;
         4) INTERMDEV_3DGRAPHS=on;;
         5) INTERMDEV_ARVRSOL=on;;
      esac
   done
fi

#done
