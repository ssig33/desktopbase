[ -f ~/.xinitrc.* ] && for i in ~/.xinitrc.*
do
    . $i
done

fcitx &
exec dbus-launch --exit-with-session startlxde

