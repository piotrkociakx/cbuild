# CBuild
Simple compiler for C lang for windows using gcc from Mingw64.

This project is licensed under the MIT License. See the [LICENSE](https://github.com/piotrkociakx/cbuild/blob/cf5e88dd072205be9a68f296a6756938348e5b64/LICENSE) file for details.

## how to use?

**step 1**: install mingw64 tutorial: [link](https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/)

**step 2**: put [cbuild.bat](https://github.com/piotrkociakx/cbuild/blob/cf5e88dd072205be9a68f296a6756938348e5b64/cbuild.bat) inside your C project

**step 3**: configure:

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
