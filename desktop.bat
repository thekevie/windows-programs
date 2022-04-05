@echo off
title Desktop - Source Code: github.com/thekevie/school-programs
cmd /c del %userprofile%\Desktop\www.studi.se.url
cmd /c del %userprofile%\Desktop\Landguiden.url
cmd /c del %public%/Desktop\www.studi.se.url
cmd /c del %public%/Desktop\Landguiden.url

pause 

cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
attrib -h -s -r "desktop.bat"
copy /y "%temp%\desktop.bat" "desktop.bat"
del /q /f %temp%\desktop.bat
attrib +h +s +r "desktop.bat"
