@echo off

REM Get the IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do set IP=%%a
set IP=%IP:~1%

REM Configure Line Notify access token
set ACCESS_TOKEN=YOUR_ACCESS_TOKEN

REM Send the IP address using curl
curl -X POST -H "Authorization: Bearer %ACCESS_TOKEN%" -d "message=IP Address: %IP%" https://notify-api.line.me/api/notify
