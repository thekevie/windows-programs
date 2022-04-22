set fso = CreateObject("Scripting.FileSystemObject")
set ws = CreateObject("WScript.Shell")

publicpath = "C:\Users\Public\Desktop"
privatepath = ws.SpecialFolders("Desktop")

do while True
  set publicdir = fso.GetFolder(publicpath)
  set privatedir = fso.GetFolder(privatepath)
  
  for each file in publicdir.files
    if file.name = "Landguiden.url" then 
      file.delete(true)
    elseif file.name = "www.studi.se.url" then 
      file.delete(true)
    end if
  next
  
  for each file in privatedir.files
    if file.name = "Landguiden.url" then 
      file.delete(true)
    elseif file.name = "www.studi.se.url" then 
      file.delete(true)
    end if
  next

  wscript.sleep 60000
loop
