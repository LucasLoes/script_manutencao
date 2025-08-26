@echo off
:: Salve o arquivo como UTF-8 para exibir acentuação corretamente
chcp 65001 >nul

title Helpful Books - Assistente de Manutenção
color 0A

:: Verifica privilégios de administrador
net session >nul 2>&1
if not %errorlevel%==0 (
    echo [!] Por favor, execute este script como ADMINISTRADOR! - Equipe HelpFul Books
    pause
    exit /b
)

call :timestamp
call :check_windows_version

cls
echo =================================================================
echo.
echo              HELPFUL BOOKS - ASSISTENTE DE MANUTENÇÃO
echo.
echo =================================================================
echo.
echo Este script irá executar otimizações de software no seu sistema.
echo Status: Privilégios de Administrador detectados.
echo.
echo Iniciando a manutenção em %data% %hora%
echo.

:: Cria ponto de restauracao do sistema (opcional)
call :create_restore_point

echo [Etapa] Verificando arquivos de sistema (SFC)...
sfc /scannow
echo Arquivos de sistema verificados.
echo.

echo [Etapa] Verificando integridade da imagem (DISM)...
dism /online /cleanup-image /checkhealth
echo Integridade da imagem verificada.
echo.

echo [Etapa] Limpando arquivos temporarios...
call :clean_temp
echo Arquivos temporarios removidos.
echo.

echo [Etapa] Limpando cache de navegadores...
call :clean_browser_cache
echo Cache dos navegadores limpo.
echo.

echo [Etapa] Executando Limpeza de Disco (Cleanmgr)...
cleanmgr /sagerun:1
echo Disco limpo.
echo.

echo [Etapa] Limpando cache DNS...
ipconfig /flushdns
echo Cache DNS limpo.
echo.

echo [Etapa] Limpando cache do Windows Update...
call :clean_windows_update_cache
echo Cache do Windows Update limpo.
echo.

echo ==============================================
echo Manutenção concluida! Seu PC esta mais rápido e estável.
echo Se curtiu, avalie nosso Guia na Hotmart!
echo https://hotmart.com/pt-br/marketplace/produtos/manutencao-preventiva-de-pcs-e-book-ilustrado-para-usuarios-e-profissionais/L100220207D
echo ==============================================
echo.
echo Pressione qualquer tecla para sair...
pause >nul
goto :eof

:timestamp
for /f "tokens=1-3 delims=/ " %%a in ("%date%") do set data=%%c-%%b-%%a
set hora=%time:~0,8%
exit /b

:check_windows_version
ver | findstr /i "10.0." >nul
if not %errorlevel%==0 (
    echo [!] Este script foi projetado para Windows 10 ou 11. Saindo...
    pause
    exit
)
exit /b

:create_restore_point
echo [Etapa] Criando ponto de restauracao do sistema...
powershell -Command "Checkpoint-Computer -Description 'ManutencaoHelpFulBooks' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
exit /b

:clean_temp
del /F /S /Q "%TEMP%\*" >nul 2>&1
for /D %%p in ("%TEMP%\*") do rd /S /Q "%%p" >nul 2>&1
del /F /S /Q "%windir%\Temp\*" >nul 2>&1
for /D %%p in ("%windir%\Temp\*") do rd /S /Q "%%p" >nul 2>&1
exit /b

:clean_browser_cache
:: Edge
del /F /S /Q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
:: Chrome
del /F /S /Q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
:: Firefox
del /F /S /Q "%APPDATA%\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1
exit /b

:clean_windows_update_cache
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /F /S /Q "%windir%\SoftwareDistribution\Download\*" >nul 2>&1
for /D %%p in ("%windir%\SoftwareDistribution\Download\*") do rd /S /Q "%%p" >nul 2>&1
net start bits >nul 2>&1
net start wuauserv >nul 2>&1
exit /b
