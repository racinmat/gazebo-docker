#FROM ubuntu:14.04
#
#RUN rm /bin/sh && ln -s /bin/bash /bin/sh
#RUN apt-get update && apt-get install -y firefox
#
#
## added by me
#RUN sudo apt-get install -y xvfb
#
#RUN Xvfb :0 -screen 0 1920x1080x24 +extension GLX -nolisten tcp -dpi 96 && \
#     echo "export DISPLAY=192.168.0.156:0" >> ~/.bashrc && \
#     echo "export XDG_RUNTIME_DIR=/tmp/" >> ~/.bashrc
#
#CMD /usr/bin/firefox
#
## docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox


# Firefox over VNC
#
# VERSION               0.1
# DOCKER-VERSION        0.2
#
FROM    ubuntu:14.04
# make sure the package repository is up to date
RUN     rm /bin/sh && ln -s /bin/bash /bin/sh
RUN     echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN     sudo apt-get update

# Install vnc, xvfb in order to create a 'fake' display and firefox
RUN     sudo apt-get install -y x11vnc xvfb firefox
RUN     mkdir ~/.vnc
# Setup a password
RUN     x11vnc -storepasswd 1234 ~/.vnc/passwd
# Autostart firefox (might not be the best way to do it, but it does the trick)
RUN     echo "firefox" >> /.bashrc