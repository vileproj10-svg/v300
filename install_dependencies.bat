@echo off
REM ARQV30 Enhanced v2.0 - Instalação de Dependências Faltantes

echo ========================================
echo ARQV30 Enhanced v2.0 - Instalação de Dependências
echo ========================================
echo.

REM Ativa ambiente virtual se existir
if exist "venv\Scripts\activate.bat" (
    echo 🔄 Ativando ambiente virtual...
    call venv\Scripts\activate.bat
) else (
    echo ❌ ERRO: Ambiente virtual não encontrado!
    echo Execute install.bat primeiro.
    pause
    exit /b 1
)

echo 🔄 Instalando dependências faltantes...

REM Instala Groq
pip install groq==0.4.1

REM Instala outras dependências que podem estar faltando
pip install celery==5.3.4
pip install redis==4.5.4
pip install flower==2.0.1

echo ✅ Dependências instaladas com sucesso!
echo.
echo 📋 Próximos passos:
echo 1. Execute run.bat para iniciar a aplicação
echo 2. Para usar funcionalidades assíncronas, execute start_celery.bat
echo.
pause