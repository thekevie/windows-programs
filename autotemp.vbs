set fso = CreateObject("Scripting.FileSystemObject")
set ws = CreateObject("WScript.Shell")
u = ws.ExpandEnvironmentStrings("%username%")
set temp = fso.GetFolder("C:\Users\" & u & "\AppData\Local\Temp")

do while True
  for each file in temp.files
    on error resume next
    file.delete(true)
  next
  for each folder in temp.SubFolders
    on error resume next
    folder.delete(true)
  next

  wscript.sleep 604800000
loop
