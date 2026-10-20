@echo off
rem start.cmd - start local server + Cloudflare tunnel so phones can open the app over HTTPS
rem Usage: double-click, or run  start.cmd  (cmd)  /  .\start.cmd  (PowerShell)
cd /d "%~dp0"

rem Server in its own window (if port 8080 is already serving, that window just exits)
start "scan-3bb server" powershell -NoProfile -ExecutionPolicy Bypass -NoExit -File serve.ps1

rem Tunnel here: look for the https://....trycloudflare.com link below and open it on the phone
"C:\Program Files (x86)\cloudflared\cloudflared.exe" tunnel --url http://localhost:8080 --http-host-header localhost:8080
