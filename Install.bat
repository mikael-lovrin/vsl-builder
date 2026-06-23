@echo off
setlocal

set "SRC=%~dp0skills\vsl-builder"
set "DEST=%USERPROFILE%\.claude\skills\vsl-builder"

echo Instalando VSL Builder...

if not exist "%SRC%\SKILL.md" (
    echo ERRO: nao encontrei skills\vsl-builder\SKILL.md ao lado deste instalador.
    pause
    exit /b 1
)

if not exist "%USERPROFILE%\.claude\skills" (
    mkdir "%USERPROFILE%\.claude\skills"
)

if exist "%DEST%" (
    rmdir /s /q "%DEST%"
)

xcopy "%SRC%" "%DEST%" /e /i /y >nul

if exist "%DEST%\SKILL.md" (
    echo.
    echo VSL Builder installed successfully!
    echo Abra o Claude Code e digite /vsl-builder para comecar.
) else (
    echo ERRO: falha ao copiar os arquivos da skill.
)

pause
