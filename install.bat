@echo off
title Version 1.5.0 - Source Code: github.com/thekevie/school-programs
set directory=%CD%
set startup=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:menu
echo 1. Install Plugins
echo 2. Uninstall Plugins
echo 3. Update Plugins
echo 4. Information
echo 5. Hide Installer
echo 6. Show Installer
echo 7. Exit
set /p choices=Type the number: 
if %choices% == 1 goto install
if %choices% == 2 goto uninstall
if %choices% == 3 goto update
if %choices% == 4 goto info
if %choices% == 5 goto hide
if %choices% == 6 goto show
if %choices% == 7 goto close
if %choices% == close goto close
if %choices% == exit goto close
if %choices% == admin cls & goto admin
cls
goto menu

:info
cls
echo When you are done installing the plugins
echo just click the hide option and the next time
echo you restart you computer the file will be hidden
echo.
goto menu

:hide
cd %directory%
attrib +h -s -r "install.bat"
cls
echo Installation File Is Now Hidden
echo.
goto menu

:show
cd %directory%
attrib -h -s -r "install.bat"
cls
echo Installation File Is Now Visible
echo.
goto menu



:install
cls
echo 1. Install All Plugins
echo 2. Install Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto installall
if %choices% == 2 goto installdesktop
if %choices% == 3 cls & goto menu
if %choices% == back cls & goto menu
if %choices% == close goto close
if %choices% == exit goto close
goto install

:installall
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Installed All Plugin
pause
goto close

:installdesktop
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Installed Desktop Plugin
pause
goto close



:uninstall
cls
echo 1. Uninstall All Plugins
echo 2. Uninstall Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto uninstallall
if %choices% == 2 goto uninstalldesktop
if %choices% == 3 cls & goto menu
if %choices% == back cls & goto menu
if %choices% == close goto close
if %choices% == exit goto close
goto uninstall

:uninstallall
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
cls
echo Uninstalled All Plugin
pause
goto close

:uninstalldesktop
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
cls
echo Uninstalled Desktop Plugin
pause
goto close



:update
cls
echo 1. Update All Plugins
echo 2. Update Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto updateall
if %choices% == 2 goto updatedesktop
if %choices% == 3 cls & goto menu
if %choices% == back cls & goto menu
if %choices% == close goto close
if %choices% == exit goto close
goto update

:updateall
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Updated All Plugin
pause
goto close

:updatedesktop
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Updated Desktop Plugin
pause
goto close



:close
cls
cd %temp%
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/install.bat
cd %directory%
copy /y "%temp%\install.bat" "install.bat"
start install.bat
del /q /f %temp%\install.bat
goto exit



:admin
echo 1. Installer
echo 2. Desktop Plugin
echo 3. Open Startup Directory
echo 4. Go Back
set /p choices=Type the number: 
if %choices% == 1 cls & goto admininstaller
if %choices% == 2 cls & goto admindesktop
if %choices% == 3 adminstartupdir
if %choices% == 4 cls & goto menu
if %choices% == back cls & goto menu
if %choices% == close goto close
if %choices% == exit goto close
cls
goto admin

:adminstartupdir
cd %startup%
start .
cls
goto admin



:admininstaller
echo 1. Update Installer
echo 2. Super-Hide Installer
echo 3. Hide Installer
echo 4. Show Installer
echo 5. Go Back
set /p choices=Type the number:
if %choices% == 1 goto close
if %choices% == 2 goto admininstallersuperhide
if %choices% == 3 goto admininstallerhide
if %choices% == 4 goto admininstallershow
if %choices% == 5 cls & goto admin
if %choices% == back cls & goto admin
if %choices% == close goto close
if %choices% == exit goto close
cls
goto admininstaller

:admininstallersuperhide
cd %directory%
attrib +h +s +r "install.bat"
cls
echo Installation File Is Now Super-Hidden
echo.
goto admininstaller

:admininstallerhide
cd %directory%
attrib +h -s +r "install.bat"
cls
echo Installation File Is Now Hidden
echo.
goto admininstaller

:admininstallershow
cd %directory%
attrib -h -s -r "install.bat"
cls
echo Installation File Is Now Visible
echo.
goto admininstaller



:admindesktop
echo 1. Install Desktop Plugin
echo 2. Uninstall Desktop Plugin
echo 3. Update Desktop Plugin
echo 4. Super-Hide Desktop File
echo 5. Hide Desktop File
echo 6. Show Desktop File
echo 7. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto admindesktopinstall
if %choices% == 2 goto admindesktopuninstall
if %choices% == 3 goto admindesktopupdate
if %choices% == 4 goto admindesktopsuperhide
if %choices% == 5 goto admindesktophide
if %choices% == 6 goto admindesktopshow
if %choices% == 7 cls & goto admin
if %choices% == back cls & goto admin
if %choices% == close goto close
if %choices% == exit goto close
cls
goto admindesktop

:admindesktopinstall
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Installed Desktop Plugin
echo.
goto admindesktop

:admindesktopuninstall
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
cls
echo Uninstalled Desktop Plugin
echo.
goto admindesktop

:admindesktopupdate
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe
attrib +h +s +r "desktop.exe"
cls
echo Updated Desktop Plugin
echo.
goto admindesktop

:admindesktopsuperhide
cd %startup%
attrib +h +s +r "desktop.exe"
cls
echo Desktop File Is Now Super-Hidden
echo.
goto admindesktop

:admindesktophide
cd %startup%
attrib +h -s +r "desktop.exe"
cls
echo Desktop File Is Now Hidden
echo.
goto admindesktop

:admindesktophide
cd %startup%
attrib -h -s -r "desktop.exe"
cls
echo Desktop File Is Now Visible
echo.
goto admindesktop

:exit
exit
