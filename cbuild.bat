@echo off

rem configuration

:: src of project
set "SRC_DIR=C:\Users\piotr\Documents\C\cotDroid\src" 
:: output dir for output file
set "OUT_DIR=C:\Users\piotr\Documents\C\cotDroid\bin" 
:: output file name
set "OUTPUT_FILE=app.exe"
:: compiler
set "COMPILER=gcc"
:: c flags
set "CFLAGS=-Wall"
:: project files
set "INCLUDES=-I handler -I handler/commands -I handler/menu"
:: stats file (is better to use just C:\cbuild\ dir)
set "STATS_FILE=C:\cbuild\stats.txt"

rem build stats
if not exist "C:\cbuild" (
    mkdir "C:\cbuild"
    if errorlevel 1 (
        echo Failed to create directory: C:\cbuild
        exit /b
    )
)
set "successful_builds=0"
set "total_builds=0"
set "failed_builds=0"
if exist "%STATS_FILE%" (
    for /f "tokens=1,2 delims=:" %%a in ('findstr /c:"Total Builds" "%STATS_FILE%"') do set "total_builds=%%b"
    for /f "tokens=1,2 delims=:" %%a in ('findstr /c:"Successful Builds" "%STATS_FILE%"') do set "successful_builds=%%b"
    for /f "tokens=1,2 delims=:" %%a in ('findstr /c:"Failed Builds" "%STATS_FILE%"') do set "failed_builds=%%b"
)

rem trying to create output directory 
if not exist "%OUT_DIR%" (
    mkdir "%OUT_DIR%"
    if errorlevel 1 (
        echo Failed to create output directory: %OUT_DIR%
        exit /b
    )
)

:build
color 06
cls
echo Building all .c files in %SRC_DIR% ...

cd "%SRC_DIR%" || exit /b

:: Remove old exe file
del "%OUT_DIR%\%OUTPUT_FILE%" >nul 2>&1

setlocal enabledelayedexpansion

:: Add files to executable file
set "sources="

for /R %%f in (*.c) do (
    set "sources=!sources! %%f"
)

rem compile command
%COMPILER% %CFLAGS% -o "%OUT_DIR%\%OUTPUT_FILE%" !sources! %INCLUDES%


rem stats
set /a total_builds+=1 

if %errorlevel% neq 0 (
    color 04
    echo Build failed. Please check your code for errors.
    set /a failed_builds+=1 
) else (
    color 02
    echo Build successful.
    set /a successful_builds+=1 
)

rem display stats
:display_stats
echo.
echo ===============================
echo         Build Statistics
echo ===============================
echo Total Builds:               %total_builds%
echo Successful Builds:          %successful_builds%
echo Failed Builds:              %failed_builds%

if %total_builds% gtr 0 (
    set /a success_rate=successful_builds*100/total_builds
    echo Success Rate:             %success_rate%% 
) else (
    echo Success Rate:             N/A
)


(
    echo ===============================
    echo Total Builds:               %total_builds%
    echo Successful Builds:          %successful_builds%
    echo Failed Builds:              %failed_builds%
    if %total_builds% gtr 0 (
        echo Success Rate:               %success_rate%% 
    ) else (
        echo Success Rate:               N/A
    )
    echo ===============================
) > "%STATS_FILE%"

rem rebuild?
:ask_again
echo.
set /p answer=Do you want to build again? (y/n): 
if /i "%answer%"=="y" goto build
if /i "%answer%"=="n" goto end
echo Invalid choice. Please type y or n.
goto ask_again

:end
cls
color 0f
echo Build finished. Thank you for using cbuild!
