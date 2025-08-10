#!/bin/bash

#75 1059
#117 1059
#159 1059
#201 1059
#243 1059
#285 1059
#xdotool mousemove --screen 0 75 1059 click 1
# sleep 0.1  # Small delay to ensure the click registers
# xdotool mousemove_relative -- 0 -50  # Move the mouse 10 pixels up

# Store the current mouse position
eval $(xdotool getmouselocation --shell)

# Move to target position and click
xdotool mousemove --screen 0.10 1059 click 1 #horizontal
xdotool mousemove --screen 0 49 989 click 1 #horizontal
# xdotool mousemove --screen 0.185 1900 click 1 #vertical
# xdotool mousemove --screen 0 17 267 click 1
sleep 0.1  # Small delay to ensure the click registers

# Move the mouse up slightly
# xdotool mousemove_relative -- 0 -10
# sleep 0.1  # Small delay

# Move back to the original position
# xdotool mousemove --screen $SCREEN $X $Y
