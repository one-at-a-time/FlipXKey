# 📌 FlipXKey

FlipXKey is a lightweight, customizable AutoHotkey-based utility that empowers you to remap any number of keyboard keys using an intuitive JSON configuration file.

With its clean, modular design, FlipXKey supports bulk key remapping, decoupled configuration files, and optional auto-updates for critical components like the JSON parser. Ideal for developers, power users, and accessibility setups.

---

## ✨ Features

* 🔁 **Dynamic Key Remapping**: Define any number of key-to-key mappings (e.g., remap `CapsLock` to `Esc`, or `LWin` to `LCtrl`).
* 📄 **JSON-Based Configuration**: Mappings are defined in separate `custom_mappings.json` and `default_mappings.json` files.
* 🔧 **Failover Safety**: If `custom_mappings.json` is invalid or missing, the script gracefully falls back to `default_mappings.json`.
* 🪄 **Easy Hotkey Setup**: Hotkeys are generated dynamically from mappings.
* 📦 **Minimal and Elegant**: Single-file script plus optional JSON dependencies—great for version control.
* 🧃 **Tray Menu Support**: Easily exit the script from the tray icon.
* ⚙️ **Designed for Autostart**: Can be configured to run at startup using Task Scheduler.

---

## 🔧 Example Use Cases

```json
{
  "CapsLock": "Esc",         // Make CapsLock behave like Escape
  "LWin": "LCtrl",           // Swap Windows key with Left Ctrl
  "RCtrl": "RWin",           // Reverse swap for right-side keys
  "a": "Left",               // Pressing 'a' simulates the Left Arrow
  "Right": "Enter",          // Pressing Right Arrow behaves like Enter
  "<": "o",                  // Map Less-Than to letter 'o' if 'o' is broken
  "|": "Backspace"            // Use pipe symbol to act as Backspace
}
```

> 📁 Place your custom mappings in `custom_mappings.json`. If it's invalid, the script auto-loads `default_mappings.json`.

---

## 📁 Project Structure

```
FlipXKey/
├── FlipXKey.ahk               # Main script
├── _JXON.ahk                  # JSON parsing utility (imported automatically)
├── custom_mappings.json       # Your editable mappings
├── default_mappings.json      # Backup fallback mappings
├── setup.py                   # Python setup helper to auto-download _JXON.ahk
├── requirements.txt           # Only includes necessary Python packages
└── README.md                  # You're reading it
```

---

## 🐍 Python Setup (Optional)

To auto-fetch the latest version of `_JXON.ahk`, use:

```bash
python setup.py
```

The script:

* Checks for `_JXON.ahk` in your directory.
* Downloads it from the official repo if missing or outdated.

Your `requirements.txt` should contain:

```text
requests
```

Install it using:

```bash
pip install -r requirements.txt
```

---

## 🧵 Startup Integration (Optional)

If you want FlipXKey to auto-run every time you log in:

* Use Windows **Task Scheduler** to run `FlipXKey.ahk` with highest privileges.
* Ensure the working directory is set correctly so relative paths resolve.
* 🛡️ Run as **administrator** if you're remapping system-level keys like `Win` or `Ctrl`.

You can refer to `STARTUP_SETUP.md` (coming soon) for a detailed walkthrough.

---

## 🚀 Future Plans

* 🧠 GUI for toggling/remapping keys on-the-fly.
* 💾 Optional portable executable bundling (`FlipXKey.exe`).
* 📦 Package manager support.
* 🔍 Real-time mapping preview/debug window.

---

## 🙌 Acknowledgements

* [\_JXON.ahk](https://github.com/cocobelgica/AutoHotkey-JSON) for JSON parsing.
* Community feedback and testing.

---

## 💡 Pro Tip

Keep your `FlipXKey.ahk` script locked (read-only) and manage mappings entirely from the `.json` files for maximum safety.

---

## 💭 Feedback

Got a suggestion or issue? [Open a GitHub issue](https://github.com/yourname/flipxkey/issues) or submit a PR!

---

## 🎓 Inspiration

Inspired by the real-world challenge of managing over 10 key remappings for custom developer and productivity workflows without cluttering memory with dozens of AutoHotkey scripts.

Also inspired by moments like these:

> When a single key (like `O`) on your keyboard fails, but everything else works just fine, wouldn't it be great to map an infrequent key (like `|` or `<`) to behave as `O`? That's how FlipXKey started—from practical need, turned into a professional tool.

---

## 📄 License

MIT License.

> Do whatever you want with this tool—tame your keyboard, create chaos, or just save your favorite `CapsLock` from being useless—but don’t blame us if you remap everything to `Esc` and forget how to exit apps!
