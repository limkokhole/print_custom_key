#!/usr/bin/env bash
#Author: <limkokhole@gmail.com>

#$r will produce a lot of error line: `bash: [: too many arguments` if name has spaces's value(.e.g. 'focus gedit'), so use double quotes to surround "$r"
function print_custom_key () 
{ 
    i=0;
    while :; do
        for k in `gsettings list-keys org.gnome.settings-daemon.plugins.media-keys.custom-keybinding`;
        do
            echo -n $k' ';
            r="$(gsettings get org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom$i/ $k)";
            echo "$r";
        done;
        if [ "$r" == "''" ]; then
            break;
        else
            echo;
            ((i++));
        fi;
    done
}

