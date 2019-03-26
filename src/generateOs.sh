#!/bin/bash

BACKTITLE='Wearable OS Builder Tool'
ERROR=0
TMP_PATH='./tmp'
CONFIG_DEFAULT='./configs/buildroot_base/wearableos_rpi0_defconfig'
CONFIG_CURRENT='./configs/buildroot_base/wearableos_rpi0_defconfig_cur'

#download_firmware() {
#   FIRM_PATH="$2/$3"
#   #Check if the firmware was already downloaded
#   if [ ! -d "$FIRM_PATH" ]; then
#      #Download hardware firmware
#      git clone "$1" "$FIRM_PATH"
#   fi
#}

#Check for buildroot local path
if [ "$CONF_BUILDROOT_PATH" = ""  ]; then
   dialog --backtitle "$BACKTITLE" \
          --msgbox 'The OS cannot be generated without a valid path to Buildroot tool!! Insert it through "Configurations" -> "Buildroot path".' 7 60
   [ $? -ne 0 ] && break
   ERROR=1
fi

#Check for buildroot url address
if [ "$CONF_BUILDROOT_URL" = ""  ]; then
   dialog --backtitle "$BACKTITLE" \
          --msgbox 'The OS cannot be generated. A valid URL to Buildroot is required! Insert it through "Configurations" -> "Buildroot url".' 7 60
   [ $? -ne 0 ] && break
   ERROR=1
fi

#Check if at least one architecture was selected
if [[ $CONF_ARCH_X86 = off && $CONF_ARCH_ARM = off ]]; then
   dialog --backtitle "$BACKTITLE" \
             --msgbox 'The OS cannot be generated without a valid architecture!! Select it through "Configurations" -> "Architecture".' 7 60
   [ $? -ne 0 ] && break
   ERROR=1
fi

#Check for buildroot local path
if [ "$CONF_OUTDIR_PATH" = "" ]; then
   dialog --backtitle "$BACKTITLE" \
          --msgbox 'The OS cannot be generated without a valid path to output directoy!! Input it through "Configurations" -> "Output dir".' 7 60
   [ $? -ne 0 ] && break
   ERROR=1
fi

#Generate OS
if [ "$ERROR" = 1 ]; then
   [ $? -ne 0 ] && break
else
   if [ ! -d "$CONF_BUILDROOT_PATH" ]; then
      #Download Buildroot
      git clone "$CONF_BUILDROOT_URL" "$CONF_BUILDROOT_PATH"
   fi
  
   #Inserting specific codes for selected hardware 
   cp $CONFIG_DEFAULT $CONFIG_CURRENT
   if [ "$ADS115_AD" == on ]; then
      #download_firmware $ADS115_AD_URL $TMP_PATH "ADS115" 	
      #download_firmware $PUREIO_URL $TMP_PATH "PUREIO"
      echo "BR2_PACKAGE_PYTHON_ADAFRUIT_ADS115=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_PYTHON_ADAFRUIT_PUREIO=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_I2C_TOOLS=y" >> $CONFIG_CURRENT
   fi
   
   if [ "$AM2302_SENSOR" == on ]; then
      #download_firmware $AM2302_SENSOR_URL $TMP_PATH "AM2303"
      echo "BR2_PACKAGE_PYTHON_ADAFRUIT_DHT=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_PYTHON_PIP=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_PYTHON_RPI_GPIO=y" >> $CONFIG_CURRENT
   fi
   
   if [ "$BNO055_SENSOR" == on ]; then
      #download_firmware $BNO055_SENSOR_URL $TMP_PATH "BNO055"
      echo "BR2_PACKAGE_PYTHON_ADAFRUIT_GPIO=y" >> $CONFIG_CURRENT
   fi

   if [ "$MAX30100_SENSOR" == on ]; then
      echo "BR2_PACKAGE_BCM2835=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_I2C_TOOLS=y" >> $CONFIG_CURRENT
   fi

   if [ "$MCP3008_AD" == on ]; then
      #download_firmware $MCP3008_AD_URL $TMP_PATH "MCP3008"
      echo "BR2_PACKAGE_PYTHON_ADAFRUIT_MCP3008=y" >> $CONFIG_CURRENT
   fi

   if [ "$MPU6050_SENSOR" == on ]; then
      echo "BR2_PACKAGE_I2C_TOOLS=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_SPI_TOOLS=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_PYTHON_RPI_GPIO=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_BCM2835=y" >> $CONFIG_CURRENT
   fi

   if [ "$RPI_ZERO_WIFI_INTERF" == on ]; then
      echo "BR2_PACKAGE_RPI_FIRMWARE=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_WPA_SUPPLICANT=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_OPENSSH=y" >> $CONFIG_CURRENT
      echo "BR2_PACKAGE_DHCPCD=y" >> $CONFIG_CURRENT
   fi
 
   mv ./configs/wearableos_rpi0_defconfig_cur "$CONF_BUILDROOT_PATH"/configs/wearableos_rpi0_defconfig 
   cd "$CONF_BUILDROOT_PATH"
   make wearableos_rpi0_defconfig
   make
   cd -
fi
