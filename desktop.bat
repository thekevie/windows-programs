// Version 1.1.0
// Source Code: github.com/thekevie/school-programs
@echo off
title Desktop
cd /d %userprofile%\Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url
cd /d %public%/Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url

cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
if not exist desktop.bat (
    type nul > desktop.bat
)
attrib -h -s -r "desktop.bat"
copy /y "%temp%\desktop.bat" "desktop.bat"
del /q /f %temp%\desktop.bat
attrib +h -s +r "desktop.bat"
