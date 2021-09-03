#!/bin/bash

echo "Run this script after restarting your vitrutal machine"

cd ~/


# run the following two line after you restart your computer
cd caravel_user_project
make user_proj_example

echo "*********************************************************************\n"
echo "************* Did the project ended without any fatal error**********\n"
echo "*******************Checking magic************************************\n"
echo "****Close the magic and ngspice windows after you see the result*****\n"

cd ~/
cd magic-inverter
make magic
make sim
cd ~/


riscv64-unknown-elf-gcc
echo "The last test should end with fatal error: no input files************\n"
