@echo off

echo ----------------------------------------
powershell -NoProfile -Command "Write-Host ' Welcome To K Drive Set Up ' -ForegroundColor Blue"
powershell -NoProfile -Command "Write-Host ' Developer : Niranjan Kumar K ' -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host ' Version   : 1.0 ' -ForegroundColor Red"
powershell -NoProfile -Command "Write-Host ' Setting up... ' -ForegroundColor Yellow"
echo ----------------------------------------

if not exist C:\k mkdir C:\k >nul 2>&1

curl -L https://hacker1514.github.io/download/k-windows.exe -o C:\k\k.exe

for /f "tokens=2*" %%A in ('reg query HKCU\Environment /v PATH 2^>nul') do set OLDPATH=%%B
setx PATH "%OLDPATH%;C:\k" >nul 2>&1

echo.
echo ----------------------------------------
powershell -NoProfile -Command "Write-Host ' GitHub Configuration ' -ForegroundColor Cyan"
echo ----------------------------------------

set /p USERNAME=GitHub Username :
set /p EMAIL=GitHub Email :

powershell -Command "$p=Read-Host 'GitHub Personal Access Token' -AsSecureString;$BSTR=[Runtime.InteropServices.Marshal]::SecureStringToBSTR($p);[Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)" > "%TEMP%\pat.txt"

set /p PAT=<"%TEMP%\pat.txt"
del "%TEMP%\pat.txt"

git config --global user.name "%USERNAME%"
git config --global user.email "%EMAIL%"
git config --global credential.helper store

(
echo https://%USERNAME%:%PAT%@github.com
) > "%USERPROFILE%\.git-credentials"

echo.
echo ----------------------------------------
powershell -NoProfile -Command "Write-Host ' GitHub Configured Successfully! ' -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host ' K Drive Installed Successfully! ' -ForegroundColor Green"
powershell -NoProfile -Command "Write-Host ' Restart CMD and run: k help ' -ForegroundColor Cyan"
echo ----------------------------------------

del "%~f0"
