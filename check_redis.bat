@echo off
REM ARQV30 Enhanced v2.0 - Verificador de Redis

echo ========================================
echo ARQV30 Enhanced v2.0 - Verificação Redis
echo ========================================
echo.

REM Ativa ambiente virtual se existir
if exist "venv\Scripts\activate.bat" (
    call venv\Scripts\activate.bat
)

echo 🔍 Verificando Redis...
echo.

REM Testa conexão com Redis
python -c "
import redis
import sys

try:
    r = redis.Redis(host='localhost', port=6379, db=0)
    r.ping()
    print('✅ Redis está rodando e acessível!')
    print(f'📊 Versão: {r.info().get(\"redis_version\", \"N/A\")}')
    print(f'💾 Memória usada: {r.info().get(\"used_memory_human\", \"N/A\")}')
    print(f'🔗 Conexões: {r.info().get(\"connected_clients\", \"N/A\")}')
    sys.exit(0)
except redis.ConnectionError:
    print('❌ Redis não está rodando!')
    print('')
    print('Para instalar Redis no Windows:')
    print('1. Baixe Redis para Windows')
    print('2. Extraia e execute redis-server.exe')
    print('3. Execute este script novamente')
    print('')
    print('Ou use Docker:')
    print('docker run -d -p 6379:6379 redis:alpine')
    sys.exit(1)
except ImportError:
    print('❌ Biblioteca redis não instalada!')
    print('Execute: pip install redis')
    sys.exit(1)
except Exception as e:
    print(f'❌ Erro inesperado: {e}')
    sys.exit(1)
"

if errorlevel 1 (
    echo.
    echo ⚠️ Redis não está disponível.
    echo A aplicação funcionará em modo síncrono apenas.
) else (
    echo.
    echo ✅ Redis está funcionando perfeitamente!
    echo Funcionalidades assíncronas disponíveis.
)

echo.
pause