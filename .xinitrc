#!/bin/sh

# for fcitx5 mozc japanese input to work properly
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

exec ~/.rundwm
