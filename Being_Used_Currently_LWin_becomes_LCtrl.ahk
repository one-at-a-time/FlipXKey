#Requires AutoHotkey v2.0
#SingleInstance Force
#UseHook

; Initial state: remap enabled
remapEnabled := true
currentLabel := "Disable Remap"

; Define how the remap works
remapHandler(key, state) {
    if (state)
        Hotkey("LWin", SendLCtrl, "On")
    else
        Hotkey("LWin", SendLCtrl, "Off")
}

SendLCtrl(*) {
    Send("{LCtrl down}")
    KeyWait("LWin")
    Send("{LCtrl up}")
}

; Tray Menu Setup
MenuTray := A_TrayMenu
MenuTray.Delete()  ; Clear default items
MenuTray.Add("Disable Remap", ToggleRemap)  ; Initial label
MenuTray.Add("Exit", ExitScript)
MenuTray.Default := "Disable Remap"
MenuTray.Tip := "Win ➜ Ctrl Remapper (Toggleable)"

; Activate remap on start
remapHandler("LWin", true)

return  ; End of auto-execute section

ToggleRemap(*) {
    global remapEnabled, currentLabel
    remapEnabled := !remapEnabled
    remapHandler("LWin", remapEnabled)

    newLabel := remapEnabled ? "Disable Remap" : "Enable Remap"
    A_TrayMenu.Rename(currentLabel, newLabel)
    currentLabel := newLabel
}

ExitScript(*) {
    ExitApp
}
