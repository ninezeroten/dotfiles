# adjust keyboard typematic delay and rate
xset r rate 270 30

# start Xorg server at this DPI
# gets overwritten by ~/.Xresources
xrandr --dpi 160

# merge & load configuration from .Xresources
xrdb -merge ~/.Xresources

# let QT and GTK autodetect retina screen and autoadjust
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# clear lock as part of swapping caps/esc + load settings from ~/.xmodmap_internal
xmodmap -e "clear Lock"
xmodmap .xmodmap_internal

# start i3-gaps wm
exec i3

