@echo off
REM ARQV30 Enhanced v2.0 - Deploy Local Completo

echo ========================================
echo ARQV30 Enhanced v2.0 - Deploy Local
echo ========================================
echo.

REM Passo 1: Setup completo
echo 📋 Passo 1: Executando setup completo...
call setup_complete.bat

echo.
echo 📋 Passo 2: Verificando sistema...
python check_system.py

echo.
echo 📋 Passo 3: Iniciando aplicação...
echo.
echo 🌐 Aplicação será iniciada em: http://localhost:5000
echo 🛑 Para parar: Ctrl+C
echo.
echo ⚠️ IMPORTANTE:
echo - A aplicação funciona sem Redis (modo síncrono)
echo - Para funcionalidades assíncronas, execute start_celery.bat em outro terminal
echo.

REM Inicia aplicação
call run.bat