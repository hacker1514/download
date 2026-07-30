@echo off

echo ----------------------------------------
powershell -NoProfile -Command "Write-Host (' Welcome To K Programming Set Up ') -ForegroundColor Blue"
powershell -NoProfile -Command "Write-Host (' Developer : Niranjan Kumar K ') -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host (' Version   : 1.0 ') -ForegroundColor Red"
powershell -NoProfile -Command "Write-Host (' Setting up... ') -ForegroundColor Yellow"
echo ----------------------------------------

if not exist C:\k_programming mkdir C:\k_programming >nul 2>&1

curl -L https://kni-org.github.io/k/k.exe -o C:\k_programming\k.exe >nul 2>&1

for /f "tokens=2*" %%A in ('reg query HKCU\Environment /v PATH 2^>nul') do set OLDPATH=%%B

setx PATH "%OLDPATH%;C:\k_programming" >nul 2>&1

echo.
echo ----------------------------------------
powershell -NoProfile -Command "Write-Host (' K Program Installed Successfully! ') -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host (' Restart CMD and run: k --version ') -ForegroundColor Cyan"
echo ----------------------------------------

del win_set_up.bat >nul 2>&1
