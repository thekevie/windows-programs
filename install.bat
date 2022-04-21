@echo off
title Version 1.9.2 - Source Code: github.com/thekevie/school-programs
set directory=%CD%
set plugindir=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:Menu
echo 1. Install Plugins
echo 2. Uninstall Plugins
echo 3. Update Plugins
echo 4. Information
echo 5. Hide Installer
echo 6. Show Installer
echo 7. Exit
set /p choices=Type the number: 
if %choices% == 1 goto Install
if %choices% == 2 goto Uninstall
if %choices% == 3 goto Update
if %choices% == 4 goto Info
if %choices% == 5 goto Hide
if %choices% == 6 goto Show
if %choices% == 7 goto Exit
if %choices% == close goto Exit
if %choices% == exit goto Exit
if %choices% == admin cls & goto Admin
cls
goto Menu

:Info
cls
echo When you are done installing the plugins
echo just click the hide option and the next time
echo you restart you computer the file will be hidden
echo.
goto Menu

:Hide
attrib +h -s -r "%directory%\install.bat"
cls
echo Installation File Is Now Hidden
echo.
goto Menu

:Show
attrib -h -s -r "%directory%\install.bat"
cls
echo Installation File Is Now Visible
echo.
goto Menu


:Install
cls
echo 1. Install All Plugins
echo 2. Install Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto InstallAll
if %choices% == 2 goto InstallDesktop
if %choices% == 3 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == close goto Exit
if %choices% == exit goto Exit
goto Install

:InstallAll
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.vbs
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/autotemp.vbs
cls
echo Installed All Plugin
pause
goto Close

:InstallDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.vbs
cls
echo Installed Desktop Plugin
pause
goto Close

:InstallAutoTemp
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/autotemp.vbs
cls
echo Installed AutoTemp Plugin
pause
goto Close


:Uninstall
cls
echo 1. Uninstall All Plugins
echo 2. Uninstall Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UninstallAll
if %choices% == 2 goto UninstallDesktop
if %choices% == 3 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == close goto Exit
if %choices% == exit goto Exit
goto Uninstall

:UninstallAll
cd %plugindir%
del /q desktop.vbs
del /q autotemp.vbs
cls
echo Uninstalled All Plugin
pause
goto close

:UninstallDesktop
cd %plugindir%
del /q desktop.vbs
cls
echo Uninstalled Desktop Plugin
pause
goto Close

:UninstallAutoTemp
cd %plugindir%
del /q autotemp.vbs
cls
echo Uninstalled AutoTemp Plugin
pause
goto Close


:Update
cls
echo 1. Update All Plugins
echo 2. Update Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto UpdateAll
if %choices% == 2 goto UpdateDesktop
if %choices% == 3 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == close goto Exit
if %choices% == exit goto Exit
goto Update

:UpdateAll
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.vbs
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/autotemp.vbs
cls
echo Updated All Plugin
pause
goto Close

:UpdateDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.vbs
cls
echo Updated Desktop Plugin
pause
goto Close

:UpdateAutoTemp
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/autotemp.vbs
cls
echo Updated AutoTemp Plugin
pause
goto Close


:Close
cls
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
start install.bat
del /q /f %temp%\install.bat
goto RealExit


:Admin
echo 1. Installer
echo 2. Open Plugin Directory
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 cls & goto AdminInstaller
if %choices% == 2 goto AdminPluginDir
if %choices% == 3 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == close goto Exit
if %choices% == exit goto Exit
cls
goto admin

:AdminPluginDir
cd %plugindir%
start .
cls
goto Admin


:AdminInstaller
echo 1. Update Installer
echo 2. Super-Hide Installer
echo 3. Hide Installer
echo 4. Show Installer
echo 5. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto close
if %choices% == 2 goto AdminInstallerSuperHide
if %choices% == 3 goto AdminInstallerHide
if %choices% == 4 goto AdminInstallerShow
if %choices% == 5 cls & goto Admin
if %choices% == back cls & goto Admin
if %choices% == close goto Exit
if %choices% == exit goto Exit
cls
goto AdminInstaller

:AdminInstallerSuperHide
attrib +h +s +r "%directory%\install.bat"
cls
echo Installation File Is Now Super-Hidden
echo.
goto AdminInstaller

:AdminInstallerHide
attrib +h -s +r "%directory%\install.bat"
cls
echo Installation File Is Now Hidden
echo.
goto AdminInstaller

:AdminInstallerShow
attrib -h -s -r "%directory%\install.bat"
cls
echo Installation File Is Now Visible
echo.
goto AdminInstaller


:Exit
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
goto RealExit

:RealExit
exit
