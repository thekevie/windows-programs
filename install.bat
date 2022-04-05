@echo off
title Install Programs
set directory=%CD%

:menu
echo 1. Install
echo 2. Uninstall
echo 3. Support
echo 4. Hide
echo 5. Exit
set /p choices=Type the number: 
if %choices% == 1 goto install
if %choices% == 2 goto uninstall
if %choices% == 3 goto support
if %choices% == 3 goto hide
if %choices% == 5 goto exit
cls
goto menu

:install
cls
echo 1. Install Desktop Plugin
echo 2. Coming Soon
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto installdesktop
if %choices% == 2 goto install
if %choices% == 3 goto menu
cls
goto install

:installdesktop
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f program.bat
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Installation Done
pause
goto exit

:uninstall
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f desktop.bat
cls
echo Uninstallation Done
pause
goto exit

:support
cls
echo Discord: kevie#9091
echo Github: thekevie
pause
goto exit

:hide
cd %directory%
attrib +h -s -r "install.bat"
echo Installation File Is Now Hidden
pause
goto exit

:show
cd %directory%
attrib -h -s -r "install.bat"
echo Installation File Is Now Visible
pause
goto exit

:exit
cls
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
start install.bat
exit
