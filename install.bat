@echo off
title Version 2.1.6 - Source Code: github.com/thekevie/windows-programs
set dir=%CD%
set plugindir=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:Menu
echo 1. Install Plugins
echo 2. Uninstall Plugins
echo 3. Update Plugins
echo 4. Done Installing
echo 5. Close
set /p choices=Type the number: 
if %choices% == 1 goto Install
if %choices% == 2 goto Uninstall
if %choices% == 3 goto Update
if %choices% == 4 cls & goto Done
if %choices% == 5 goto Close
if %choices% == exit goto Close
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
    echo You did not type CONFIRM it in that exact form
    echo.
    goto Menu 
) else (
    if exist "%userprofile%\documents\install.bat" del /q "%userprofile%\documents\install.bat"
    move "%dir%\install.bat" "%userprofile%\documents"
    cd %userprofile%\documents
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
if %choices% == exit goto Close
goto Install

:InstallAll
cd %plugindir%
if exist desktop.vbs (
    set DesktopResponse=Desktop Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
    set DesktopResponse=Desktop Plugin was Installed
)
if exist autotemp.vbs (
    set AutoTempResponse=AutoTemp Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Installed
)
cls
echo %DesktopResponse%
echo %AutoTempResponse%
pause
goto UpdateInstaller

:InstallDesktop
cd %plugindir%
if exist desktop.vbs (
    set DesktopResponse=Desktop Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
    set DesktopResponse=Desktop Plugin was Installed
)
cls
echo %DesktopResponse%
pause
goto UpdateInstaller

:InstallAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    set AutoTempResponse=AutoTemp Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Installed
)
cls
echo %AutoTempResponse%
pause
goto UpdateInstaller


:Uninstall
cls
echo 1. Uninstall All Plugins
echo 2. Uninstall Desktop Plugin
echo 3. Uninstall AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UninstallAll
if %choices% == 2 goto UninstallDesktop
if %choices% == 3 goto UninstallAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == exit goto Close
goto Uninstall

:UninstallAll
cd %plugindir%
if exist desktop.vbs (
    del /q desktop.vbs
    set DesktopResponse=Desktop Plugin was Uninstalled
) else ( 
    set DesktopResponse=AutoDesktop Plugin is not Installed
)
if exist autotemp.vbs (
    del /q autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Uninstalled
) else ( 
    set AutoTempResponse=AutoTemp Plugin is not Installed
)
cls
echo %DesktopResponse%
echo %AutoTempResponse%
pause
goto UpdateInstaller

:UninstallDesktop
cd %plugindir%
if exist desktop.vbs (
    del /q desktop.vbs
    set DesktopResponse=Desktop Plugin was Uninstalled
) else ( 
    set DesktopResponse=Desktop Plugin is not Installed
)
cls
echo %DesktopResponse%
pause
goto UpdateInstaller

:UninstallAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    del /q autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Uninstalled
) else ( 
    set AutoTempResponse=AutoTemp Plugin is not Installed
)
cls
echo %AutoTempResponse%
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
if %choices% == exit goto Close
goto Update

:UpdateAll
cd %plugindir%
if exist desktop.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
    set DesktopResponse=Desktop Plugin was Updated
) else (
    set DesktopResponse=Desktop Plugin is not Installed
)
if exist autotemp.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Updated
) else (
    set AutoTempResponse=AutoTemp Plugin is not Installed
)
cls
echo %DesktopResponse%
echo %AutoTempResponse%
pause
goto UpdateInstaller

:UpdateDesktop
cd %plugindir%
cif exist desktop.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/desktop.vbs
    set DesktopResponse=Desktop Plugin was Updated
) else (
    set DesktopResponse=Desktop Plugin is not Installed
)
cls
echo %DesktopResponse%
pause
goto UpdateInstaller

:UpdateAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set AutoTempResponse=AutoTemp Plugin was Updated
) else (
    set AutoTempResponse=AutoTemp Plugin is not Installed
)
cls
echo %AutoTempResponse%
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
if %choices% == exit goto Close
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
cd %dir%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
start install.bat
goto Exit

:Close
cd %dir%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/install.bat
goto Exit

:Exit
exit
