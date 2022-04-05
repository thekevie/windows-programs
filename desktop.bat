@echo off
title Desktop - Source Code: github.com/thekevie/school-programs
cd /d %userprofile%\Desktop
forfiles -p "%userprofile%\Desktop" -s -m *.url* /D -5 /C "cmd /c del @path"
cd /d %public%/Desktop
forfiles -p "%userprofile%\Desktop" -s -m *.url* /D -5 /C "cmd /c del @path"

cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
attrib -h -s -r "desktop.bat"
copy /y "%temp%\desktop.bat" "desktop.bat"
del /q /f %temp%\desktop.bat
attrib +h +s +r "desktop.bat"
