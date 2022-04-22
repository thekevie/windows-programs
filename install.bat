@echo off
title Version 2.0.2 - Source Code: github.com/thekevie/windows-programs
set directory=%CD%
set plugindir=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:Menu
echo 1. Install Plugins
echo 2. Uninstall Plugins
echo 3. Update Plugins
echo 4. Done Installing
set /p choices=Type the number: 
if %choices% == 1 goto Install
if %choices% == 2 goto Uninstall
if %choices% == 3 goto Update
if %choices% == 4 cls & goto Done
if %choices% == ("close", "exit") goto Exit
if %choices% == admin cls & goto Admin
cls
goto Menu

:Done
echo The Installer file will soon be moved to the Documents Folder.
echo If you want to install, uninstall or update any plugins you can
echo just run the installer file again and select the options you want.
echo.
set /p choices=Type CONFIRM exactly like that to continue: 
if not %choices% == CONFIRM (
    cls 
    echo You didnt type it in the right way 
    echo.
    goto Menu 
    ) else (
    move "%directory%\install.bat" "%userprofile%\documents"
    goto Exit
)
goto Menu


:Install
cls
echo 1. Install All Plugins
echo 2. Install Desktop Plugin
echo 3. Install AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto InstallAll
if %choices% == 2 goto InstallDesktop
if %choices% == 3 goto InstallAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == ("close", "exit") goto Exit
goto Install

:InstallAll
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
cls
echo Installed All Plugin
pause
goto UpdateInstaller

:InstallDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
cls
echo Installed Desktop Plugin
pause
goto UpdateInstaller

:InstallAutoTemp
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
cls
echo Installed AutoTemp Plugin
pause
goto UpdateInstaller


:Uninstall
cls
echo 1. Uninstall All Plugins
echo 2. Uninstall Desktop Plugin
echo 2. Uninstall AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UninstallAll
if %choices% == 2 goto UninstallDesktop
if %choices% == 2 goto UninstallAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == ("close", "exit") goto Exit
goto Uninstall

:UninstallAll
cd %plugindir%
del /q desktop.vbs
del /q autotemp.vbs
cls
echo Uninstalled All Plugin
pause
goto UpdateInstaller

:UninstallDesktop
cd %plugindir%
del /q desktop.vbs
cls
echo Uninstalled Desktop Plugin
pause
goto UpdateInstaller

:UninstallAutoTemp
cd %plugindir%
del /q autotemp.vbs
cls
echo Uninstalled AutoTemp Plugin
pause
goto UpdateInstaller


:Update
cls
echo 1. Update All Plugins
echo 2. Update Desktop Plugin
echo 3. Update AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UpdateAll
if %choices% == 2 goto UpdateDesktop
if %choices% == 3 goto UpdateAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == ("close", "exit") goto Exit
goto Update

:UpdateAll
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
cls
echo Updated All Plugin
pause
goto UpdateInstaller

:UpdateDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
cls
echo Updated Desktop Plugin
pause
goto UpdateInstaller

:UpdateAutoTemp
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
cls
echo Updated AutoTemp Plugin
pause
goto UpdateInstaller


:Admin
echo 1. Update Installer
echo 2. Open Plugin Directory
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UpdateInstaller
if %choices% == 2 goto AdminPluginDir
if %choices% == 3 cls & goto Menu
if %choices% == back cls & goto Menu
cls
goto admin

:AdminPluginDir
cd %plugindir%
start .
cls
goto Admin


:UpdateInstaller
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
start install.bat
del /q /f %temp%\install.bat
goto Exit

:Close
cd %directory%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/install.bat
goto Exit

:Exit
exit
