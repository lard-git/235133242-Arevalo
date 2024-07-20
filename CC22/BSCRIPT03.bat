@echo off

:options
echo.
echo 1. ipconfig
echo 2. Task list
echo 3. Task kill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Leave
choice /c 123456789 /m "Choose an option:"

if errorlevel 9 goto Leave
if errorlevel 8 goto attribtest
if errorlevel 7 goto findtest
if errorlevel 6 goto defragtest
if errorlevel 5 goto formatest
if errorlevel 4 goto chkdsktest
if errorlevel 3 goto taskki
if errorlevel 2 goto taskli
if errorlevel 1 goto ipconfigtest

:ipconfigtest
echo you went to ipconfig
ipconfig
pause & goto options

:taskli
tasklist
pause & goto options

:taskki
taskkill /im "notepad.exe"
taskkill /im "calc.exe"
pause & goto options

:chkdsktest
chkdsk
pause & goto options

:formatest
format D:
pause & goto options

:defragtest
"defrag.exe" D: -f
pause & goto options

:findtest
find "Desktop" C:\Users\Admin
pause & goto options

:attribtest
Attrib C:\Users\Admin
pause & goto options

:Leave
echo bye!s