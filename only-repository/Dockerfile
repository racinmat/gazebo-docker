FROM ubuntu:14.04

# setting the default shell to bash0
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# installing git, and some shit to get add-apt-repository working
RUN sudo apt-get update && sudo apt-get install -y \
    git \
    software-properties-common \
    python-software-properties

# copying my private key to docker container
COPY ./id_rsa /root/.ssh/id_rsa
# because otherwise the private key is publicly accessible and ssh rejects it
RUN chmod 600 /root/.ssh/id_rsa && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts    # adding github.com to known hosts before cloning

# getting the mbzirc repository
RUN mkdir -p ~/ros_workspace/src/ && \
    cd ~/ros_workspace/src/ && \
    git clone --recursive git@github.com:MBZIRCUPENNCTU/mbzirc.git

# installing ROS
RUN cd ~/ros_workspace/src/mbzirc/miscellaneous/gazebo_install_script && \
    ./install.sh

# ROS prerequisites
RUN sudo apt-get install -y \
    ros-indigo-mavlink \
    ros-indigo-camera-info-manager \
    ros-indigo-control-toolbox \
    ros-indigo-image-view \
    ros-indigo-image-transport \
    ros-indigo-image-transport-plugins \
    ros-indigo-compressed-image-transport \
    ros-indigo-theora-image-transport \
    autotools-dev \ 
    automake \
	libevent-dev \
	libncurses5-dev \
	expect-dev \
	moreutils \
	ros-indigo-multimaster-* \
	ros-indigo-visualization-msgs \
	ros-indigo-smach-* \
	ros-indigo-diagnostic-updater \
	ros-indigo-nav-msgs \
	ros-indigo-angles \
	ros-indigo-rosconsole-bridge \
	ros-indigo-gazebo6-* \
	ros-indigo-eigen-conversions \
	vim \
	sl \
	python-catkin-tools \
	ros-indigo-mavros* \
	xvfb \
	nano \
	dos2unix
# nano is installed to have some normal text editor
# dos2unix is installed to remove line endings from expect script

# Getting binaries for controllers
# adding address used in updateRepository.sh to known hosts
RUN ssh-keyscan mrsl.grasp.upenn.edu >> /root/.ssh/known_hosts
# copying pasword to rsync used in updateRepository.sh
COPY ./rsync_pass /root/rsync_pass
# copying script responible for updating repository in noninteractive manner
COPY ./updateRepository-noninteractive.sh /root/updateRepository-noninteractive.sh
# chmoding so it can be executed, then removing DOS line endings
RUN chmod +x /root/updateRepository-noninteractive.sh && \
    dos2unix /root/updateRepository-noninteractive.sh && \
    dos2unix /root/rsync_pass && \
    cd ~/ros_workspace/src/mbzirc/ && \
    /root/updateRepository-noninteractive.sh

## Building the repository

# install libevent
RUN cd /tmp && \
    wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz && \
    tar -xvf libevent-2.0.22-stable.tar.gz && \
    cd libevent-2.0.22-stable && \
    ./configure && make && \
    sudo make install

# instal tmux
RUN mkdir ~/git && \
    cd ~/git && \
    git clone https://github.com/tmux/tmux.git && \
    cd tmux && \
    sh autogen.sh && \
    ./configure && make && \
    sudo make install-binPROGRAMS

# Compile the repository
#RUN cd ~/ros_workspace && \
#    catkin config --extend ~/quadrotor_control_binaries/install
RUN cd ~/ros_workspace && \
    catkin config --extend ~/quadrotor_control_binaries/install && \
    catkin build

# Add "source ~/ros_workspace/devel/setup.bash" and source it again
# source is part of bash, and not sh, so bash must be called
RUN echo "source ~/ros_workspace/devel/setup.bash" >> ~/.bashrc && \
    source ~/.bashrc
