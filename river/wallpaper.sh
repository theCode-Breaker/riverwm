#!/usr/bin/env bash
swaybg_instances=$(ps axh | grep swaybg | grep -v grep | awk '{print $1}')

if [[ -f /tmp/currentwall ]];then
	image=$( find ~/Pictures/wallpapers -type f | grep -v $(cat /tmp/currentwall) | shuf | head -n 1)
else
	image=$(find ~/Pictures/wallpapers -type f | shuf | head -n 1)
fi

echo $image > /tmp/currentwall
setsid -f swaybg -i $image
sleep 1 # for a smooth transition with no flicker
for instance in $swaybg_instances; do
	kill -9 $instance 1>/dev/null 2>&1
done
