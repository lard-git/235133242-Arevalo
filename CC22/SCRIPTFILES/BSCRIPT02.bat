@echo off
:shapes
echo.
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Leave
choice /c 1234 /m "Choose an option:"

if errorlevel 4 goto Leave
if errorlevel 3 goto Quadrilateral
if errorlevel 2 goto Triangle
if errorlevel 1 goto Circle

:Circle
rem I really tried for an hour but according to my research decimals aren't possible through basic stuff so I copied a code. Thank you sir :)
echo Area of a Circle

echo Enter the radius of a circle:

set /p rad=

set pi=3.14159

call :Eval "round(%pi%*%rad%*%rad%, 2)"
set area=%Eval%

echo The area of a Square is: %area%

pause & exit /b

:Eval [expression]
  echo Wscript.Echo Eval(WScript.Arguments.Item(0))>"%~dp0eval.vbs"
  for /F "tokens=*" %%A in ('cscript //nologo eval.vbs "%~1"') do set eval=%%A
  if exist "%~dp0eval.vbs" del "%~dp0eval.vbs"
  exit /b

goto shapes

:Triangle

echo Enter the length of a triangle:

set /p "base=base: "

set /p "height=base: "

set /p "earea=area: "

set /a tarea= base*height/2

echo The area of a triangle is: %tarea% for scalene and isosceles

if "%base%/%height%" equ "%height%/%earea%" goto equilateral

if "%base%" neq "%height%" if "%height%" neq "%earea%" if "%earea%" neq "%base%" goto scalene

:equilateral
echo the triangle is equilateral 
pause & goto shapes

echo the triangle is isosceles 
pause & goto shapes

:scalene
echo the triangle is scalene 
pause & goto shapes

:Quadrilateral

echo Enter the sides of a triangle:

set /p "side1=s1: "

set /p "side2=s2: "

set /a qarea= side1*side2

echo The area of the Quadrilateral is: %qarea%

if "%side1%/%side2%" equ "%side2%/%side1%" goto square

if "%side1%" neq "%side2%" if "%side2%" neq "%side1%" goto rectangle

:square
echo It's a square.
pause & goto shapes


:rectangle
echo It's a rectangle.
pause & goto shapes

:Leave
echo Left.