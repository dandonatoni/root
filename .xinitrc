#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/local/etc/X11/xinit/.Xresources
sysmodmap=/usr/local/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /usr/local/etc/X11/xinit/xinitrc.d ] ; then
    for f in /usr/local/etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#eval `dbus-launch --sh-syntax --exit-with-session`
#sleep 3

# ON INTEL CHIPS
#Firstly, check that you're using the intel driver as opposed to i810.
#Then, use the following command to start Compiz (this command must be used every time).
#LIBGL_ALWAYS_INDIRECT=true compiz --replace --sm-disable &
# OR OR OROR
#compiz --replace --sm-disable ccp & 
#sleep 10

xdg-user-dirs-update &
exec openbox-session 

tw 
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login

