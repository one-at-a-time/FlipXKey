#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; Initial state: remap enabled
remapEnabled := true
currentLabel := "Disable Remap"

; Define how the remap works
remapHandler(key, state) {
    if (state)
        Hotkey("LCtrl", SendLWin, "On")
    else
        Hotkey("LCtrl", SendLWin, "Off")
}

SendLWin(*) {
    Send("{LWin down}")
    KeyWait("LCtrl")
    Send("{LWin up}")
}

; Tray Menu Setup
MenuTray := A_TrayMenu
MenuTray.Delete()  ; Clear default items
MenuTray.Add("Disable Remap", ToggleRemap)  ; Initial label
MenuTray.Add("Exit", ExitScript)
MenuTray.Default := "Disable Remap"
MenuTray.Tip := "Ctrl ➜ Win Remapper (Toggleable)"

; Activate remap on start
remapHandler("LCtrl", true)

return  ; End of auto-execute section

ToggleRemap(*) {
    global remapEnabled, currentLabel
    remapEnabled := !remapEnabled
    remapHandler("LCtrl", remapEnabled)

    newLabel := remapEnabled ? "Disable Remap" : "Enable Remap"
    A_TrayMenu.Rename(currentLabel, newLabel)
    currentLabel := newLabel
}

ExitScript(*) {
    ExitApp
}
