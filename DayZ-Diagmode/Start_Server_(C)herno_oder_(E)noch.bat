@echo off
SETLOCAL

REM Lesen der bestehenden Konfiguration und Setzen von Variablen
REM Reading the existing configuration and setting variables
for /f "tokens=1* delims== eol=#" %%i in (.\Globals.cfg) do (
   set "%%i=%%j"
)

REM ServerWiki.Network Logo anzeigen
REM Display ServerWiki.Network logo
SET "ASCIIARTPATH=.\data\Logo.txt"
SET "COLORS=Blue,Green,Cyan,DarkBlue,DarkGreen,DarkCyan,DarkRed,DarkMagenta,DarkYellow"
powershell -Command "$colors = '%COLORS%'.Split(','); $randomColor = Get-Random -InputObject $colors; $content = Get-Content -Path '%ASCIIARTPATH%'; $content | ForEach-Object {Write-Host $_ -ForegroundColor $randomColor}"

echo Bitte folge den Anweisungen!
echo.
powershell -Command  "Write-Host 'WARNUNG:' -ForegroundColor DarkYellow;"
powershell -Command  "Write-Host 'Wenn du DayZ auf einem anderen Laufwerk als C:\ installiert hast, ' -ForegroundColor DarkCyan;"
powershell -Command  "Write-Host 'beende bitte diese Anwendung und bearbeite die Datei DayZ-Diagmode\Globals.cfg manuell.' -ForegroundColor DarkCyan;"
echo.

set "localhost=127.0.0.1:2302"
set "ClientLogs=%game_dir%\DayZ-Diagmode\!ClientDiagLogs"

REM Frage, welchen Server du starten möchtest
REM Ask which server you want to start
choice /C CE /M "Welchen Server möchtest du starten? (C)herno oder (E)noch"
if errorlevel 2 (
    set "mission_dir=%game_dir%\DayZ-Diagmode\mpmissions\dayzOffline.enoch"
    set "serverConfig=%game_dir%\DayZ-Diagmode\data\Enoch_serverDZ.cfg"
    set "serverProfile=%game_dir%\DayZ-Diagmode\profiles\Enoch_profiles"
    goto launch
)
if errorlevel 1 (
    set "mission_dir=%game_dir%\DayZ-Diagmode\mpmissions\dayzOffline.chernarusplus"
    set "serverConfig=%game_dir%\DayZ-Diagmode\data\Cherno_serverDZ.cfg"
    set "serverProfile=%game_dir%\DayZ-Diagmode\profiles\Cherno_profiles"
    goto launch
)

:launch
REM Starte lokalen Server
REM Start local server
start /D "%game_dir%\" DayZDiag_x64.exe -server "-mod=%mods%" "-profiles=%serverProfile%" "-mission=%mission_dir%" "-config=%serverConfig%" "-newErrorsAreWarnings=1"

REM Spiele auf lokalem Server
REM Play on local server
start /D "%game_dir%\" DayZDiag_x64.exe "-profiles=%ClientLogs%" "-mod=%mods%" -connect=%localhost% -port=2302 "-newErrorsAreWarnings=1"