@echo off
REM ARQV30 Enhanced v2.0 - Instalador Redis para Windows

echo ========================================
echo ARQV30 Enhanced v2.0 - Instalação Redis
echo ========================================
echo.

echo 📋 INSTRUÇÕES PARA INSTALAR REDIS:
echo.
echo OPÇÃO 1 - Download Manual:
echo 1. Acesse: https://github.com/microsoftarchive/redis/releases
echo 2. Baixe: Redis-x64-3.0.504.msi
echo 3. Execute o instalador
echo 4. Inicie o serviço Redis
echo.
echo OPÇÃO 2 - Chocolatey:
echo 1. Instale Chocolatey: https://chocolatey.org/install
echo 2. Execute: choco install redis-64
echo 3. Inicie: redis-server
echo.
echo OPÇÃO 3 - Docker (Recomendado):
echo 1. Instale Docker Desktop
echo 2. Execute: docker run -d -p 6379:6379 --name redis redis:alpine
echo.
echo OPÇÃO 4 - WSL2 (Avançado):
echo 1. Instale WSL2
echo 2. No Ubuntu: sudo apt install redis-server
echo 3. Inicie: sudo service redis-server start
echo.

set /p choice="Escolha uma opção (1-4) ou pressione Enter para continuar sem Redis: "

if "%choice%"=="1" (
    echo 🌐 Abrindo página de download...
    start https://github.com/microsoftarchive/redis/releases
)

if "%choice%"=="2" (
    echo 📦 Verificando Chocolatey...
    choco --version >nul 2>&1
    if errorlevel 1 (
        echo ❌ Chocolatey não encontrado!
        echo Instale primeiro: https://chocolatey.org/install
    ) else (
        echo 🔄 Instalando Redis via Chocolatey...
        choco install redis-64 -y
    )
)

if "%choice%"=="3" (
    echo 🐳 Verificando Docker...
    docker --version >nul 2>&1
    if errorlevel 1 (
        echo ❌ Docker não encontrado!
        echo Instale Docker Desktop primeiro
    ) else (
        echo 🔄 Iniciando Redis via Docker...
        docker run -d -p 6379:6379 --name arqv30-redis redis:alpine
        echo ✅ Redis iniciado via Docker!
    )
)

if "%choice%"=="4" (
    echo 🐧 Instruções para WSL2:
    echo 1. wsl --install
    echo 2. wsl
    echo 3. sudo apt update
    echo 4. sudo apt install redis-server
    echo 5. sudo service redis-server start
)

echo.
echo ⚠️ IMPORTANTE:
echo - Redis é OPCIONAL para o ARQV30 Enhanced
echo - A aplicação funciona sem Redis (modo síncrono)
echo - Com Redis: funcionalidades assíncronas + dashboard
echo - Sem Redis: funcionalidades básicas completas
echo.
echo 📋 Após instalar Redis, execute:
echo 1. check_redis.bat (para verificar)
echo 2. start_celery.bat (para workers)
echo 3. run.bat (para aplicação)
echo.
pause