@echo off
title Discord: kevie#9091
cd /d %userprofile%\Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url
cd /d %public%/Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url

curl https://raw.githubusercontent.com/thekevie/school-fix/main/fix.bat -O check.txt
fc fix.txt fix.bat
pause
exit
