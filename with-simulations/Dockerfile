FROM azathoth/gazebo:only-repository

RUN cd ~ && \
    git clone git@github.com:MBZIRCUPENNCTU/simulation.git && \
    cd simulation && \
    git submodule update --init --recursive && \
    sudo apt-get install cmake gcc g++

RUN cd ~/simulation && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=~/simulation/install && \
    make && \
    make install

RUN echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc && \
    echo "source ~/simulation/install/share/simulation/setup.sh" >> ~/.bashrc && \
    source ~/.bashrc

RUN echo 'export GAZEBO_MODEL_PATH=$GAZEBO_MODEL_PATH:~/ros_workspace/src/mbzirc/gazebo_support/models' >>  ~/.bashrc && \
    source ~/.bashrc
