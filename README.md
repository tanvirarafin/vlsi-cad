# vlsi-cad

This repository contains basic scripts to install open source CAD tools.

## Steps to install the tools in your VM

1. Download a fresh copy of Ubuntu 20.01.2.0 from here https://releases.ubuntu.com/20.04/
2. Create the Ubuntu VM with your favourite VM tool i.e., VirtualBox or VMeare Fusion
3. Open up a terminal inside your freshly installed VM. Install git using the following command
```
sudo apt install -y  git
```
4. Run the following command to clone this repo in your VM
``` 
git clone https://github.com/tanvirarafin/vlsi-cad
```
5. Run the following commands in the terminal

```
cd vlsi-cad
sh setup.sh
```
Please provide the user password when prompted
6. It would take a while to download and install all the packages. Once the process completed you will see the following notice
```
****************Installation complete ***************************
***********Please restart your computer now**********************
```
7. Restart your VM.
8. When the VM is up again, open up a terminal and run the following command in the terminal
```
cd vlsi-cad
sh test_install.sh
```
9. Notice the tests. If the installation is correct, you should see openlane project build succesfully, then Magic will display the inverter layout and finally you should see the NGSpice results.  

Type 
``` 
quit
```
when you see the NGSpice command prompt

