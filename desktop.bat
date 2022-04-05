// Desktop Version v1.1.0
@echo off
title Desktop
cd /d %userprofile%\Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url
cd /d %public%/Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url

cls
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-program/main/desktop.bat
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
if not exist desktop.bat (
    type nul > desktop.bat
)
copy /y "%temp%\desktop.bat" "desktop.bat"
del /q /f %temp%\desktop.bat
