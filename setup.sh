#!/bin/bash

cd /home/$USER

sudo apt-get install -y vim tcsh csh tcl-dev tk-dev libcairo2-dev git
sudo apt install -y ngspice klayout python3-pip gtkwave
sudo apt install -y docker.io
sudo apt install -y autoconf flex bison gperf
sudo snap install clion --classic


git clone git://opencircuitdesign.com/magic
git clone https://github.com/efabless/caravel_user_project.git
git clone --recursive https://github.com/mattvenn/magic-inverter.git

wget https://github.com/steveicarus/iverilog/archive/refs/tags/v11_0.tar.gz
wget https://github.com/YosysHQ/fpga-toolchain/archive/refs/tags/nightly-20210727.tar.gz
wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz

#install magic
cd magic
git checkout 8.3.160
./configure
make
sudo make install

cd /home/$USER

#post-installation steps for docker
sudo groupadd docker
sudo usermod -aG docker $USER

#install caravel
export PDK_ROOT=$(pwd)/pdk
export OPENLANE_ROOT=$(pwd)/openlane
export OPENLANE_TAG=v0.15

cd caravel_user_project
git checkout mpw-two-c
export CARAVEL_ROOT=$(pwd)/caravel

make install    # install caravel
make pdk        # build pdk
make openlane     # build openlane

cd /home/$USER

tar xf v11_0.tar.gz
cd iverilog-11_0/
autoconf
./configure
make
sudo make install


cd /home/$USER

pip3 install cocotb

tar xf  nightly-20210727.tar.gz

tar xf  riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz


echo "
install_dir=/home/$USER/caravel_user_project/
export PDK_ROOT=/home/$USER/pdk
export PDK_PATH=\$PDK_ROOT/sky130A
export PDKPATH=\$PDK_ROOT/sky130A
export OPENLANE_ROOT=/home/$USER/openlane
export OPENLANE_TAG=v0.15
export CARAVEL_ROOT=\$install_dir/caravel_user_project/caravel
export PATH=\$PATH:~/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin 
export PATH=\$PATH:~/fpga-toolchain/bin
" >> ~/.bashrc

echo "****************Installation complete ***************************"
echo "***********Please restart your computer now**********************"
