@echo off
REM ARQV30 Enhanced v2.0 - Celery Starter para Windows

echo ========================================
echo ARQV30 Enhanced v2.0 - Celery Worker
echo ========================================
echo.

REM Verifica se está no diretório correto
if not exist "src\celery_app.py" (
    echo ❌ ERRO: Arquivo celery_app.py não encontrado!
    echo Certifique-se de estar no diretório raiz do projeto.
    pause
    exit /b 1
)

REM Ativa ambiente virtual se existir
if exist "venv\Scripts\activate.bat" (
    echo 🔄 Ativando ambiente virtual...
    call venv\Scripts\activate.bat
) else (
    echo ⚠️ AVISO: Ambiente virtual não encontrado.
    echo Execute install.bat primeiro.
    echo.
)

REM Verifica se Celery está instalado
python -c "import celery" >nul 2>&1
if errorlevel 1 (
    echo ❌ ERRO: Celery não encontrado!
    echo Execute: pip install celery redis
    pause
    exit /b 1
)

REM Verifica se Redis está rodando (opcional)
echo 🔍 Verificando Redis...
python -c "import redis; r=redis.Redis(); r.ping()" >nul 2>&1
if errorlevel 1 (
    echo ⚠️ AVISO: Redis não encontrado!
    echo.
    echo Para usar processamento assíncrono, instale Redis:
    echo 1. Baixe Redis para Windows
    echo 2. Inicie o servidor Redis
    echo 3. Execute este script novamente
    echo.
    echo Continuando sem Redis (funcionalidades limitadas)...
    echo.
)

echo 🚀 Iniciando Celery Worker...
echo.
echo 📊 Monitoramento: http://localhost:5555 (Flower)
echo 🛑 Para parar: Ctrl+C
echo.
echo ⚠️ IMPORTANTE:
echo - Mantenha esta janela aberta
echo - Execute run.bat em outra janela
echo - Redis é necessário para funcionalidade completa
echo.

REM Navega para diretório src e inicia worker
cd src
celery -A celery_app worker --loglevel=info --concurrency=2 --pool=solo

echo.
echo ✅ Celery Worker encerrado.
pause