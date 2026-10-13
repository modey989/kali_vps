FROM kalilinux/kali-rolling
RUN apt update && apt install -y kali-desktop-xfce tightvncserver novnc git sudo
RUN useradd -m -s /bin/bash kali && echo "kali:kali" | chpasswd && usermod -aG sudo kali
EXPOSE 6080
CMD bash -c "su kali -c 'vncserver :1 -geometry 1280x720 -depth 24' && /usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080"
