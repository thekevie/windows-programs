@echo off
title Version 1.3.9 - Source Code: github.com/thekevie/school-programs
set directory=%CD%
set startup=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

:menu
cls
echo 1. Install Plugins
echo 2. Uninstall Plugins
echo 3. Update Plugins
echo 4. Information
echo 5. Hide Installer
echo 6. Show Installer
echo 7. Exit Installer
set /p choices=Type the number: 
if %choices% == 1 goto install
if %choices% == 2 goto uninstall
if %choices% == 3 goto update
if %choices% == 4 goto info
if %choices% == 5 goto hide
if %choices% == 6 goto show
if %choices% == 7 exit
if %choices% == admin goto admin
goto menu

:info
cls
echo When you are done installing the plugin 
echo just click the hide option and when you
echo restart you computer the file will be gone
echo.
pause
goto menu

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
echo 1. Install All Plugins
echo 2. Install Desktop Plugin
echo 3. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto installall
if %choices% == 2 goto installdesktop
if %choices% == 3 goto menu
goto install

:installall
cls
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
cls
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
if %choices% == 3 goto menu
goto uninstall

:uninstallall
cls
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
cls
echo Uninstalled All Plugin
pause
goto close

:uninstalldesktop
cls
cd %startup%
attrib -h -s -r "desktop.exe"
del desktop.exe
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
start install.bat
del /q /f %temp%\install.bat
goto exit



:admin
cls
echo 1. Update Install.bat
echo 2. Super Hide Install.bat
echo 3. Open Startup Directory
echo 4. Make desktop.exe Hidden
echo 5. Make desktop.exe Visible
echo 6. Go Back
set /p choices=Type the number: 
if %choices% == 1 goto close
if %choices% == 2 goto superhide
if %choices% == 3 goto startupdir
if %choices% == 4 goto hidedesktop
if %choices% == 5 goto showdesktop
if %choices% == 6 goto menu
goto admin

:superhide
cls
cd %directory%
attrib +h +s -r "install.bat"
echo Installation File Is Now Super-Hidden
pause
goto admin

:startupdir
cd %startup%
start .
goto admin

:hidedesktop
cd %startup%
attrib +h +s +r "desktop.exe"
goto admin

:showdesktop
cd %startup%
attrib -h -s -r "desktop.exe"
goto admin

:exit
exit
