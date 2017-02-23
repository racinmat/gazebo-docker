FROM azathoth/gazebo:only-repository

# todo: zjistit, kam to první cd
RUN cd ~ && \
    git clone git@github.com:MBZIRCUPENNCTU/simulation.git && \
    cd simulation && \
    git submodule update --init --recursive

RUN cd ~/simulation && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=~/simulation/install && \
    make -j4 && \
    make install && \

RUN echo "source /usr/share/gazebo/setup.sh" >> ~/.bashrc && \
    echo "source ~/simulation/install/share/simulation/setup.sh" >> ~/.bashrc && \
    /bin/bash -c "source ~/.bashrc"
