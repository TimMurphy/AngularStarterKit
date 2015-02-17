@echo off

call gulp webserver

if "%ERRORLEVEL%" == "0" exit

echo.
echo ERRORLEVEL: %ERRORLEVEL% 
pause