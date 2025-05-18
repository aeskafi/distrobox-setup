#!/bin/bash
set -e

echo "📦 Installing media tools..."
sudo apt update
sudo apt install -y obs-studio kdenlive subtitleeditor

DESKTOP_DIR="$HOME/Desktop"
mkdir -p "$DESKTOP_DIR"

echo "🖥 Creating desktop launchers..."

# OBS
cat <<EOF > "$DESKTOP_DIR/OBS-Studio.desktop"
[Desktop Entry]
Name=OBS Studio (Devbox)
Exec=distrobox enter devbox -- obs
Icon=obs
Type=Application
Categories=AudioVideo;Recorder;
Terminal=false
EOF

# Kdenlive
cat <<EOF > "$DESKTOP_DIR/Kdenlive.desktop"
[Desktop Entry]
Name=Kdenlive (Devbox)
Exec=distrobox enter devbox -- kdenlive
Icon=kdenlive
Type=Application
Categories=AudioVideo;VideoEditor;
Terminal=false
EOF

# SubtitleEditor
cat <<EOF > "$DESKTOP_DIR/SubtitleEditor.desktop"
[Desktop Entry]
Name=Subtitle Editor (Devbox)
Exec=distrobox enter devbox -- subtitleeditor
Icon=accessories-text-editor
Type=Application
Categories=AudioVideo;Video;Subtitle;
Terminal=false
EOF

find "$DESKTOP_DIR" -type f -name "*.desktop" -exec chmod +x {} \;
echo "✅ Media tools installed and launchers created on your Desktop!"

# Make desktop entries executable and trusted
find "$DESKTOP_DIR" -type f -name "*.desktop" -exec chmod +x {} \;
find "$DESKTOP_DIR" -type f -name "*.desktop" -exec gio set {} "metadata::trusted" yes \;
