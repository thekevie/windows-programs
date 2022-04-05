@echo off
title Install Programs
set directory=%CD%

:menu
cls
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
goto install

:installdesktop
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f program.bat
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Installed Desktop Plugin
pause
goto exit

:uninstall
cls
echo 1. Uninstall Desktop Plugin
echo 2. Coming Soon
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto uninstalldesktop
if %choices% == 2 goto uninstall
if %choices% == 3 goto menu
goto uninstall

:uninstalldesktop
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f desktop.bat
cls
echo Uninstalled Desktop Plugin
pause
goto exit

:support
cls
start https://github.com/thekevie/school-programs
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
