#!/bin/bash

minidx=1
maxidx=10
declare -A idxtolevel=( [1]=1 [2]=2 [3]=3 [4]=5 [5]=8 [6]=13 [7]=21 [8]=34 [9]=55 [10]=100)
declare -A leveltoidx=( [1]=1 [2]=2 [3]=3 [5]=4 [8]=5 [13]=6 [21]=7 [34]=8 [55]=9 [100]=10)

val=$(echo "($(xbacklight)+0.5)/1" | bc)
idx=${leveltoidx[$val]}
#echo "val: $val"
#echo "idx: $idx"

if [ $1 == "inc" ]; then
    idx=$(echo "if($idx >= $maxidx) $idx else $idx+1" | bc)
    val=${idxtolevel[$idx]}
    xbacklight -time 50 -set $val
fi

if [ $1 == "dec" ]; then
    idx=$(echo "if($idx <= $minidx) $idx else $idx-1" | bc)
    val=${idxtolevel[$idx]}
    xbacklight -time 50 -set $val
fi

sleep 0.2|tee >(zenity --progress --no-cancel --auto-close --width=500 --title="" --text="Brightness: $val\%" --percentage=$val)

