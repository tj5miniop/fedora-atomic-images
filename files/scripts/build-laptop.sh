#!/bin/bash
echo "Starting laptop customisations"
set -ouex pipefail
### Install packages
# Install AsusD and ASUSCTL
dnf5 -y install asusctl asusctl-rog-gui
# Enable Service
sudo systemctl enable asusd
# Install Latest MESA Drivers
dnf5 -y install terra-release-mesa

dnf5 -y swap tuned-ppd power-profiles-daemon --allowerasing
systemctl enable power-profiles-daemon.service

# Upgrade system
dnf5 -y update

systemctl enable podman.socket
