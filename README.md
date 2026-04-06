<p align="center">
  <img src="assets/banner.png" alt="macOS DevOps Setup banner" width="80%" />
</p>

<p align="center">
  <em>No manual setup. No inconsistencies. Just code.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/macOS-Automation-111111?style=flat-square&logo=apple&logoColor=white" alt="macOS Automation" />
  <img src="https://img.shields.io/badge/Shell-Bash-121011?style=flat-square&logo=gnu-bash&logoColor=white" alt="Shell Bash" />
  <img src="https://img.shields.io/badge/License-MIT-3fb950?style=flat-square" alt="MIT License" />
</p>

---

## Overview

This project transforms macOS into a fully automated development environment.

Instead of manually installing tools, configuring settings, and repeating setup steps, everything is defined as code.

---

## Installation

```bash
chmod +x *.sh
./bootstrap.sh
```

Optional Git configuration:

```bash
export GIT_USER_NAME="Samvel Pahalyants"
export GIT_USER_EMAIL="you@example.com"
./git.sh
```

---

## System Configuration

### macOS
- Dock behavior and animation tuning
- Finder visibility and navigation improvements
- Screenshot configuration
- Keyboard response optimization

### Terminal
- Zsh configuration
- CLI aliases
- Improved developer workflow

### Development Tools
- Homebrew
- Git
- Docker
- IntelliJ IDEA
- Visual Studio Code
- CLI utilities

### Workspace

```bash
~/Desktop/
 ├── Projects
 ├── Learning
 ├── Notes
 └── Screenshots
```

---

## Architecture

```text
bootstrap.sh
   |
   |--> brew.sh        installs packages and applications
   |--> defaults.sh    configures macOS preferences
   |--> dock.sh        manages Dock configuration
   |--> git.sh         sets global Git configuration
   |--> zsh.sh         configures shell environment
   |--> folders.sh     creates workspace structure
   `--> symlinks.sh    manages dotfiles
```

---

## Example Configuration

```bash
# Dock
defaults write com.apple.dock autohide-delay -float 0

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Screenshots
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

killall Dock || true
killall Finder || true
killall SystemUIServer || true
```

---

## Stack

<p align="center">
  <img src="https://skillicons.dev/icons?i=bash,git,docker,vscode,idea,java" />
</p>

---

## Roadmap

- VS Code extensions automation
- IntelliJ settings synchronization
- SSH key bootstrap
- Multi-profile setup (work / personal)

---

## Author

Samvel Pahalyants  
https://github.com/spahalyants

---

## License

MIT License
