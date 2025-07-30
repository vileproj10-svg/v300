@echo off
REM ARQV30 Enhanced v2.0 - Flower Monitor para Windows

echo ========================================
echo ARQV30 Enhanced v2.0 - Flower Monitor
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
)

REM Verifica se Flower está instalado
python -c "import flower" >nul 2>&1
if errorlevel 1 (
    echo ❌ ERRO: Flower não encontrado!
    echo Execute: pip install flower
    pause
    exit /b 1
)

echo 🌸 Iniciando Flower Monitor...
echo.
echo 🌐 Interface: http://localhost:5555
echo 🛑 Para parar: Ctrl+C
echo.

REM Navega para diretório src e inicia flower
cd src
celery -A celery_app flower --port=5555

echo.
echo ✅ Flower Monitor encerrado.
pause