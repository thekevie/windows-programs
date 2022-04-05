// Version 1.2.4
// Source Code: github.com/thekevie/school-programs
@echo off
title Install Programs
set directory=%CD%

:menu
cls
echo 1. Install
echo 2. Uninstall
echo 3. Support
echo 4. Hide
echo 5. Show
echo 6. Exit
set /p choices=Type the number: 
if %choices% == 1 goto install
if %choices% == 2 goto uninstall
if %choices% == 3 goto support
if %choices% == 4 goto hide
if %choices% == 5 goto show
if %choices% == 6 exit
if %choices% == admin goto admin
goto menu

:support
cls
start https://github.com/thekevie/school-programs
goto exit

:hide
cls
cd %directory%
attrib +h -s -r "install.bat"
echo Installation File Is Now Hidden
pause
goto menu

:show
cls
cd %directory%
attrib -h -s -r "install.bat"
echo Installation File Is Now Visible
pause
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

:installdesktop
cls
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f desktop.bat
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
attrib +h +s +r "desktop.bat"
cls
echo Installed Desktop Plugin
pause
goto close

:uninstalldesktop
cls
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /q /f desktop.bat
cls
echo Uninstalled Desktop Plugin
pause
goto close

:close
cls
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
start install.bat
goto exit

:admin
cls
echo 1. Update File
echo 2. Super Hidden File
echo 3. Open Startup Directory
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto close
if %choices% == 2 goto superhide
if %choices% == 3 goto startupdir
if %choices% == 4 goto menu
goto admin

:superhide
cls
cd %directory%
attrib +h +s -r "install.bat"
echo Installation File Is Now Super-Hidden
pause
goto admin

:startupdir
cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
start .
goto exit

:exit
exit
