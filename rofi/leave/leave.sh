#!/bin/bash

entries=" Lock\n Logout\n Suspend\n Reboot\n Shutdown"

selected=$(echo -e $entries|rofi --width 250 --height 220 -dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  lock)
    bash ~/.config/system_scripts/wayland_session_lock;;
  logout)
    loginctl terminate-user $USER;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec reboot;;
  shutdown)
    exec poweroff;;
esac
