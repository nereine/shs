# Source ~/.Xresources
[[ -f ~/.Xresources ]] && xrdb $HOME ~/.Xresources &

exec bspwm
#exec openbox-session
