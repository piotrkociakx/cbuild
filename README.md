# CBuild
Simple compiler for C lang for windows using gcc from Mingw64.

## how to use?

**step 1**: install mingw64 tutorial: https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/

**step 2**: put cbuild.bat inside your C project

**step 3**: configure varables:

- Your project directory (where are all .C files)
```bat
set "SRC_DIR=C:\Users\user\Documents\C\cotDroid\src"
```

- output directory
```bat
set "OUT_DIR=C:\Users\user\Documents\C\cotDroid\bin"
```

- output file name
```bat
set "OUTPUT_FILE=app.exe"
```

- folders to **"include"** if you made any .h files and don't want to whrite alwyays like **#include <handler/commands/commandHandler.h>** you can do that you need to whrite only name of file from this dir **<commandHandler.h>**
```bat
set "INCLUDES=-I handler -I handler/commands -I handler/menu"
```

**step 4**: Open cbuild.bat in vscode editor or just in cmd
