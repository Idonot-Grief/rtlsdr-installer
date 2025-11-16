::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHzeyGAlJBAZZQq9FWWuA6ca6ev+0MOJtkgPUuM8fbCK5rCPNOFd8Ez0FQ==
::fBE1pAF6MU+EWHzeyGAlJBAZZQq9FWWuA6ca6ev+0MOJtkgPUuM8fbCK5qGAOukDpED8cPY=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJHuR+El9ARVrZQqWOXm8B7YZ18H1+++VpEweUd1uRNmKzKSgGLcBxmvIO58u2Ro=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF65
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAl3i
::ZQ05rAF9IAHYFVzEqQICLRpYWAGJD0+IRpwS+/z64+aCsC0=
::eg0/rx1wNQPfEVWB+kM9LVsJDBaWL2+oObwS+/yb
::fBEirQZwNQPfEVWB+kM9LVsJDBaWL2+oObwS+/yb
::cRolqwZ3JBvQF1fEqQIZJghATQiOfFm/F6AV+u326uSTsQ0bW/B/YYDOyPS8FMxe2WHWFQ==
::dhA7uBVwLU+EWHeL+041K1cUbQ2RLHL2RocZ6eTv6uHn
::YQ03rBFzNR3SWATExkcxJA9RR0jCHWKoFaUFpKjV4OWLp05RFNALVMLo/obu
::dhAmsQZ3MwfNWATEphJifXs=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJHuR+El9ARVrZQqWOXm8B7YZ18H1+++VpEweUd1uRKbVyaCPLOxT2EDleYIo3Ul+qos+CQpNdwCuYwo6vX0Ms3yAVw==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
mkdir "%TEMP%\rtlinstaller\
:: --- Check for administrator privileges ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo You must run this with administrator privileges.
    pause
    exit /b
)

echo Installing RTL-SDR...
timeout /t 1 /nobreak > NUL

:: Extract data.zip to %TEMP%\rtlinstaller
echo Unpacking Contents...
timeout /t 2 /nobreak > NUL
unzip -o ".\data.zip" -d "%TEMP%\rtlinstaller"

echo Continue to install the driver with the setup wizard
pause

"%TEMP%\rtlinstaller\driver\main_inst.exe"

echo Installing librtlsdr...
timeout /t 2 /nobreak > NUL

xcopy "%TEMP%\rtlinstaller\librtlusb\" "C:\Windows\System32\rtlsdr\" /E /H /K /O /X /Q /Y >nul 2>&1

setx /M PATH "%PATH%;C:\Windows\System32\rtlsdr\" >nul

echo Installation done. You may now exit.
pause
