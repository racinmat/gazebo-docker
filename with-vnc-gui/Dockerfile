FROM azathoth/gazebo:with-simulations

RUN sudo apt-get update && \
    sudo apt-get install -y x11vnc xvfb

# Setup a password
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd
