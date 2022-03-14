#!/bin/bash

## Kill few processes before their respawn, on a refresh of the Window Manager
## This will prevent multiple instances to run after refresh takes place
## You can grep multiple processes using this script and kill them 

#-- Kill Background-Changer --#
process_id=`/bin/ps -fu $USER| grep "background-changer" | grep -v "grep" | awk '{print $2}'`
kill $process_id

#-- Now freshly start the process in the background --#
bash ~/.config/system_scripts/background-changer &


#-- You can add multiple processes here to prevent their respawns --#
