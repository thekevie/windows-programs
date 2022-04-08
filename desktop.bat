@echo off

title Desktop Plugin v1.1.9

del /q %public%\desktop\www.studi.se.url
del /q %userprofile%\desktop\www.studi.se.url

del /q %public%\desktop\Landguiden.url
del /q %userprofile%\desktop\Landguiden.url

cd %userprofile%\appdata
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
