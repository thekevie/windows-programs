set FSystem = CreateObject("Scripting.FileSystemObject")

do while True
  if FSystem.FileExists("%public%\desktop\Landguiden.url") then
    FSystem.DeleteFile("%public%\desktop\Landguiden.url")
  end if
  if FSystem.FileExists("%public%\desktop\www.studi.se.url") then
    FSystem.DeleteFile("%public%\desktop\www.studi.se.url")
  end if

  if FSystem.FileExists("%userprofile%\desktop\Landguiden.url") then
    FSystem.DeleteFile("%userprofile%\desktop\Landguiden.url")
  end if
  if FSystem.FileExists("%userprofile%\desktop\www.studi.se.url") then
    FSystem.DeleteFile("%userprofile%\desktop\www.studi.se.url")
  end if
loop
