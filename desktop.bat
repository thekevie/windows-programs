@echo off

title Desktop Plugin v1.3.2
set dir=%appdata%\plugins

:loop
cd %public%\desktop
IF EXIST www.studi.se.url (
    del /q www.studi.se.url
)
IF EXIST Landguiden.url (
    del /q Landguiden.url
)

cd %userprofile%\desktop
IF EXIST www.studi.se.url (
    del /q www.studi.se.url
)
IF EXIST Landguiden.url (
    del /q Landguiden.url
)

cd %dir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
timeout 30 > nobreak > nul
goto loop
