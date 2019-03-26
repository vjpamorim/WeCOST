#!/bin/bash
SRC_PATH="./src"

# Include vars management script
source $SRC_PATH/manageVars.sh
initialize_vars;

# Main menu loop
exitoption=1
while [ $exitoption -eq 1 ]; do

    # Shows the main menu on screen
    answer=$(
      dialog --stdout --no-tags \
             --backtitle 'Wearable OS Builder Tool' \
             --title 'Wearable OS Builder'  \
             --menu 'Select one of the following options to proceed:' \
            10 50 0      \
	    1 'New Wearable OS' \
            2 'Configurations'  \
            3 'Generate OS'     \
	    4 'Save Config.'    \
            5 'Load Config.'    \
            0 'Exit'                )

    # If CANCEL or ESC key is pressed...
    [ $? -ne 0 ] && break

    # Call the related scripts according to the selected option
    case "$answer" in
         1) source $SRC_PATH/newOs.sh;; 
         2) source $SRC_PATH/configurations.sh;;
         3) source $SRC_PATH/generateOs.sh;;
         4) source $SRC_PATH/saveConfig.sh;;
         5) source $SRC_PATH/loadConfig.sh;;  
         0) dialog --title 'Confirm exit' --backtitle 'Wearable OS Builder Tool' --yesno 'Are you sure you want exit?' 0 0
            exitoption=$?
    esac
done
destroy_vars;
