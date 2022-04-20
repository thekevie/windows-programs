@echo off

title Desktop Plugin v1.2.9
cd %appdata%

:loop
del /q %public%\desktop\www.studi.se.url
del /q %userprofile%\desktop\www.studi.se.url

del /q %public%\desktop\Landguiden.url
del /q %userprofile%\desktop\Landguiden.url

curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
timeout 300 > nobreak > nul
goto loop
