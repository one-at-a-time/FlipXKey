#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
Persistent

; 🧩 Mapping configuration: fromKey => toKey
MapConfig := Map(
    "LWin", "LCtrl",
    "LCtrl", "LWin",
    "RWin", "RCtrl",
    "RCtrl", "RWin",
    "a", "b",
    "b", "a"
)

; 🔁 Loop through mappings and assign hotkeys safely
for fromKey, toKey in MapConfig {
    makeHotkeys(fromKey, toKey)
}

; 📌 Function to assign hotkeys with correct scoping
makeHotkeys(fromKey, toKey) {
    if isChar(toKey) {
        Hotkey(fromKey, (*) => SendText(toKey), "On")
    } else {
        Hotkey(fromKey, (*) => Send("{" toKey " down}"), "On")
        Hotkey(fromKey " up", (*) => Send("{" toKey " up}"), "On")
    }
}

; ✅ Helper function: Check if key is a character (like "a", "1", etc.)
isChar(key) {
    return (StrLen(key) = 1 && RegExMatch(key, "^[a-zA-Z0-9]$"))
}

; 🧼 Tray menu with Exit option
A_TrayMenu.Delete()
A_TrayMenu.Add("Exit", (*) => ExitApp())
A_TrayMenu.Default := "Exit"