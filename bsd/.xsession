export LC_CTYPE="sv_SE.UTF-8"
xrdb -load .Xresources_gruvbox_dark
xset -b                           # No BEEP!
# Make CAPS-LOCK another Win-key
#     setxkbmap -option caps:super  
# OR: xmodmap .xmodmap.capslock_win
# I prefer to make CAPS LOCK another ESC
xmodmap .xmodmap.capslock_esc
exec i3
