# 🛠️ Steam Deck Fullstack Devbox Setup

This repository provides a fully automated script to create a complete development environment on your **Steam Deck (Desktop Mode)** using **Ubuntu 24.04 via Distrobox**.

Designed for fullstack developers using:
- React / Next.js / React Native / Firebase
- PHP / MySQL / WordPress
- Python (future-oriented)
- Secure GUI access & editor integration (VS Code)
- 🎥 Optional setup for YouTube creators

---

## 🚀 What's Included

### 📁 Files
- `setup.sh`: Automatically creates and launches an Ubuntu-based Distrobox container and starts the provisioning script.
- `ubuntu-init.sh`: Runs inside the container, installs all required tools, configures MySQL, Node, Python, pipx, etc.
- `media-tools.sh`: Installs OBS Studio, Kdenlive, SubtitleEditor and creates .desktop launchers for content creation.
- `code-distrobox.desktop`: Launches VS Code from Distrobox with GUI access.
- `vscode-profile.json`: Adds a custom terminal profile to open the Devbox directly inside VS Code.

---

## ⚙️ Prerequisites

On your Steam Deck terminal (Desktop Mode):

```bash
sudo pacman -Syu distrobox podman --noconfirm
```

---

## 🔧 Installation Steps

1. **Clone this repo** and make files executable:
```bash
git clone https://github.com/your-user/steamdeck-devbox.git
cd steamdeck-devbox
chmod +x setup.sh ubuntu-init.sh media-tools.sh
```

2. **Run setup**:
```bash
./setup.sh
```

3. **Run media tools setup** (optional, for YouTube creators):
```bash
./media-tools.sh
```

4. **After setup**:
- You can enter your container manually:
  ```bash
  distrobox enter devbox
  ```
- Or use VS Code terminal profile or the `.desktop` shortcut.

---

## 📦 What It Installs

Inside the Ubuntu container:
- **System Tools**: Git, curl, wget, unzip, build-essential, neofetch
- **Web Stack**:
  - Apache2, PHP (with common extensions)
  - MySQL 8 (with root password and WordPress DB auto-configured)
- **Node.js & JavaScript Tooling**:
  - NVM (auto-detects installation)
  - Node.js (LTS)
  - Yarn, PNPM
  - Global tools: `firebase-tools`, `expo-cli`, `create-react-app`, `create-next-app`, `serve`
- **Python Tooling**:
  - `python3-full`, `venv`, `pipx`, `virtualenv`, `black`, `httpie`
- **Cybersecurity Tools**:
  - `nmap`, `net-tools`, `ufw`, `whois`, `dnsutils`
- **VS Code**:
  - Installed inside Distrobox, and can be launched from host
- **Project Folders**:
  - `~/Projects/React`, `Next`, `Expo`, `PHP`, `WordPress`, `Python`
- **Media Tools** (via `media-tools.sh`):
  - OBS Studio, Kdenlive, SubtitleEditor
  - `.desktop` launchers created on the Desktop

---

## 🖥️ GUI Access (xhost)

The script automatically adds `xhost +local:` to your `.bashrc` to enable GUI apps (like VS Code or OBS) from Distrobox to run on the Steam Deck host.

---

## 💡 VS Code Integration

### Option 1: Use `.desktop` shortcut

Launch `VS Code (Ubuntu Devbox)` from application menu.

### Option 2: Use Terminal Profile

Copy `vscode-profile.json` into your VS Code `settings.json`:

```json
"terminal.integrated.profiles.linux": {
  "Devbox (Ubuntu)": {
    "path": "bash",
    "args": ["-c", "distrobox enter devbox"]
  }
},
"terminal.integrated.defaultProfile.linux": "Devbox (Ubuntu)"
```

---

## ✅ Smart Checks & Idempotency

- All installations check if packages are already installed.
- MySQL only configured if `wpuser` does not exist.
- NVM only installs if missing.
- pipx tools only install if not already present.

---

## 📂 Project Structure

```
steamdeck-devbox/
├── setup.sh
├── ubuntu-init.sh
├── media-tools.sh
├── vscode-profile.json
├── code-distrobox.desktop
└── README.md
```

---

## 🔐 Future Improvements

- Add support for docker/podman-based WordPress dev setup
- Optional backup of MySQL user/password config
- Environment variable overrides for passwords and settings

---

## 🙌 Credits

Created for devs who want the power of Linux + Steam Deck mobility — and now, content creators too. 🎥🔥