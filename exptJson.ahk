#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook
Persistent
#Include _JXON.ahk

; 🧩 Load custom JSON mappings from file
mappingFile1 := A_ScriptDir . "\custom_mappings.json"
jsonString1 := FileRead(mappingFile1)
    
; 🧩 Load default JSON mappings from file
mappingFile2 := A_ScriptDir . "\default_mappings.json"
jsonString2 := FileRead(mappingFile2)

; Error handling: If JSON load fails, fallback to default map
try {
    MapConfig := Jxon_Load(&jsonString1)
} catch {
    MsgBox("Error loading mappings.json. Using default mappings.")
    MapConfig := Jxon_Load(&jsonString2)
}

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