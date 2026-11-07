@echo off
title Subir Proyecto a GitHub
cd /d "%~dp0"
set PATH=%~dp0git_bin\cmd;%PATH%

echo ============================================================
echo   SUBIR PROYECTO A GITHUB - USM POSTGRADO
echo ============================================================
echo.
echo Tu proyecto ya tiene Git inicializado y su primer commit listo.
echo.
set /p REPO_URL="Pega aqui el enlace de tu repositorio de GitHub: "

if "%REPO_URL%"=="" (
    echo No ingresaste ninguna URL. Operacion cancelada.
    pause
    exit /b
)

echo.
echo [1/2] Conectando con el repositorio remoto...
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
git branch -M main

echo.
echo [2/2] Subiendo el codigo a GitHub...
git push -u origin main

echo.
if %ERRORLEVEL% EQU 0 (
    echo ============================================================
    echo [EXITO] Tu proyecto fue subido a GitHub exitosamente!
    echo Ya puedes compartir el enlace con tu companero.
    echo ============================================================
) else (
    echo ============================================================
    echo [AVISO] Si GitHub te solicita autenticacion:
    echo Recuerda que GitHub requiere un Personal Access Token (PAT)
    echo en lugar de la contrasena tradicional de la cuenta.
    echo ============================================================
)

echo.
pause

