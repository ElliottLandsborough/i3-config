# audio menu
set $audiomenu "volume:  [+]10%  [-]10%  [m]ute  [r]eset"
bindsym $mod+F12         mode $audiomenu

mode $audiomenu {
    bindsym r             exec --no-startup-id pactl set-sink-volume 1 100%
    bindsym plus          exec --no-startup-id pactl set-sink-volume 1 +5%
    bindsym KP_Add        exec --no-startup-id pactl set-sink-volume 1 +5%
    bindsym minus         exec --no-startup-id pactl set-sink-volume 1 -5%
    bindsym KP_Subtract   exec --no-startup-id pactl set-sink-volume 1 -5%
    bindsym m             exec --no-startup-id pactl set-sink-mute 1 toggle
    bindsym Return        mode "default"
    bindsym Escape        mode "default"
}

# check if headphones or speakers andmake multimedia buttons work
#set $sink `pactl list short sinks | grep RUNNING | cut -f1`
#bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume $sink -- +10%
#bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume $sink -- -10%
#bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute $sink toggle
# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 1 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 1 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 1 toggle # mute sound

# Screen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 10 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 10 # decrease screen brightness
