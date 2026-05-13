#!/bin/bash

# Falex OS Build Script
# This script builds a custom Ubuntu-based distribution with GNOME desktop

set -e

# Variables
DIST_NAME="Falex"
VERSION="Aero"
BASE_DIST="ubuntu"
BASE_VERSION="22.04"
ARCH="amd64"

# Create build directory
BUILD_DIR="/tmp/falex-build"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Install dependencies
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso isolinux syslinux-efi grub-pc-bin grub-efi-amd64-bin mtools dosfstools

# Create live-build configuration
lb config \
    --distribution "$BASE_DIST" \
    --archive-areas "main restricted universe multiverse" \
    --binary-images iso-hybrid \
    --bootloader grub-efi \
    --debian-installer live \
    --debian-installer-distribution "$BASE_DIST" \
    --debian-installer-gui true \
    --iso-application "$DIST_NAME $VERSION" \
    --iso-publisher "$DIST_NAME" \
    --iso-volume "$DIST_NAME $VERSION" \
    --linux-flavours amd64 \
    --mirror-bootstrap http://archive.ubuntu.com/ubuntu/ \
    --mirror-chroot http://archive.ubuntu.com/ubuntu/ \
    --mirror-binary http://archive.ubuntu.com/ubuntu/ \
    --mirror-debian-installer http://archive.ubuntu.com/ubuntu/ \
    --architectures "$ARCH"

# Customize the chroot
echo "deb http://archive.ubuntu.com/ubuntu/ $BASE_DIST main restricted universe multiverse" > config/archives/ubuntu.list.chroot
echo "deb http://archive.ubuntu.com/ubuntu/ $BASE_DIST-updates main restricted universe multiverse" >> config/archives/ubuntu.list.chroot
echo "deb http://archive.ubuntu.com/ubuntu/ $BASE_DIST-security main restricted universe multiverse" >> config/archives/ubuntu.list.chroot

# Add GNOME and customization packages
cat > config/package-lists/falex.list.chroot << EOF
ubuntu-gnome-desktop
gnome-tweaks
gnome-shell-extensions
dconf-editor
gsettings-desktop-schemas
EOF

# Build the ISO
lb build

# Move the ISO to the project directory
mv *.iso /workspaces/Falex-Git/

echo "Build complete. ISO created at /workspaces/Falex-Git/"