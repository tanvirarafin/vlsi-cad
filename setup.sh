#!/bin/bash

cd ~

sudo apt-get install vim git -y
sudo apt-get install tcsh csh tcl-dev tk-dev libcairo2-dev -y
git clone git://opencircuitdesign.com/magic
cd magic
git checkout 8.3.209
./configure
make
sudo make install

sudo apt install docker.io

cd ~
git clone https://github.com/efabless/caravel_user_project.git
export PDK_ROOT=$(pwd)/pdk
export OPENLANE_ROOT=$(pwd)/openlane
export SKYWATER_COMMIT=c094b6e83a4f9298e47f696ec5a7fd53535ec5eb
export OPEN_PDKS_COMMIT=14db32aa8ba330e88632ff3ad2ff52f4f4dae1ad
export OPENLANE_TAG=mpw-3a
export OPENLANE_IMAGE_NAME=efabless/openlane:$OPENLANE_TAG


cd caravel_user_project
git checkout mpw-3
export CARAVEL_ROOT=$(pwd)/caravel

make install		# install caravel

cd caravel
git checkout 5712871d27c08900d18edc72a7f534cc8be1b2dd
cd ..

make pdk    		# build pdk (can only utilise a single core atm)
make openlane     # build openlane
sudo chmod 666 /var/run/docker.sock
make user_proj_example

cd ~
sudo apt install ngspice
git clone --recursive https://github.com/mattvenn/magic-inverter.git

cd ~
sudo apt install klayout

wget https://github.com/YosysHQ/oss-cad-suite-build/releases/download/2021-09-29/oss-cad-suite-linux-x64-20210929.tgz 
tar -xzf ~/oss-cad-suite-linux-x64-20210929.tgz
sudo apt install python3-pip
pip3 install cocotb

cd ~
wget https://static.dev.sifive.com/dev-tools/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz 

tar -xzf ~/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14.tar.gz


echo "
install_dir=~
export PDK_ROOT=\$install_dir/pdk
export OPENLANE_ROOT=\$install_dir/openlane
export PDK_PATH=\$PDK_ROOT/sky130A
export SKYWATER_COMMIT=c094b6e83a4f9298e47f696ec5a7fd53535ec5eb
export OPEN_PDKS_COMMIT=14db32aa8ba330e88632ff3ad2ff52f4f4dae1ad
export OPENLANE_TAG=mpw-3a
export OPENLANE_IMAGE_NAME=efabless/openlane:\$OPENLANE_TAG
export IMAGE_NAME=\$OPENLANE_IMAGE_NAME
export CARAVEL_ROOT=\$install_dir/caravel_user_project/caravel
export PATH=\$PATH:\$install_dir/oss-cad-suite/bin
export PATH=\$PATH:\$install_dir/riscv64-unknown-elf-gcc-8.3.0-2020.04.1-x86_64-linux-ubuntu14/bin
export PATH=\$PATH:\$install_dir/.local/bin

" >> ~/.bashrc

source ~/.bashrc


echo "****************Installation complete ***************************"
echo "***********Please restart your computer now**********************"
