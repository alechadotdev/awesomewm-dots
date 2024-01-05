#!/usr/bin/env bash

function run {
	if ! pgrep -f $1; then
		$@ &
	fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run nm-applet
run pnmixer
run picom -b
run nitrogen --restore
