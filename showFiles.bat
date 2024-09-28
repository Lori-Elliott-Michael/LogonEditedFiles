@echo off
setlocal

rem Set the date you want to check from
:: Define the path to the last login file
set "lastLoginFile=%temp%\%USERNAME%lastlogin.txt"
set "currentLoginDate=%date:~4,10%"

:: Check if the file exists
if exist "%lastLoginFile%" (
    :: Read the date from the file
    set /p "lastLoginDate=" < "%lastLoginFile%"
    if not defined lastLoginDate (
        :: If the date is empty, set it to the current date
        set "lastLoginDate=%currentLoginDate%"
    )
) else (    
    set "lastLoginDate=%date:~4,10%"
)
rem set "targetDate=09/10/2024"

rem Create a temporary file to store the results
set "outputFile=%temp%\files_since_date.txt"

rem Change to the desired directory
cd C:\Users\%USERNAME%\Documents

rem Use forfiles to find files created after the target date
forfiles /S /D +%lastLoginDate% > %outputFile%

rem Check if the output file has content
if exist %outputFile% (
    rem Copy the list to the clipboard
    type "%outputFile%" | clip
    powershell -Command "Add-Type -AssemblyName PresentationCore,PresentationFramework; [System.Windows.MessageBox]::Show('Files created in the Documents folder since last login:'  + \"`n\" + (Get-Clipboard))"

) else (
    rem Display a message if no files were found
    powershell -Command "Add-Type -AssemblyName PresentationCore,PresentationFramework; [System.Windows.MessageBox]::Show('No files created since %targetDate%.')"
)
echo %currentLoginDate% > "%lastLoginFile%"
:end


endlocal
