import os
import request

path = os.path.abspath(__file__)

dirs = ["%userprofile%/Desktop/", "%public%/Desktop/"]

for dir in dirs:
    files = os.listdir(dir)
    for file in files:
        if file.endswith(".url"):
            os.remove(os.path.join(dir, file))
            print(f"deleted {file}")
os.system("cls")

r = requests.get("https://github.com/thekevie/school-programs/blob/main/desktop.py")
with open(path, "a") as f:
    read = f.read()
    write = f.write()
	
if not read == r:
    write(r)
