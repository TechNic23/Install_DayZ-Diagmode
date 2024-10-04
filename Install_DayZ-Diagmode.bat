@echo off

REM Lesen der bestehenden Konfiguration und Setzen von Variablen
REM Reading the existing configuration and setting variables
for /f "tokens=1* delims== eol=#" %%i in (.\DayZ-Diagmode\Globals.cfg) do (
   set "%%i=%%j"
)

REM ServerWiki.Network Logo anzeigen
REM Display ServerWiki.Network logo
SET "ASCIIARTPATH=.\DayZ-Diagmode\data\Logo.txt"
SET "COLORS=Blue,Green,Cyan,DarkBlue,DarkGreen,DarkCyan,DarkRed,DarkMagenta,DarkYellow"
powershell -Command "$colors = '%COLORS%'.Split(','); $randomColor = Get-Random -InputObject $colors; $content = Get-Content -Path '%ASCIIARTPATH%'; $content | ForEach-Object {Write-Host $_ -ForegroundColor $randomColor}"

echo Bitte folge den Anweisungen!
echo.
powershell -Command  "Write-Host 'WARNUNG:' -ForegroundColor DarkYellow;"
powershell -Command  "Write-Host 'Wenn du DayZ auf einem anderen Laufwerk als C:\ installiert hast, ' -ForegroundColor DarkCyan;"
powershell -Command  "Write-Host 'beende bitte diese Anwendung und bearbeite die Datei DayZ-Diagmode\Globals.cfg manuell.' -ForegroundColor DarkCyan;"
echo.
pause

REM Definiere das Quellverzeichnis (verstecktes Verzeichnis)
REM Define the source directory (hidden directory)
set "sourceDir=%~dp0!Workshop\"

REM Definiere das Zielverzeichnis (Verzeichnis, wo das Script liegt)
REM Define the target directory (directory where the script is located)
set "targetDir=%~dp0"

REM Überprüfe, ob das Quellverzeichnis existiert
REM Check if the source directory exists
if not exist "%sourceDir%" (
    powershell -Command "Write-Host 'WARNUNG:' -ForegroundColor Red -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'Modverzeichnis \!Workshop\ wurde nicht gefunden.' -ForegroundColor White -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'Das Script befindet sich nicht im DayZ Verzeichnis' -ForegroundColor White -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'Standard DayZ Installationsverzeichnis:' -ForegroundColor White -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'C:\Program Files (x86)\Steam\steamapps\common\DayZ' -ForegroundColor Blue"
)

REM Kopiere @CF Mod
REM Copy @CF mod
if exist "%sourceDir%@CF" (
    echo Kopiere @CF Mod...
    xcopy /E /I /Y "%sourceDir%@CF" "%targetDir%@CF"
) else (
    powershell -Command "Write-Host 'WARNUNG:' -ForegroundColor Red -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'Abonniere den @CF Mod unter folgendem Link und starte DayZ damit der Mod installiert wird' -ForegroundColor White -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'https://steamcommunity.com/sharedfiles/filedetails/?id=1559212036' -ForegroundColor Blue"
)

REM Kopiere @VPPAdminTools Mod
REM Copy @VPPAdminTools mod
if exist "%sourceDir%@VPPAdminTools" (
    echo Kopiere @VPPAdminTools Mod...
    xcopy /E /I /Y "%sourceDir%@VPPAdminTools" "%targetDir%@VPPAdminTools"
) else (
    powershell -Command "Write-Host 'WARNUNG:' -ForegroundColor Red -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'Abonniere den @VPPAdminTools Mod unter folgendem Link und starte DayZ damit der Mod installiert wird' -ForegroundColor White -BackgroundColor DarkRed"
    powershell -Command "Write-Host 'https://steamcommunity.com/sharedfiles/filedetails/?id=1828439124' -ForegroundColor Blue"
)

echo.
powershell -Command  "Write-Host 'Gratulation:' -BackgroundColor DarkGreen -ForegroundColor Cyan;"
powershell -Command  "Write-Host 'Ich freue mich, dass alles geklappt hat.' -BackgroundColor DarkGreen -ForegroundColor Cyan;"
echo.
pause