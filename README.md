# CBuild
Simple compiler for C lang for windows using gcc from Mingw64.

## how to use?

step 1: install mingw64 (tutorial: [https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/](link))
step 2: put cbuild.bat inside your C project
step 3: configure varables:

- Your project directory (where are all .C files)
```bat
set "SRC_DIR=C:\Users\piotr\Documents\C\cotDroid\src"
```

- output directory
```
set "OUT_DIR=C:\Users\piotr\Documents\C\cotDroid\bin"
```

- output file name
```
set "OUTPUT_FILE=app.exe"
```
set "CFLAGS=-Wall"
set "INCLUDES=-I handler -I handler/commands -I handler/menu" : 
