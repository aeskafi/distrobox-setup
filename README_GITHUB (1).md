# 🛠️ Steam Deck Fullstack Devbox

![Steam Deck](https://img.shields.io/badge/platform-Steam%20Deck-blue?logo=steam)
![Ubuntu](https://img.shields.io/badge/distro-Ubuntu%2024.04-E95420?logo=ubuntu)
![Status](https://img.shields.io/badge/status-stable-success)
![License](https://img.shields.io/badge/license-MIT-green)

> A portable fullstack development + content creation environment powered by Ubuntu + Distrobox on Steam Deck Desktop Mode.

---

## 📦 Features

✅ Ready-to-code environment for:
- **React**, **Next.js**, **Firebase**, **Expo**
- **PHP**, **MySQL**, **WordPress**
- **Python** & cybersecurity tools

✅ Media creators: preconfigured **OBS Studio**, **Kdenlive**, and **Subtitle Editor**  
✅ GUI apps like **VS Code** and **OBS** run from inside the Distrobox container  
✅ Includes `.desktop` launchers and integrated terminal profiles  
✅ Full automation with smart checks — re-run safely anytime

---

## 🚀 Getting Started

```bash
sudo pacman -Syu distrobox podman --noconfirm
git clone https://github.com/your-username/steamdeck-devbox.git
cd steamdeck-devbox
chmod +x setup.sh ubuntu-init.sh media-tools.sh
./setup.sh
```

🎥 (Optional) For content creators:
```bash
./media-tools.sh
```

🧠 After setup:
- Launch **VS Code (Devbox)** or **OBS Studio (Devbox)** from your Desktop
- Or enter the container manually:
  ```bash
  distrobox enter devbox
  ```

---

## 🧰 Tools & Stack

| Category            | Stack                                                                 |
|---------------------|-----------------------------------------------------------------------|
| System Tools        | git, curl, neofetch, build-essential, unzip                           |
| Web Dev             | Apache2, PHP, MySQL, WordPress                                        |
| JavaScript Stack    | Node.js (via NVM), Yarn, PNPM, create-react-app, create-next-app     |
| Firebase            | firebase-tools, emulator support                                      |
| Mobile Dev          | expo-cli, serve                                                       |
| Python Stack        | pipx, virtualenv, black, httpie                                       |
| Security Utilities  | nmap, whois, net-tools, ufw, dnsutils                                 |
| Media Creation      | OBS Studio, Kdenlive, Subtitle Editor                                 |
| GUI Integration     | VS Code / media tools with xhost + .desktop launchers                 |

---

## 📂 Repo Structure

```
steamdeck-devbox/
├── setup.sh                 # Creates and configures the container
├── ubuntu-init.sh          # Installs dev tools and environments
├── media-tools.sh          # Installs media creation apps and desktop launchers
├── code-distrobox.desktop  # VS Code launcher
├── vscode-profile.json     # Terminal integration for VS Code
└── README.md / README_GITHUB.md
```

---

## 📌 Notes

- Works offline after setup (except package updates)
- Modular design — enable/disable sections easily
- Minimal external dependencies — built on official Ubuntu repos

---

## 🔐 Optional Next Steps

- Secure MySQL/Firebase credentials with `.env` or encrypted vaults
- Add custom aliases, devcontainer support, and cloud sync

---

## 🙌 Author

Made with ❤️ on a Steam Deck.  
Now you can **develop AND create content** — anywhere, anytime. 🎮💻🎥

> Fork it, hack it, and share your version with the world!

---

## 📄 License

[MIT](LICENSE)