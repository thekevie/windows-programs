set fso = CreateObject("Scripting.FileSystemObject")

do while True
  if fso.FileExists("%public%\desktop\Landguiden.url") then
    fso.DeleteFile("%public%\desktop\Landguiden.url")
  end if
  if fso.FileExists("%public%\desktop\www.studi.se.url") then
    fso.DeleteFile("%public%\desktop\www.studi.se.url")
  end if

  if fso.FileExists("%userprofile%\desktop\Landguiden.url") then
    fso.DeleteFile("%userprofile%\desktop\Landguiden.url")
  end if
  if fso.FileExists("%userprofile%\desktop\www.studi.se.url") then
    fso.DeleteFile("%userprofile%\desktop\www.studi.se.url")
  end if
  WScript.Sleep 30
loop
