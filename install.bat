@echo off
title Install Fix
set directory=%CD%

:menu
echo 1. Install
echo 2. Uninstall
echo 3. Support
echo 4. Hide
echo 5. Exit
set /p choices=Type the number: 
if '%choices%' == '1' goto install
if '%choices%' == '2' goto uninstall
if '%choices%' == '3' goto support
if '%choices%' == '3' goto hide
if '%choices%' == '5' goto exit
cls
goto menu

:install
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f program.bat
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Installation Done
echo.
goto menu

:uninstall
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f desktop.bat
cls
echo Uninstallation Done
echo.
goto menu

:support
cls
echo Discord: kevie#9091
echo Github: thekevie
echo.
goto menu

:hide
echo Coming Soon

:exit
exit
