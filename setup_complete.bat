@echo off
REM ARQV30 Enhanced v2.0 - Setup Completo para Deploy Local

echo ========================================
echo ARQV30 Enhanced v2.0 - Setup Completo
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

REM Cria ambiente virtual se não existir
if not exist "venv" (
    echo 🔄 Criando ambiente virtual...
    python -m venv venv
    if errorlevel 1 (
        echo ❌ ERRO: Falha ao criar ambiente virtual!
        pause
        exit /b 1
    )
)

REM Ativa ambiente virtual
echo 🔄 Ativando ambiente virtual...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ❌ ERRO: Falha ao ativar ambiente virtual!
    pause
    exit /b 1
)

REM Atualiza pip
echo 🔄 Atualizando pip...
python -m pip install --upgrade pip

REM Instala dependências principais
echo 🔄 Instalando dependências principais...
pip install -r requirements.txt
if errorlevel 1 (
    echo ❌ ERRO: Falha ao instalar dependências principais!
    echo Verifique sua conexão com a internet.
    pause
    exit /b 1
)

REM Instala dependências específicas que podem faltar
echo 🔄 Instalando dependências específicas...
pip install groq==0.4.1
pip install celery==5.3.4
pip install redis==4.5.4
pip install flower==2.0.1

REM Cria diretórios necessários
echo 🔄 Criando diretórios...
if not exist "src\uploads" mkdir src\uploads
if not exist "src\cache" mkdir src\cache
if not exist "src\logs" mkdir src\logs
if not exist "logs" mkdir logs
if not exist "cache" mkdir cache

REM Verifica se arquivo .env existe
if not exist ".env" (
    echo ⚠️ AVISO: Arquivo .env não encontrado!
    echo Configure suas chaves de API no arquivo .env
    echo.
) else (
    echo ✅ Arquivo .env encontrado
)

REM Testa imports críticos
echo 🧪 Testando imports críticos...
python -c "
try:
    import flask
    print('✅ Flask OK')
except ImportError as e:
    print('❌ Flask ERRO:', e)

try:
    import google.generativeai
    print('✅ Gemini OK')
except ImportError as e:
    print('❌ Gemini ERRO:', e)

try:
    import groq
    print('✅ Groq OK')
except ImportError as e:
    print('❌ Groq ERRO:', e)

try:
    import celery
    print('✅ Celery OK')
except ImportError as e:
    print('❌ Celery ERRO:', e)

try:
    import redis
    print('✅ Redis OK')
except ImportError as e:
    print('❌ Redis ERRO:', e)

try:
    import supabase
    print('✅ Supabase OK')
except ImportError as e:
    print('❌ Supabase ERRO:', e)
"

echo.
echo ========================================
echo ✅ SETUP COMPLETO FINALIZADO!
echo ========================================
echo.
echo 📋 PRÓXIMOS PASSOS:
echo.
echo 1. Para iniciar a aplicação principal:
echo    run.bat
echo.
echo 2. Para usar funcionalidades assíncronas (opcional):
echo    start_celery.bat (em outro terminal)
echo.
echo 3. Para monitoramento Celery (opcional):
echo    start_flower.bat (em outro terminal)
echo.
echo 4. Acesse: http://localhost:5000
echo.
echo ⚠️ IMPORTANTE:
echo - Redis é necessário apenas para funcionalidades assíncronas
echo - A aplicação funciona sem Redis em modo síncrono
echo - Todas as APIs estão configuradas no arquivo .env
echo - Mantenha os terminais abertos durante o uso
echo.
pause