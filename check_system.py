#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ARQV30 Enhanced v2.0 - Verificação do Sistema
Script para verificar se tudo está funcionando
"""

import os
import sys
import subprocess

def check_python():
    """Verifica versão do Python"""
    print("🐍 Verificando Python...")
    version = sys.version_info
    print(f"   Versão: {version.major}.{version.minor}.{version.micro}")
    
    if version.major >= 3 and version.minor >= 8:
        print("   ✅ Versão OK")
        return True
    else:
        print("   ❌ Python 3.8+ necessário")
        return False

def check_virtual_env():
    """Verifica ambiente virtual"""
    print("\n🔧 Verificando ambiente virtual...")
    
    if hasattr(sys, 'real_prefix') or (hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix):
        print("   ✅ Ambiente virtual ativo")
        return True
    else:
        print("   ⚠️ Ambiente virtual não detectado")
        return False

def check_dependencies():
    """Verifica dependências"""
    print("\n📦 Verificando dependências...")
    
    dependencies = [
        ('flask', 'Flask'),
        ('google.generativeai', 'Google Gemini'),
        ('supabase', 'Supabase'),
        ('requests', 'Requests'),
        ('pandas', 'Pandas'),
        ('PyPDF2', 'PyPDF2'),
        ('beautifulsoup4', 'BeautifulSoup'),
        ('reportlab', 'ReportLab')
    ]
    
    optional_dependencies = [
        ('groq', 'Groq'),
        ('celery', 'Celery'),
        ('redis', 'Redis'),
        ('flower', 'Flower'),
        ('openai', 'OpenAI')
    ]
    
    all_ok = True
    
    print("   Dependências obrigatórias:")
    for module, name in dependencies:
        try:
            __import__(module)
            print(f"   ✅ {name}")
        except ImportError:
            print(f"   ❌ {name} - FALTANDO")
            all_ok = False
    
    print("\n   Dependências opcionais:")
    for module, name in optional_dependencies:
        try:
            __import__(module)
            print(f"   ✅ {name}")
        except ImportError:
            print(f"   ⚠️ {name} - Opcional")
    
    return all_ok

def check_env_file():
    """Verifica arquivo .env"""
    print("\n⚙️ Verificando arquivo .env...")
    
    if os.path.exists('.env'):
        print("   ✅ Arquivo .env encontrado")
        
        # Verifica chaves críticas
        from dotenv import load_dotenv
        load_dotenv()
        
        critical_keys = ['GEMINI_API_KEY', 'SUPABASE_URL', 'SUPABASE_ANON_KEY']
        
        for key in critical_keys:
            value = os.getenv(key)
            if value and value != 'sua-chave-aqui':
                print(f"   ✅ {key} configurada")
            else:
                print(f"   ⚠️ {key} não configurada")
        
        return True
    else:
        print("   ❌ Arquivo .env não encontrado")
        return False

def check_directories():
    """Verifica diretórios necessários"""
    print("\n📁 Verificando diretórios...")
    
    directories = [
        'src/uploads',
        'src/cache', 
        'src/logs',
        'logs'
    ]
    
    for directory in directories:
        if os.path.exists(directory):
            print(f"   ✅ {directory}")
        else:
            print(f"   ⚠️ {directory} - Criando...")
            os.makedirs(directory, exist_ok=True)
    
    return True

def check_redis():
    """Verifica Redis (opcional)"""
    print("\n🔴 Verificando Redis (opcional)...")
    
    try:
        import redis
        r = redis.Redis(host='localhost', port=6379, db=0)
        r.ping()
        print("   ✅ Redis conectado")
        return True
    except Exception as e:
        print(f"   ⚠️ Redis não disponível: {e}")
        print("   ℹ️ Redis é necessário apenas para funcionalidades assíncronas")
        return False

def test_basic_functionality():
    """Testa funcionalidade básica"""
    print("\n🧪 Testando funcionalidade básica...")
    
    try:
        # Adiciona src ao path
        sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))
        
        # Testa imports principais
        from services.ai_manager import ai_manager
        print("   ✅ AI Manager")
        
        from services.production_search_manager import production_search_manager
        print("   ✅ Search Manager")
        
        from database import db_manager
        print("   ✅ Database Manager")
        
        # Testa conexão com Gemini
        if os.getenv('GEMINI_API_KEY'):
            try:
                import google.generativeai as genai
                genai.configure(api_key=os.getenv('GEMINI_API_KEY'))
                model = genai.GenerativeModel("gemini-1.5-flash")
                response = model.generate_content("Responda apenas: TESTE_OK")
                if response.text and 'TESTE_OK' in response.text:
                    print("   ✅ Gemini funcionando")
                else:
                    print("   ⚠️ Gemini resposta inesperada")
            except Exception as e:
                print(f"   ⚠️ Gemini erro: {e}")
        
        return True
        
    except Exception as e:
        print(f"   ❌ Erro no teste: {e}")
        return False

def main():
    """Função principal"""
    print("=" * 60)
    print("🚀 ARQV30 Enhanced v2.0 - Verificação do Sistema")
    print("=" * 60)
    
    checks = [
        ("Python", check_python),
        ("Ambiente Virtual", check_virtual_env),
        ("Dependências", check_dependencies),
        ("Arquivo .env", check_env_file),
        ("Diretórios", check_directories),
        ("Redis", check_redis),
        ("Funcionalidade Básica", test_basic_functionality)
    ]
    
    results = []
    
    for check_name, check_func in checks:
        try:
            result = check_func()
            results.append((check_name, result))
        except Exception as e:
            print(f"❌ Erro em {check_name}: {e}")
            results.append((check_name, False))
    
    # Relatório final
    print("\n" + "=" * 60)
    print("📊 RELATÓRIO FINAL")
    print("=" * 60)
    
    passed = 0
    critical_passed = 0
    critical_checks = ["Python", "Dependências", "Arquivo .env", "Funcionalidade Básica"]
    
    for check_name, result in results:
        status = "✅ OK" if result else "❌ FALHOU"
        print(f"{check_name:.<30} {status}")
        
        if result:
            passed += 1
            if check_name in critical_checks:
                critical_passed += 1
    
    print("-" * 60)
    print(f"Total: {passed}/{len(results)} verificações passaram")
    print(f"Críticas: {critical_passed}/{len(critical_checks)} passaram")
    
    if critical_passed == len(critical_checks):
        print("\n🎉 SISTEMA PRONTO PARA USO!")
        print("✅ Execute: python src/run.py")
        if any(name == "Redis" and result for name, result in results):
            print("✅ Para funcionalidades assíncronas: start_celery.bat")
    else:
        print("\n⚠️ SISTEMA PRECISA DE AJUSTES")
        print("🔧 Execute setup_complete.bat para corrigir")
    
    return critical_passed == len(critical_checks)

if __name__ == "__main__":
    success = main()
    input("\nPressione Enter para continuar...")
    sys.exit(0 if success else 1)