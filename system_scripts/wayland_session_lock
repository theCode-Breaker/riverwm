#!/bin/bash

MUTEX="${HOME}/.config/lock/river-lock"
LOG="${HOME}/.config/lock/lock-log"
NOLOCK="${HOME}/.config/lock/NOLOCK"

img=$(find ${HOME}/.config/river/backgrounds -type f | shuf -n 1)

#scaleImg=$(feh --bg-fill "$img")
#echo $scaleImg

VERSION="0.5"

log () {
	when=$(date "+%Y-%m-%d %H:%M:%S")
	msg="[lock ${VERSION}] ${when} $1"
	echo "${msg}" >> "${LOG}"
}

lock () {
	if [ ! -f "${NOLOCK}" ]; then
		swaylock -F -l -i $img
	else
		log "${NOLOCK} found, not locking"
	fi
}

if [ "$1" = force ]; then
	log "Forcing lock, removing ${NOLOCK} and ${MUTEX}"
	rm -rf "${NOLOCK}"
	rm -rf "${MUTEX}"
fi

if /bin/mkdir "$MUTEX"; then
	log "Successfully acquired lock"

	trap 'rm -rf "$MUTEX"' 0	# remove mutex when script finishes

	lock
else
	log "cannot acquire lock, giving up on $MUTEX"
	exit 0
fi
