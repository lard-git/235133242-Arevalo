@echo off

:Menu
echo.
echo 1. Sort by date
echo 2. Sort archive files by SIZE
echo 3. delete old/large files
echo 4. Leave
choice /c 12345 /m "Choose an option:"

if errorlevel 4 goto Leave
if errorlevel 3 goto deltest
if errorlevel 2 goto sortize
if errorlevel 1 goto sortest

set "Cdrive=C:\"
set "Archive=D:\Archive"

:sortest
for %%F in ("%Cdrive%*.txt") do (
    move "%%F" "%Archive%"
)
pause & goto Menu

:sortize
pushd "%awkyve%"
dir /b /os > temp.txt
set /p sorted=<temp.txt
del temp.txt
pause & goto Menu

:deltest
echo The following files will be deleted:
echo %sorted%
set /p delete=Delete files? (yes/no): 

if /i "%delete%"=="yes" (
    for /f "tokens=* delims=" %%F in ("%sorted%") do (
        del "%%F"
    )
    echo Files deleted successfully.
) else (
    echo Files not deleted.
)
pause & goto Menu

:Leave
echo Uh uh