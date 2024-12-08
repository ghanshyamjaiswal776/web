@echo off
setlocal

:: Set the backup path
set BACKUP_PATH=E:\krishna\apps

:: Create the backup directory if it doesn't exist
if not exist "%BACKUP_PATH%" (
    mkdir "%BACKUP_PATH%"
)

:: Start ADB server
adb start-server

:: Check if the device is connected
adb devices

:: Check if ADB can access the device
adb shell exit
if %ERRORLEVEL% NEQ 0 (
    echo No device connected or ADB not authorized.
    exit /b
)

:: Backup Gmail app data
echo Backing up Gmail app data...
adb backup -f "%BACKUP_PATH%\gmail_backup.ab" -apk -shared com.google.android.gm

echo Gmail backup completed!
pause
