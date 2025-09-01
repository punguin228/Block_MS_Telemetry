@echo off
setlocal enabledelayedexpansion
net session >nul 2>&1
if %errorlevel% neq 0 (
exit /b 1
)
set "hostsFile=C:\Windows\System32\drivers\etc\hosts"
set "backupFile=%hostsFile%.backup_%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%"
copy "%hostsFile%" "%backupFile%" >nul
set "domains=localhost data.microsoft.com msftconnecttest.com azureedge.net activity.windows.com bingapis.com msedge.net assets.msn.com scorecardresearch.com edge.microsoft.com data.msn.com"
findstr /i "::1 localhost" "%hostsFile%" >nul
if %errorlevel% neq 0 (
echo. >> "%hostsFile%"
echo 127.0.0.1  localhost >> "%hostsFile%"
echo ::1        localhost >> "%hostsFile%"
)
for %%d in (%domains%) do (
if not "%%d"=="localhost" (
findstr /i "%%d" "%hostsFile%" >nul
if %errorlevel% neq 0 (
echo 127.0.0.1  %%d >> "%hostsFile%"
)
)
)
endlocal