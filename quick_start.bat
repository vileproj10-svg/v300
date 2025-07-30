@echo off
REM ARQV30 Enhanced v2.0 - Quick Start

echo ========================================
echo ARQV30 Enhanced v2.0 - Quick Start
echo ========================================
echo.

echo 🚀 INÍCIO RÁPIDO - 3 PASSOS:
echo.

echo 📋 Passo 1: Setup automático...
call setup_complete.bat

echo.
echo 📋 Passo 2: Verificando Redis (opcional)...
call check_redis.bat

echo.
echo 📋 Passo 3: Iniciando aplicação...
echo.
echo 🌐 Acesse: http://localhost:5000
echo 🛑 Para parar: Ctrl+C
echo.

call run.bat