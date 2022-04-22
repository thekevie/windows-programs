set fso = CreateObject("Scripting.FileSystemObject")
set ws = CreateObject("WScript.Shell")

publicpath = "C:\Users\Public\Desktop"
privatepath = ws.SpecialFolders("Desktop")

do while True
  if fso.FileExists(publicpath & "\Landguiden.url") then
    fso.DeleteFile(publicpath & "\Landguiden.url")
  end if
  if fso.FileExists(publicpath & "\www.studi.se.url") then
    fso.DeleteFile(publicpath & "\www.studi.se.url")
  end if

  if fso.FileExists(privatepath & "\Landguiden.url") then
    fso.DeleteFile(privatepath & "\Landguiden.url")
  end if
  if fso.FileExists(privatepath & "\www.studi.se.url") then
    fso.DeleteFile(privatepath & "\www.studi.se.url")
  end if
  WScript.Sleep 60
loop
