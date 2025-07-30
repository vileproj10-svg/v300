#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
ARQV30 Enhanced v2.0 - Script para corrigir imports e dependências
"""

import os
import sys
import subprocess
import logging

def install_missing_dependencies():
    """Instala dependências faltantes"""
    
    print("🔄 Verificando e instalando dependências faltantes...")
    
    dependencies = [
        'groq==0.4.1',
        'celery==5.3.4', 
        'redis==4.5.4',
        'flower==2.0.1'
    ]
    
    for dep in dependencies:
        try:
            print(f"📦 Instalando {dep}...")
            subprocess.run([sys.executable, '-m', 'pip', 'install', dep], check=True)
            print(f"✅ {dep} instalado com sucesso")
        except subprocess.CalledProcessError as e:
            print(f"❌ Erro ao instalar {dep}: {e}")
    
    print("✅ Verificação de dependências concluída!")

def test_imports():
    """Testa imports críticos"""
    
    print("\n🔍 Testando imports críticos...")
    
    imports_to_test = [
        ('flask', 'Flask'),
        ('google.generativeai', 'Gemini'),
        ('supabase', 'Supabase'),
        ('celery', 'Celery'),
        ('redis', 'Redis'),
        ('groq', 'Groq')
    ]
    
    for module, name in imports_to_test:
        try:
            __import__(module)
            print(f"✅ {name} OK")
        except ImportError as e:
            print(f"❌ {name} FALHOU: {e}")

def main():
    """Função principal"""
    print("=" * 50)
    print("🚀 ARQV30 Enhanced v2.0 - Correção de Dependências")
    print("=" * 50)
    
    install_missing_dependencies()
    test_imports()
    
    print("\n" + "=" * 50)
    print("✅ Correção concluída!")
    print("📋 Execute agora: python src/run.py")
    print("=" * 50)

if __name__ == '__main__':
    main()