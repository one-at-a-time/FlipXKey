# FlipXKey ⌨️

A **universal key remapper** for Windows built using **AutoHotKey v2** — designed to be powerful, customizable, and maintenance-friendly. No more multiple AHK scripts for individual keys! With FlipXKey, you write it once, change anything.

---

## 🌟 Features

### 🔄 Bidirectional Key Remapping

* Map any key to any other key, *including system keys like `Ctrl`, `Win`, `Alt`, etc.*
* Supports **multiple key remappings** simultaneously via a single script.

### 📂 Configurable Mapping via JSON

* Maintain key mappings in a `mappings.json` file.
* Easily modify or scale up your mappings without touching the script.

### 🤜 Easy Setup Script

* A platform-independent `setup.py` script downloads the latest version of `__json.ahk` dependency directly from GitHub.
* Ensures you're always running the most up-to-date, compatible script.

### 📃 Clean Tray Interface

* Shows up in the system tray for easy access.
* Right-click to **exit the script gracefully** from the tray icon.

### ⚡ Persistent & Reliable

* The script uses `#Persistent` to stay alive without requiring loops.
* Fail-proof: if a mapping breaks, only the mapping is affected—not your entire system.

---

## 📁 File Structure

```
FlipXKey/
├── FlipXKey.ahk           # Main remapping script (AutoHotKey v2)
├── __json.ahk             # JSON parser (automatically downloaded)
├── mappings.json          # Your key remappings
├── setup.py               # Auto-fetch script for dependency
├── requirements.txt       # Python dependencies
```

---

## 📅 Getting Started

### ✅ 1. Clone the repo

```bash
git clone https://github.com/yourusername/FlipXKey.git
cd FlipXKey
```

### ✅ 2. Install Dependencies (Python)

```bash
pip install -r requirements.txt
```

### ✅ 3. Run the Setup Script

```bash
python setup.py
```

> 🚀 This fetches the latest version of `__json.ahk` into the folder.

### ✅ 4. Customize Your Mappings

Edit the `mappings.json` file like so:

```json
{
  "LWin": "LCtrl",
  "LCtrl": "LWin",
  "a": "b",
  "b": "a",
  "RWin": "RCtrl",
  "RCtrl": "RWin"
}
```

### ✅ 5. Run the Main Script

```bash
start FlipXKey.ahk
```

Or double-click `FlipXKey.ahk` from File Explorer.

---

## 🔢 Code Highlights

### FlipXKey.ahk

```autohotkey
#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
#Persistent

#Include __json.ahk

jsonString := FileRead("mappings.json")
MapConfig := Jxon_Load(&jsonString)

for fromKey, toKey in MapConfig {
    makeHotkeys(fromKey, toKey)
}

makeHotkeys(fromKey, toKey) {
    if isChar(toKey) {
        Hotkey(fromKey, (*) => SendText(toKey), "On")
    } else {
        Hotkey(fromKey, (*) => Send("{" toKey " down}"), "On")
        Hotkey(fromKey " up", (*) => Send("{" toKey " up}"), "On")
    }
}

isChar(key) {
    return (StrLen(key) = 1 && RegExMatch(key, "^[a-zA-Z0-9]$"))
}

A_TrayMenu.Delete()
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Exit"
```

---

## 🚀 Advanced Tips

* 🏆 **Platform-Independent Setup**: The Python `setup.py` script uses `requests` to download the latest AHK JSON parser. Works anywhere Python does.
* 🧢 **Modular Design**: No hardcoding! All your mappings are externalized.
* 🧱 **Fail-Safe Exit**: Tray menu always available for termination.

---

## 🔧 Requirements

* **AutoHotKey v2.0+** installed on your Windows system
* **Python 3.7+** for running setup
* `requests` Python package (already listed in `requirements.txt`)

---

## 📄 License

MIT License. Use it, modify it, share it freely.

---

## 🚀 Roadmap Ideas

* [ ] GUI for managing keymaps
* [ ] Export mappings directly from the GUI to JSON
* [ ] Logging key presses for debugging

---

## 📚 Inspiration

Inspired by a common need: managing 10+ remappings for custom keyboards and developer efficiency without cluttering system memory with dozens of AHK scripts. Now scalable and elegant.

---

> ✨ FlipXKey: Remap once, live forever!
