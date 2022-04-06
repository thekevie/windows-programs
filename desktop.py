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
            print(f"deleted {file}")
os.system("cls")

r = requests.get("https://raw.github.com/thekevie/school-programs/main/desktop.py")
with open(path, "r") as f:
    read = f.read()
    f.close()
	
if not read == r.text:
    with open(path, "w") as f:
        f.write(r.text)
        f.close()
    print("write")
