@echo off
title Version 2.1.1 - Source Code: github.com/thekevie/windows-programs
set directory=%CD%
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
    echo You didnt type it in the right way 
    echo.
    goto Menu 
    ) else (
    move "%directory%\install.bat" "%userprofile%\documents"
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
if %choices% == 2 goto InstallAutoDesktop
if %choices% == 3 goto InstallAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == exit goto Close
goto Install

:InstallAll
cd %plugindir%
if exist autodesktop.vbs (
    set autodesktopresponse=AutoDesktop Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autodesktop.vbs
    set autodesktopresponse=AutoDesktop Plugin was Installed
)
if exist autotemp.vbs (
    set autotempresponse=AutoTemp Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Installed
)
cls
echo %autodesktopresponse%
echo %autotempresponse%
pause
goto UpdateInstaller

:InstallAutoDesktop
cd %plugindir%
if exist autodesktop.vbs (
    set desktopresponse=AutoDesktop Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autodesktop.vbs
    set desktopresponse=AutoDesktop Plugin was Installed
)
cls
echo %desktopresponse%
pause
goto UpdateInstaller

:InstallAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    set autotempresponse=AutoTemp Plugin is already Installed
) else ( 
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Installed
)
cls
echo %autotempresponse%
pause
goto UpdateInstaller


:Uninstall
cls
echo 1. Uninstall All Plugins
echo 2. Uninstall AutoDesktop Plugin
echo 3. Uninstall AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UninstallAll
if %choices% == 2 goto UninstallAutoDesktop
if %choices% == 3 goto UninstallAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == exit goto Close
goto Uninstall

:UninstallAll
cd %plugindir%
if exist autodesktop.vbs (
    del /q autodesktop.vbs
    set autodesktopresponse=AutoDesktop Plugin was Uninstalled
) else ( 
    set autodesktopresponse=AutoDesktop Plugin is not Installed
)
if exist autotemp.vbs (
    del /q autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Uninstalled
) else ( 
    set autotempresponse=AutoTemp Plugin is not Installed
)
cls
echo %autodesktopresponse%
echo %autotempresponse%
pause
goto UpdateInstaller

:UninstallAutoDesktop
cd %plugindir%
if exist autodesktop.vbs (
    del /q autodesktop.vbs
    set autodesktopresponse=AutoDesktop Plugin was Uninstalled
) else ( 
    set autodesktopresponse=AutoDesktop Plugin is not Installed
)
cls
echo %autodesktopresponse%
pause
goto UpdateInstaller

:UninstallAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    del /q autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Uninstalled
) else ( 
    set autotempresponse=AutoTemp Plugin is not Installed
)
cls
echo %autotempresponse%
pause
goto UpdateInstaller


:Update
cls
echo 1. Update All Plugins
echo 2. Update AutoDesktop Plugin
echo 3. Update AutoTemp Plugin
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UpdateAll
if %choices% == 2 goto UpdateAutoDesktop
if %choices% == 3 goto UpdateAutoTemp
if %choices% == 4 cls & goto Menu
if %choices% == exit goto Close
goto Update

:UpdateAll
cd %plugindir%
if exist autodesktop.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autodesktop.vbs
    set autodesktopresponse=AutoDesktop Plugin was Updated
) else (
    set autodesktopresponse=AutoDesktop Plugin is not Installed
)
if exist autotemp.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Updated
) else (
    set autotempresponse=AutoTemp Plugin is not Installed
)
cls
echo %autodesktopresponse%
echo %autotempresponse%
pause
goto UpdateInstaller

:UpdateAutoDesktop
cd %plugindir%
cif exist desktop.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autodesktop.vbs
    set autodesktopresponse=AutoDesktop Plugin was Updated
) else (
    set autodesktopresponse=AutoDesktop Plugin is not Installed
)
cls
echo %desktopresponse%
pause
goto UpdateInstaller

:UpdateAutoTemp
cd %plugindir%
if exist autotemp.vbs (
    curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/autotemp.vbs
    set autotempresponse=AutoTemp Plugin was Updated
) else (
    set autotempresponse=AutoTemp Plugin is not Installed
)
cls
echo %autotempresponse%
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
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
start install.bat
goto Exit

:Close
cd %directory%
curl -OL https://raw.githubusercontent.com/thekevie/windows-programs/main/install.bat
goto Exit

:Exit
exit
