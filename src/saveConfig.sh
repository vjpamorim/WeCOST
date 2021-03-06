#!/bin/bash

result=$(
      dialog --stdout --backtitle 'Wearable OS Builder Tool' \
      --title 'Save Configurations' \
      --inputbox 'Input the filename you want to use to save current configurations:' 8 60 $CONF_SAVECONF_PATH 1>./saveconf.txt);
pressedKey=$?
CONF_SAVECONF_PATH=$(cat ./saveconf.txt)
rm -rf ./saveconf.txt

if [ "$CONF_SAVECONF_PATH" = "" ]; then
   dialog --backtitle 'Wearable OS Builder Tool' \
          --msgbox 'Invalid filename!!' 0 0
else
   CONF_SAVECONF_PATH="./$CONF_SAVECONF_PATH"
   echo "CONF_BUILDROOT_PATH=$CONF_BUILDROOT_PATH
CONF_SAVECONF_PATH=$CONF_SAVECONF_PATH
CONF_OUTDIR_PATH=$CONF_OUTDIR_PATH
CONF_ARCH_X86=$CONF_ARCH_X86
CONF_ARCH_ARM=$CONF_ARCH_ARM
CONF_BUILDROOT_URL=$CONF_BUILDROOT_URL
SIMPLEDEV_HASDISPLAY=$SIMPLEDEV_HASDISPLAY
SIMPLEDEV_IOT=$SIMPLEDEV_IOT
SIMPLEDEV_SENDLARGEDATA=$SIMPLEDEV_SENDLARGEDATA
SIMPLEDEV_RECVLARGEDATA=$SIMPLEDEV_RECVLARGEDATA
SIMPLEDEV_SENDSMALLDATA=$SIMPLEDEV_SENDSMALLDATA
SIMPLEDEV_RECVSMALLDATA=$SIMPLEDEV_RECVSMALLDATA
INTERMDEV_HASINTERACTIVITY=$INTERMDEV_HASINTERACTIVITY
INTERMDEV_DRAWTEXT=$INTERMDEV_DRAWTEXT
INTERMDEV_2DGRAPHS=$INTERMDEV_2DGRAPHS
INTERMDEV_3DGRAPHS=$INTERMDEV_3DGRAPHS
INTERMDEV_ARVRSOL=$INTERMDEV_ARVRSOL
COMPLEXDEV_AI=$COMPLEXDEV_AI
COMPLEXDEV_GPU=$COMPLEXDEV_GPU
COMPLEXDEV_HIGHPROC=$COMPLEXDEV_HIGHPROC
COMPLEXDEV_HIGHPARALLEL=$COMPLEXDEV_HIGHPARALLEL
ADS115_AD=$ADS115_AD
AM2302_SENSOR=$AM2302_SENSOR
BNO055_SENSOR=$BNO055_SENSOR
MAX30100_SENSOR=$MAX30100_SENSOR
MCP3008_AD=$MCP3008_AD
MPU6050_SENSOR=$MPU6050_SENSOR
RPI_ZERO_WIFI_INTERF=$RPI_ZERO_WIFI_INTERF
ADS115_AD_URL=$ADS115_AD_URL
PUREIO_URL=$PUREIO_URL
AM2302_SENSOR_URL=$AM2302_SENSOR_URL
BNO055_SENSOR_URL=$BNO055_SENSOR_URL
MAX30100_SENSOR_URL=$MAX30100_SENSOR_URL
MCP3008_AD_URL=$MCP3008_AD_URL
MPU6050_SENSOR_URL=$MPU6050_SENSOR_URL
RPI_ZERO_WIFI_INTERF_URL=$RPI_ZERO_WIFI_INTERF_URL">$CONF_SAVECONF_PATH;
fi

# if CANCEL or ESC key is pressed...
[ $? -ne 0 ] && break

