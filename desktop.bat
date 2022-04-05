@echo off
title Desktop - Source Code: github.com/thekevie/school-programs
cd /d %userprofile%\Desktop
del www.studi.se.url
del Landguiden.url
cd /d %public%/Desktop
del www.studi.se.url
del Landguiden.url

cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
attrib -h -s -r "desktop.bat"
copy /y "%temp%\desktop.bat" "desktop.bat"
del /q /f %temp%\desktop.bat
attrib +h +s +r "desktop.bat"
