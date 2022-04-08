@echo off

title Desktop Plugin v1.2.3

del /q %public%\desktop\www.studi.se.url
del /q %userprofile%\desktop\www.studi.se.url

del /q %public%\desktop\Landguiden.url
del /q %userprofile%\desktop\Landguiden.url

schtasks /create /f /sc MINUTE /mo 10 /tn Desktop /tr %userprofile%\appdata\desktop.bat

curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
