@echo off
title Install Fix
set directory=%CD%

:menu
echo 1. Install
echo 2. Uninstall
echo 3. Update
echo 4. Support
echo 5. Exit
set /p choices=Type the number: 
if '%choices%' == '1' goto install
if '%choices%' == '2' goto uninstall
if '%choices%' == '3' goto update
if '%choices%' == '4' goto support
if '%choices%' == '5' goto exit
cls
goto menu

:install
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f fix.bat
curl -O fix.bat
cls
echo Installation Done
echo.
goto menu

:uninstall
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f fix.bat
cls
echo Uninstallation Done
echo.
goto menu

:update
cd %directory%
@echo off
pause
echo When the update is done the file will close
echo And you will need to run the installation process to update
timeout /t 5 > nul
curl https://github.com/downloads/thekevie/school-fix/install-fix.bat -O install-fix.bat
exit

:support
cls
echo Discord: kevie#9091
echo Github: thekevie
echo.
goto menu

:exit
exit
