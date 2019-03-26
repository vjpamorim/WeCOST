#!/bin/bash
answer=$(dialog --stdout --no-tags \
                --backtitle 'Wearable OS Builder Tool' \
                --title 'Architecture selection' \
                --radiolist 'Select the architecture the wearable OS must have:' \
       0 0 0 1 'X86' $CONF_ARCH_X86 \
             2 'ARM' $CONF_ARCH_ARM)

pressedKey=$?
if [[ $pressedKey -ne 1 && $pressedKey -ne 255 ]]
then
    CONF_ARCH_X86=off;
    CONF_ARCH_ARM=off;

    case $answer in
       1) CONF_ARCH_X86=on;;
       2) CONF_ARCH_ARM=on;;
    esac
fi 
