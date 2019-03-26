#!/bin/bash

#exitoption=1
#while [ $exitoption -eq 1 ]; do
cmd=(dialog --separate-output --no-tags
            --backtitle 'Wearable OS Builder Tool'
            --title 'New wearable OS - Hardware components'
            --checklist 'Select the hardware comps. of your wearable device:' 0 0 0)
options=(1 'ADS1x15 A/D Conversor' $ADS115_AD
         2 'AM2302 Sensor' $AM2302_SENSOR
         3 'BNO055 (9-DOF) Sensor' $BNO055_SENSOR
         4 'MAX30100 (RCWL-0530) Sensor' $MAX30100_SENSOR
         5 'MCP3008 A/D Conversor' $MCP3008_AD
         6 'MPU6050 Sensor' $MPU6050_SENSOR
         7 'Rpi Zero W Wi-fi interf.' $RPI_ZERO_WIFI_INTERF)
choices_com=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

# Reinitilize vars values to keep the coherence only when OK is pressed
pressedKey=$?
if [[ $pressedKey -ne 1 && $pressedKey -ne 255 ]] 
then
   ADS115_AD=off;
   AM2302_SENSOR=off;
   BNO055_SENSOR=off;
   MAX30100_SENSOR=off;
   MCP3008_AD=off;
   MPU6050_SENSOR=off;
   RPI_ZERO_WIFI_INTERF=off;

   for choice in $choices_com
   do
      case $choice in
         1) ADS115_AD=on;;
	 2) AM2302_SENSOR=on;;
         3) BNO055_SENSOR=on;;
         4) MAX30100_SENSOR=on;;
         5) MCP3008_AD=on;;
         6) MPU6050_SENSOR=on;;
         7) RPI_ZERO_WIFI_INTERF=on;;
      esac
   done
fi
#done
