set fso = CreateObject("Scripting.FileSystemObject")

do while True
  fso.DeleteFile(" C:\Temp\*.*"), DeleteReadOnly
  fso.DeleteFile(" C:\Windows\Temp\*.*"), DeleteReadOnly

  fso.DeleteFolder(" C:\Temp\*"), DeleteReadOnly
  fso.DeleteFolder(" C:\Windows\Temp\*"), DeleteReadOnly
  wscript.sleep 3600000
loop
