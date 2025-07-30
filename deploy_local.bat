@echo off
REM ARQV30 Enhanced v2.0 - Deploy Local Completo

echo ========================================
echo ARQV30 Enhanced v2.0 - Deploy Local
echo ========================================
echo.

REM Verifica se Python está instalado
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERRO: Python não encontrado!
    echo Instale Python 3.11+ de https://python.org
    pause
    exit /b 1
)

echo ✅ Python encontrado
python --version
echo.

REM Passo 1: Setup completo
echo 📋 Passo 1: Executando setup completo...
call setup_complete.bat
if errorlevel 1 (
    echo ❌ ERRO: Setup falhou!
    pause
    exit /b 1
)

echo.
echo 📋 Passo 2: Verificando sistema...
python check_system.py
if errorlevel 1 (
    echo ⚠️ AVISO: Algumas verificações falharam, mas continuando...
)

echo.
echo 📋 Passo 3: Testando funcionalidades básicas...
python test_simple.py
if errorlevel 1 (
    echo ⚠️ AVISO: Alguns testes falharam, mas continuando...
)

echo.
echo 📋 Passo 4: Iniciando aplicação...
echo.
echo 🌐 Aplicação será iniciada em: http://localhost:5000
echo 🛑 Para parar: Ctrl+C
echo.
echo ⚠️ IMPORTANTE:
echo - A aplicação funciona sem Redis (modo síncrono)
echo - Para funcionalidades assíncronas, execute start_celery.bat em outro terminal
echo - Para monitoramento, execute start_flower.bat em outro terminal
echo.

REM Inicia aplicação
call run.bat