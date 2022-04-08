@echo off
title Version 1.6.1 - Source Code: github.com/thekevie/school-programs
set directory=%CD%
set startup=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
set plugindir=%userprofile%\AppData

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
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cscript /nologo (
set WS = WScript.CreateObject("WScript.Shell")
set link = WS.CreateShortcut("%startup%\desktop.lnk")
link.TargetPath = "%plugindir%\desktop.bat"
)
pause
cls
echo Installed All Plugin
pause
goto Close

:InstallDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
mklink %startup%\desktop.lnk %plugindir%\desktop.bat
cls
echo Installed Desktop Plugin
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
del /q %startup%\desktop.lnk
del /q %plugindir%\desktop.bat
cls
echo Uninstalled All Plugin
pause
goto close

:UninstallDesktop
del /q %startup%\desktop.lnk
del /q %plugindir%\desktop.bat
cls
echo Uninstalled Desktop Plugin
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
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Updated All Plugin
pause
goto Close

:UpdateDesktop
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Updated Desktop Plugin
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
echo 2. Desktop Plugin
echo 3. Open Startup Directory
echo 4. Open Plugin Directory
echo 5. Go Back
set /p choices=Type the number: 
if %choices% == 1 cls & goto AdminInstaller
if %choices% == 2 cls & goto AdminDesktop
if %choices% == 3 goto AdminStartupDir
if %choices% == 4 goto AdminPluginDir
if %choices% == 5 cls & goto Menu
if %choices% == back cls & goto Menu
if %choices% == close goto Exit
if %choices% == exit goto Exit
cls
goto admin

:AdminStartupDir
cd %startup%
start .
cls
goto Admin

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



:AdminDesktop
echo 1. Install Desktop Plugin
echo 2. Uninstall Desktop Plugin
echo 3. Update Desktop Plugin
echo 4. Super-Hide Desktop File
echo 5. Hide Desktop File
echo 6. Show Desktop File
echo 7. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto AdminDesktopInstall
if %choices% == 2 goto AdminDesktopUninstall
if %choices% == 3 goto AdminDesktopUpdate
if %choices% == 4 goto AdminDesktopSuperHide
if %choices% == 5 goto AdminDesktopHide
if %choices% == 6 goto AdminDesktopShow
if %choices% == 7 cls & goto Admin
if %choices% == back cls & goto Admin
if %choices% == close goto Exit
if %choices% == exit goto Exit
cls
goto AdminDesktop

:AdminDesktopInstall
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
mklink %startup%\desktop.lnk %userprofile%\desktop.bat
cls
echo Installed Desktop Plugin
echo.
goto AdminDesktop

:AdminDesktopUninstall
del /q %startup%\desktop.lnk
del /q %plugindir%\desktop.bat
cls
echo Uninstalled Desktop Plugin
echo.
goto AdminDesktop

:AdminDesktopUpdate
cd %plugindir%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.bat
cls
echo Updated Desktop Plugin
echo.
goto AdminDesktop

:AdminDesktopSuperHide
attrib +h +s +r "%plugindir%\desktop.bat"
cls
echo Desktop File Is Now Super-Hidden
echo.
goto AdminDesktop

:AdminDesktopHide
attrib +h -s +r "%plugindir%\desktop.bat"
cls
echo Desktop File Is Now Hidden
echo.
goto AdminDesktop

:AdminDesktopShow
attrib -h -s -r "%plugindir%\desktop.bat"
cls
echo Desktop File Is Now Visible
echo.
goto AdminDesktop

:Exit
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
del /q /f %temp%\install.bat
goto RealExit

:RealExit
exit
