#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

# Install Base packages
dnf5 -y install podman distrobox papirus-icon-theme fastfetch wine flatpak
# Remove firefox in favour of librewolf 
dnf5 -y remove firefox 

# Install Librewolf
# add the repo
dnf5 -y config-manager addrepo --from-repofile=https://repo.librewolf.net/librewolf.repo

# install the package
dnf5 -y install librewolf

# Install Terra Repository 
dnf5 -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
# Enable Multimedia Repo 
dnf5 -y install terra-release-multimedia

# Install VSCODIUM
dnf5 -y install codium 

# Install GAMING stuff
dnf5 -y install --best --allowerasing gamescope protonplus steam heroic-games-launcher vesktop

# Install CachyOS Scheds 
dnf5 -y copr enable bieszczaders/kernel-cachyos-addons
dnf5 -y install scx-scheds scx-tools scx-manager

echo "Base Install Complete!"

systemctl enable podman.socket
