#!/bin/sh

#Change the directory in variable "wall" to the directory where your wallpapers are.

wall=$(find /home/$USER/Downloads/Images/Wallpapers -type f -name "*.jpg" -o -name "*.png" -o -name "*.gif" | shuf -n 1)

swww init
swww img $wall

wal -c
wal -i "$wall"
./ewwatch

#uncomment if you want to use the pywalfox firefox extension for the colors to match in Firefox
#pywalfox update

rm -rf /home/$USER/.cache/swww
