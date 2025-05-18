#!/bin/bash
set -e

echo "📦 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🛠 Installing core development tools..."
sudo apt install -y git curl wget unzip build-essential neofetch \
  nano vim software-properties-common

if ! dpkg -s apache2 >/dev/null 2>&1; then
  echo "📦 Installing Apache..."
  sudo apt install -y apache2
else
  echo "✔️ Apache already installed"
fi

echo "🌐 Installing web stack (PHP, MySQL, Apache)..."
sudo apt install -y mysql-server php php-mysql php-cli php-curl php-mbstring php-xml php-zip

echo "🚀 Starting MySQL service..."
if command -v mysql >/dev/null 2>&1; then
  echo "🚀 Starting MySQL service..."
  sudo service mysql start || sudo /etc/init.d/mysql start
  sleep 2
fi

echo "🛡 Securing MySQL..."
# after setup root passowrd is >>> rootpass
sudo mysql_secure_installation

echo "🔵 Checking and installing NVM, Node.js, Yarn, PNPM..."

if [ -d "$HOME/.config/nvm" ]; then
  export NVM_DIR="$HOME/.config/nvm"
elif [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
else
  echo "➡️ Installing NVM..."
  export NVM_DIR="$HOME/.nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

if [ -s "$NVM_DIR/nvm.sh" ]; then
  \. "$NVM_DIR/nvm.sh"
else
  echo "❌ NVM not found, aborting..."
  exit 1
fi

if ! command -v node >/dev/null 2>&1; then
  echo "➡️ Installing Node.js LTS via NVM..."
  nvm install --lts
else
  echo "✔️ Node.js already installed: $(node -v)"
fi

nvm use --lts

echo "🐙 Installing GitHub CLI..."

if ! command -v gh >/dev/null 2>&1; then
  type -p curl >/dev/null || sudo apt install -y curl
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
    sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
    https://cli.github.com/packages stable main" | \
    sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

  sudo apt update
  sudo apt install -y gh
else
  echo "✔️ GitHub CLI already installed"
fi

echo "☁️ Installing Google Cloud SDK (gsutil)..."

if ! command -v gsutil >/dev/null 2>&1; then
  echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/cloud.google.gpg >/dev/null
  sudo apt update && sudo apt install -y google-cloud-sdk
else
  echo "✔️ gsutil already installed"
fi

echo "📦 Installing global npm tools..."
if ! npm list -g firebase-tools >/dev/null 2>&1; then
  npm install -g firebase-tools
else
  echo "✔️ Firebase CLI already installed"
fi
npm install -g yarn pnpm expo-cli create-react-app create-next-app serve

echo "🐍 Installing Python dev tools via pipx..."
sudo apt install -y python3-full python3-venv pipx
pipx ensurepath
pipx install virtualenv
if ! pipx list | grep -q "black"; then
  pipx install black
else
  echo "✔️ black already installed"
fi
pipx install httpie

echo "🛡 Installing basic cybersecurity tools..."
sudo apt install -y nmap net-tools ufw whois dnsutils

echo "📂 Creating default projects folder..."
[ -d ~/Projects ] || mkdir -p ~/Projects/{React,Next,Expo,PHP,WordPress,Python}

echo "🧠 Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install -y code

echo "🖥 Enabling GUI access (xhost +local:)..."
BASHRC_PATH="$HOME/.bashrc"

if [ -f "$BASHRC_PATH" ]; then
  if ! grep -q "xhost +local:" "$BASHRC_PATH"; then
    echo 'xhost +local:' >> "$BASHRC_PATH"
    echo "✅ Added xhost to $BASHRC_PATH"
  else
    echo "🔁 xhost already exists in $BASHRC_PATH"
  fi
else
  echo "❌ .bashrc not found at $BASHRC_PATH"
fi

echo "🖥 Creating VS Code launcher on Desktop..."

DESKTOP_PATH="$HOME/Desktop"
mkdir -p "$DESKTOP_PATH"

cat <<EOF > "$DESKTOP_PATH/code-distrobox.desktop"
[Desktop Entry]
Name=VS Code (Devbox)
Comment=Launch Visual Studio Code inside Distrobox Ubuntu
Exec=distrobox enter devbox -- code
Icon=visual-studio-code
Terminal=false
Type=Application
Categories=Development;IDE;
StartupNotify=true
EOF

chmod +x "$DESKTOP_PATH/code-distrobox.desktop"

echo "🎯 Setup complete. Login to Git/Firebase and start coding!"
