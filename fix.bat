@echo off
title Discord: kevie#9091
cd /d %userprofile%\Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url
cd /d %public%/Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url

cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
curl https://raw.githubusercontent.com/thekevie/school-fix/main/fix.bat > fix.txt
fc /b fix.txt fix.bat
del /q /f fix.txt
if not errorlevel 1 (
    curl -OL https://raw.githubusercontent.com/thekevie/school-fix/main/fix.bat
)
exit
