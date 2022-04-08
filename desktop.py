__version__ = "1.1.5"

import os
import time

time.sleep(3)

user = os.path.expandvars(r'%userprofile%\Desktop')
public = os.path.expandvars(r'%public%\Desktop')
dirs = [user, public]

for dir in dirs:
    files = os.listdir(dir)
    for file in files:
        if file.endswith(".url"):
            os.remove(os.path.join(dir, file))
