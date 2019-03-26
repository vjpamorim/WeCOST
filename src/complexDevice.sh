#!/bin/bash

#exitoption=1
#while [ $exitoption -eq 1 ]; do
cmd=(dialog --separate-output --no-tags
            --backtitle 'Wearable OS Builder Tool'
            --title 'New wearable OS - Complex device functionalities selection'
            --checklist 'Select the assertives which better describe your wearable device:' 0 0 0)
options=(1 'Makes use of AI techniques?' $COMPLEXDEV_AI
         2 'Requires GPU use?' $COMPLEXDEV_GPU
         3 'Demand high processing?' $COMPLEXDEV_HIGHPROC
         4 'Demand high level of parallelism?' $COMPLEXDEV_HIGHPARALLEL)
choices_com=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

# Reinitilize vars values to keep the coherence only when OK is pressed
pressedKey=$?
if [[ $pressedKey -ne 1 && $pressedKey -ne 255 ]] 
then
   COMPLEXDEV_AI=off;
   COMPLEXDEV_GPU=off;
   COMPLEXDEV_HIGHPROC=off;
   COMPLEXDEV_HIGHPARALLEL=off;

   for choice in $choices_com
   do
      case $choice in
         1) COMPLEXDEV_AI=on;;
         2) COMPLEXDEV_GPU=on;;
         3) COMPLEXDEV_HIGHPROC=on;;
         4) COMPLEXDEV_HIGHPARALLEL=on;;
      esac
   done
fi
#done
