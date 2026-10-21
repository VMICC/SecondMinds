@echo off
:: Move into the folder where this script is located
cd /d "%~dp0"

git add .
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo No modifications detected. Skipping sync.
    exit /b
)

git commit -m "Automated sync: %date% %time%"
git push origin main
