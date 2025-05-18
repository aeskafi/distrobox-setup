#!/bin/bash
set -e

DISTRO_NAME="devbox"
IMAGE_NAME="ubuntu:24.04"

echo "🧱 [1/3] Creating Distrobox '$DISTRO_NAME'..."
distrobox create --name $DISTRO_NAME --image $IMAGE_NAME --yes

echo "🚀 [2/3] Entering and provisioning packages..."
distrobox enter $DISTRO_NAME -- bash ./ubuntu-init.sh

echo "✅ [3/3] Setup complete. You can now start coding!"
