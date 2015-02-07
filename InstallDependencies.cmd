@echo off
echo.
echo Installs dependencies to build and run AngularStarterKit.
echo.
echo This script assumes chocolatey.org is installed it is being run as Administrator.
echo.

choice /m "Continue with installation?"
if errorlevel 2 goto:eof

echo.
call choco install nodejs
call choco install npm
pause