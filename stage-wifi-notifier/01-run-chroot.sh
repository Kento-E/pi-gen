#!/bin/bash -e

# 1. Clone repository
cd /home/pi
if [ ! -d "wifi-client-notifier" ]; then
    git clone https://github.com/Kento-E/wifi-client-notifier.git wifi-client-notifier
fi

# 2. Setup Python virtual environment and dependencies
cd /home/pi/wifi-client-notifier
python3 -m venv .venv
./.venv/bin/pip install --upgrade pip
if [ -f "requirements.txt" ]; then
    ./.venv/bin/pip install -r requirements.txt
fi

# 3. Ensure permissions for pi user (uid 1000 / gid 1000)
chown -R 1000:1000 /home/pi/wifi-client-notifier

# 4. Enable systemd service
systemctl enable wifi-notifier.service
systemctl enable avahi-daemon.service
