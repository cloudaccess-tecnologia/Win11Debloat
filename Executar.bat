@echo off
:: ============================================================================
:: Win11Debloat - Script de Execução PT-BR
:: Autor Original: Raphire (https://github.com/Raphire)
:: Tradução: Arnaldo Lima (https://arnaldolima.com)
:: Data: 29/11/2025
:: ============================================================================

:: Define caminhos de instalação do Windows Terminal (Padrão e Scoop)
set "wtDefaultPath=%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe"
set "wtScoopPath=%USERPROFILE%\scoop\apps\windows-terminal\current\wt.exe"

:: Inicia o script no Windows Terminal se instalado, caso contrário usa PowerShell padrão
if exist "%wtDefaultPath%" (
    PowerShell -Command "Start-Process -FilePath '%wtDefaultPath%' -ArgumentList 'PowerShell -NoProfile -ExecutionPolicy Bypass -File ""%~dp0Win11Debloat.ps1""' -Verb RunAs"
) else if exist "%wtScoopPath%" (
    PowerShell -Command "Start-Process -FilePath '%wtScoopPath%' -ArgumentList 'PowerShell -NoProfile -ExecutionPolicy Bypass -File ""%~dp0Win11Debloat.ps1""' -Verb RunAs"
) else (
    echo Windows Terminal nao encontrado, usando PowerShell padrao...
    PowerShell -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0Win11Debloat.ps1""' -Verb RunAs}"
)
