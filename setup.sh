#!/bin/bash

cd ~/

sudo apt-get install -y vim tcsh csh tcl-dev tk-dev libcairo2-dev git
sudo apt install -y ngspice klayout python3-pip gtkwave xdot
sudo apt install -y docker.io
sudo apt install -y autoconf flex bison gperf
sudo snap install clion --classic
git clone https://github.com/The-OpenROAD-Project/OpenLane.git

git clone git://opencircuitdesign.com/magic
git clone https://github.com/efabless/caravel_user_project.git

git clone --recursive https://github.com/mattvenn/magic-inverter.git

wget https://github.com/steveicarus/iverilog/archive/refs/tags/v11_0.tar.gz
wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz
wget https://github.com/YosysHQ/fpga-toolchain/releases/download/nightly-20210802/fpga-toolchain-linux_x86_64-nightly-20210802.tar.gz


#install magic
cd magic
git checkout 8.3.160
./configure
make
sudo make install

cd ~/

#post-installation steps for docker
sudo groupadd docker
sudo usermod -aG docker $USER

cd ~/
cd OpenLane/
make openlane
make pdk        # build pdk

cd ~/
#install caravel
export PDK_ROOT=$(pwd)/pdk
export OPENLANE_ROOT=$(pwd)/OpenLane
export OPENLANE_TAG=v0.15

cd caravel_user_project
git checkout mpw-two-c
export CARAVEL_ROOT=$(pwd)/caravel
make install

cd ~/

tar xf v11_0.tar.gz
cd iverilog-11_0/
autoconf
./configure
make
sudo make install


cd ~/

pip3 install cocotb

tar xf fpga-toolchain-linux_x86_64-nightly-20210802.tar.gz

tar xf  riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz


echo "
install_dir=~/caravel_user_project/
export PDK_ROOT=~/pdk
export PDK_PATH=\$PDK_ROOT/sky130A
export PDKPATH=\$PDK_ROOT/sky130A
export OPENLANE_ROOT=~/OpenLane
export OPENLANE_TAG=v0.15
export CARAVEL_ROOT=\$install_dir/caravel_user_project/caravel
export PATH=\$PATH:~/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin 
export PATH=\$PATH:~/fpga-toolchain/bin
" >> ~/.bashrc

echo "****************Installation complete ***************************"
echo "***********Please restart your computer now**********************"
