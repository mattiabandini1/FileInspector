# 🔍 FileInspector

![Bash](https://img.shields.io/badge/Language-Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white) ![License](https://img.shields.io/badge/License-MIT-blue?style=flat-square) ![OS](https://img.shields.io/badge/OS-Linux-orange?style=flat-square&logo=linux&logoColor=white)

> A lightweight and modern CLI tool for quick file permission analysis on Linux systems.

**FileInspector** started as an academic Bash scripting exercise and is evolving into a comprehensive system administration assistant for the terminal. Developed and tested on **Fedora Linux**.

<p align="center">
  <img src="screenshot.png" alt="FileInspector Screenshot">
</p>

---

## 🚀 How to use

Currently, the tool is a portable single-file script.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/mattiabandini1/FileInspector.git
   cd FileInspector
   ```

2. **Make the script executable:**
   ```bash
   chmod +x file_inspector.sh
   ```

3. **Run the analysis on a file:**
   ```bash
   ./file_inspector.sh filename.txt
   ```

---

## 🗺️ Development Roadmap

The project is divided into incremental phases. Track the progress and future goals here.

### ✅ v0.1.0 - The Foundation

The base version, developed as a strict Bash exercise.

* [x] File existence check.
* [x] Argument validation (input check).
* [x] Basic permission verification (Read, Write, Execute).
* [x] Simple text output (YES/NO).

### ✅ v0.2.0 - Visual Upgrade

Improving the User Experience (UX) in the terminal.

* [x] Implementation of ANSI color codes (Green for granted, Red for denied).
* [x] Visual icons (✔ / ✖) for immediate readability.
* [x] Formatted table/block output for better clarity.

### 🚧 v0.3.2 - The Admin Tools (Current Version)

Advanced features for system administrators.

* [x] Calculation and display of Octal Codes (e.g., 755, 644).
* [x] Display Owner and Group information.
* [ ] Detection of special security bits (SUID, SGID, Sticky Bit).

### 🌟 v1.0.0 - Full Release (Interactive)

Transition from a passive viewer to an interactive tool.

* [ ] "Fixer" Mode: Automatic suggestions (e.g., "Make this script executable?") with interactive correction (`y/n`).
* [ ] Recursive directory support (`-r` flag).
* [ ] Full help menu (`--help`).

---

## 🛠️ Requirements

* **OS:** Linux (Tested on Fedora 42, compatible with Debian/Ubuntu/Arch).
* **Shell:** Bash (Recommended >= 4.0).
* **Dependencies:** None (uses only built-ins and standard coreutils).

---

## 📄 License

This project is distributed under the MIT License. See the LICENSE file for details.

**Author:** Mattia Bandini  
Open Source Portfolio Project
