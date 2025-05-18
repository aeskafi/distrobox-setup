# 🛠️ Steam Deck Fullstack Devbox

![Steam Deck](https://img.shields.io/badge/platform-Steam%20Deck-blue?logo=steam)
![Ubuntu](https://img.shields.io/badge/distro-Ubuntu%2024.04-E95420?logo=ubuntu)
![Status](https://img.shields.io/badge/status-stable-success)
![License](https://img.shields.io/badge/license-MIT-green)

> A portable fullstack development environment powered by Ubuntu + Distrobox on Steam Deck Desktop Mode.

---

## 📦 Features

✅ Ready-to-code environment for:
- **React**, **Next.js**, **Firebase**, **Expo**
- **PHP**, **MySQL**, **WordPress**
- **Python** & cybersecurity tools

✅ GUI apps like **VS Code** run from inside the Distrobox container  
✅ Includes `.desktop` launcher and integrated terminal profile for seamless dev flow  
✅ Full automation with idempotent script — run it again safely

---

## 🚀 Getting Started

```bash
sudo pacman -Syu distrobox podman --noconfirm
git clone https://github.com/your-username/steamdeck-devbox.git
cd steamdeck-devbox
chmod +x setup.sh ubuntu-init.sh
./setup.sh
```

🧠 After installation:
- Launch **VS Code (Ubuntu Devbox)** from application menu  
- Or enter manually:
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
| GUI Integration     | VS Code (inside container), GUI xhost setup                           |

---

## 📂 Repo Structure

```
steamdeck-devbox/
├── setup.sh                 # Main entrypoint — creates and configures the container
├── ubuntu-init.sh          # Runs inside the container, installs all tools
├── code-distrobox.desktop  # GUI launcher for VS Code (optional)
├── vscode-profile.json     # Terminal integration for VS Code
└── README.md               # This file
```

---

## 📌 Notes

- Works entirely offline after setup (except for package updates)
- All components are modular — you can disable parts if you don’t need WordPress or Firebase, etc.
- Uses only official package sources

---

## 🔐 Optional Next Steps

- Secure passwords via `.env` or vault
- Add dotfile sync
- Enable remote SSH or devcontainer integration

---

## 🙌 Author

Made with 💻 on a Steam Deck  
Inspired by the idea that your dev setup should travel with you.

> Feel free to fork, tweak, and share your improvements!

---

## 📄 License

[MIT](LICENSE)