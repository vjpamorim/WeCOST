#!/bin/bash
# Manage all the environment vars

# Manage the environment variables related to the configurations
# Initialize
export_configurations_vars() {
   export CONF_BUILDROOT_PATH="";
   export CONF_SAVECONF_PATH="";
   export CONF_OUTDIR_PATH="";
   export CONF_ARCH_X86=off;
   export CONF_ARCH_ARM=off;
   export CONF_BUILDROOT_URL='';
}

# Unset
unset_configurations_vars() {
   unset CONF_BUILDROOT_PATH;
   unset CONF_SAVECONF_PATH;
   unset CONF_OUTDIR_PATH;
   unset CONF_ARCH_X86;
   unset CONF_ARCH_ARM;

   unset CONF_BUILDROOT_URL;
}

# Manage the environment variables related to Simple wearable devices
# Initialize
export_simpledev_vars() {
   export SIMPLEDEV_HASDISPLAY=off;
   export SIMPLEDEV_IOT=off;
   export SIMPLEDEV_SENDLARGEDATA=off;
   export SIMPLEDEV_RECVLARGEDATA=off;
   export SIMPLEDEV_SENDSMALLDATA=off;
   export SIMPLEDEV_RECVSMALLDATA=off;
}

# Unset
unset_simpledev_vars() {
   unset SIMPLEDEV_HASDISPLAY;
   unset SIMPLEDEV_IOT;
   unset SIMPLEDEV_SENDLARGEDATA;
   unset SIMPLEDEV_RECVLARGEDATA;
   unset SIMPLEDEV_SENDSMALLDATA;
   unset SIMPLEDEV_RECVSMALLDATA;
}

# Manage the environment variables related to intermediate wearable devices
# Initialize
export_intermdev_vars() {
   export INTERMDEV_HASINTERACTIVITY=off;
   export INTERMDEV_DRAWTEXT=off;
   export INTERMDEV_2DGRAPHS=off;
   export INTERMDEV_3DGRAPHS=off;
   export INTERMDEV_ARVRSOL=off;
}

# Unset
unset_intermdev_vars() {
   unset INTERMDEV_HASINTERACTIVITY;
   unset INTERMDEV_DRAWTEXT;
   unset INTERMDEV_2DGRAPHS;
   unset INTERMDEV_3DGRAPHS;
   unset INTERMDEV_ARVRSOL;
}


# Manage the environment variables related to complex wearable devices
# Initialize
export_complexdev_vars() {
   export COMPLEXDEV_AI=off;
   export COMPLEXDEV_GPU=off;
   export COMPLEXDEV_HIGHPROC=off;
   export COMPLEXDEV_HIGHPARALLEL=off;
}

# Unset
unset_complexdev_vars() {
   unset COMPLEXDEV_AI;
   unset COMPLEXDEV_GPU;
   unset COMPLEXDEV_HIGHPROC;
   unset COMPLEXDEV_HIGHPARALLEL;
}

# Manage the environment variables related to hardware components
# Initialize
export_hardware_vars() {
   export ADS115_AD=off;
   export AM2302_SENSOR=off;
   export BNO055_SENSOR=off;
   export MAX30100_SENSOR=off;
   export MCP3008_AD=off;
   export MPU6050_SENSOR=off;
   export RPI_ZERO_WIFI_INTERF=off;

   export ADS115_AD_URL='https://github.com/adafruit/Adafruit_Python_ADS1x15'
   export PUREIO_URL='https://github.com/adafruit/Adafruit_Python_PureIO'
   export AM2302_SENSOR_URL='https://github.com/adafruit/Adafruit_Python_DHT'
   export BNO055_SENSOR_URL='https://github.com/adafruit/Adafruit_Python_GPIO'
   export MAX30100_SENSOR_URL=''
   export MCP3008_AD_URL='https://github.com/adafruit/Adafruit_Python_MCP3008'
   export MPU6050_SENSOR_URL=''
   export RPI_ZERO_WIFI_INTERF_URL=''
}

# Unset
unset_hardware_vars() {
   unset ADS115_AD;
   unset AM2302_SENSOR;
   unset BNO055_SENSOR;
   unset MAX30100_SENSOR;
   unset MCP3008_AD;
   unset MPU6050_SENSOR;
   unset RPI_ZERO_WIFI_INTERF;

   unset ADS115_AD_URL;
   unset PUREIO_URL;
   unset AM2302_SENSOR_URL;
   unset BNO055_SENSOR_URL;
   unset MAX30100_SENSOR_URL;
   unset MCP3008_AD_URL;
   unset MPU6050_SENSOR_URL;
   unset RPI_ZERO_WIFI_INTERF_URL;
}

# Main functions to initialize and destroy related environment vars
initialize_vars() {
   export_configurations_vars
   export_simpledev_vars
   export_intermdev_vars
   export_complexdev_vars
   export_hardware_vars
}

destroy_vars() {
   unset_configurations_vars
   unset_simpledev_vars
   unset_intermdev_vars
   unset_complexdev_vars
   unset_hardware_vars
}
