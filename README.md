# Description
The package which is build from this repository will bring some secure enhancements to the Linux OS where the package is installed. The package is designed to work on Ubuntu distribution. Other distributions have not been tested.

## SYSCTL configurations
The sysctl configurations are set via `/etc/sysctl.d/40-secure-os.conf` configuration file.
In the file there are short explanations of the settings.

## Linux Kernel command line parameters
The command line parameters are set via `/etc/deafult/grub.d/40-secure-os.cfg`.
In the file there are short explanations of the boot parameter and what is tried to get with them.<br>
Note that some of the boot parameters require a specific configuration of the Linux kernel.
