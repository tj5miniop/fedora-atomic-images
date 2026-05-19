#!/bin/bash
set -ouex pipefail
### Install packages


echo "Desktop Script"

# Install Nvidia
#dnf5 -y install terra-release-nvidia 
# NVIDIA settings
# dnf5 -y install nvidia-kmod nvidia-modprobe nvidia-settings cuda


systemctl enable podman.socket
