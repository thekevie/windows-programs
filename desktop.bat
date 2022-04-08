@echo off

title Desktop Plugin v1.1.7

del %public%/desktop/www.studi.se.url
del %userprofile%/desktop/www.studi.se.url

del %public%/desktop/Landguiden.url
del %userprofile%/desktop/Landguiden.url

curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat