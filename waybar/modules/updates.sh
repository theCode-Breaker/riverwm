#!/usr/bin/env bash
pkg_updates() {
  updates=$(checkupdates | wc -l)
  aurupdates=$(paru -Qua | wc -l)
  updates=$((updates + aurupdates))
  if [ $updates == 1 ]; then
    echo -n " 1 Update "
  elif [ $updates -ne 0 ];then
    echo -n " $updates Updates "
  fi
}
pkg_updates
