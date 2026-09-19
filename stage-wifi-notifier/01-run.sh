#!/bin/bash -e

# Copy systemd service file
install -m 644 files/wifi-notifier.service "${ROOTFS_DIR}/etc/systemd/system/"

# APT自動更新と必要時の自動再起動を設定
install -D -m 644 files/20auto-upgrades "${ROOTFS_DIR}/etc/apt/apt.conf.d/20auto-upgrades"
install -D -m 644 files/50unattended-upgrades "${ROOTFS_DIR}/etc/apt/apt.conf.d/50unattended-upgrades"

# Create directory for credentials / secrets
mkdir -p "${ROOTFS_DIR}/home/pi/secrets"
chown -R 1000:1000 "${ROOTFS_DIR}/home/pi/secrets"
chmod 700 "${ROOTFS_DIR}/home/pi/secrets"
