FROM debian:stretch
RUN DEBIAN_FRONTEND=noninteractive apt update && apt upgrade -y && apt install -y dbus  dbus-x11  xorg  xserver-xorg-legacy  xinit  xterm lxde fcitx-skk fcitx-tools locales fonts-migmix fonts-ricty-diminished fonts-vlgothic wget dmenu tmux tig mutt && rm -rf /var/lib/apt/lists/*
RUN sed -i "s/allowed_users=console/allowed_users=anybody/;$ a needs_root_rights=yes" /etc/X11/Xwrapper.config
RUN groupadd netdev
ENV XMODIFIERS @im=fcitx
ENV QT_IM_MODULE fcitx
ENV GTK_IM_MODULE fcitx
ENV DefaultIMModule fcitx
ADD xinitrc /xinitrc
RUN ln -s /xinitrc /root/.xinitrc
RUN apt autoremove -y wicd
RUN locale-gen ja_JP.UTF-8  
ENV LANG ja_JP.UTF-8  
ENV LANGUAGE ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8
ADD chrome.sh /tmp
RUN bash /tmp/chrome.sh
ADD packages.sh /tmp
RUN bash /tmp/packages.sh
ADD vim.sh /tmp
RUN bash /tmp/vim.sh
CMD [ "/usr/bin/startx", "--", "vt7" ]

