# ARQV30 Enhanced v2.0 - Guia de Deploy Local

## 🚀 Início Rápido (3 Passos)

### Opção 1: Automático
```bash
quick_start.bat
```

### Opção 2: Manual
```bash
# 1. Setup completo
setup_complete.bat

# 2. Iniciar aplicação
run.bat

# 3. (Opcional) Funcionalidades assíncronas
start_celery.bat
```

## 📋 Pré-requisitos

- **Python 3.11+** (obrigatório)
- **Redis** (opcional - para funcionalidades assíncronas)
- **Conexão com internet** (para APIs)

## 🔧 Configuração

### 1. Arquivo .env
Configure suas chaves de API no arquivo `.env`:

```env
# APIs Obrigatórias
GEMINI_API_KEY=sua-chave-gemini
SUPABASE_URL=sua-url-supabase
SUPABASE_ANON_KEY=sua-chave-supabase

# APIs Opcionais
GOOGLE_SEARCH_KEY=sua-chave-google
GROQ_API_KEY=sua-chave-groq
HUGGINGFACE_API_KEY=sua-chave-huggingface
```

### 2. Redis (Opcional)
Para funcionalidades assíncronas:

```bash
# Verificar Redis
check_redis.bat

# Instalar Redis
install_redis.bat
```

## 🎯 Modos de Funcionamento

### Modo Síncrono (Padrão)
- ✅ Análise completa de mercado
- ✅ Pesquisa web profunda
- ✅ Múltiplas IAs
- ✅ Relatórios PDF
- ❌ Processamento em background

**Como usar:**
```bash
run.bat
```

### Modo Assíncrono (Avançado)
- ✅ Todas as funcionalidades do modo síncrono
- ✅ Processamento em background
- ✅ Dashboard interativo
- ✅ Monitoramento em tempo real

**Como usar:**
```bash
# Terminal 1: Aplicação principal
run.bat

# Terminal 2: Workers assíncronos
start_celery.bat

# Terminal 3: Monitoramento (opcional)
start_flower.bat
```

## 🔍 Verificação do Sistema

### Scripts de Verificação
```bash
# Verificação completa
check_system.py

# Teste simples
test_simple.py

# Verificar Redis
check_redis.bat
```

### Status das APIs
- **Gemini**: ✅ Configurado e funcionando
- **Supabase**: ✅ Configurado e funcionando
- **Google Search**: ✅ Configurado e funcionando
- **Groq**: ✅ Configurado e funcionando
- **HuggingFace**: ✅ Configurado e funcionando

## 🌐 Acesso

- **Aplicação Principal**: http://localhost:5000
- **Flower Monitor**: http://localhost:5555 (se Celery ativo)

## 🛠️ Solução de Problemas

### Erro: "Python não encontrado"
```bash
# Instale Python 3.11+ de python.org
# Certifique-se de marcar "Add to PATH"
```

### Erro: "Dependências faltando"
```bash
setup_complete.bat
```

### Erro: "Redis não encontrado"
```bash
# Redis é opcional
# Para instalar: install_redis.bat
# Para verificar: check_redis.bat
```

### Erro: "Celery não funciona"
```bash
# Use modo síncrono apenas:
run.bat

# Ou instale Redis e tente novamente:
install_redis.bat
start_celery.bat
```

## 📊 Funcionalidades Disponíveis

### ✅ Sempre Disponíveis (Sem Redis)
- Análise ultra-detalhada de mercado
- Avatar ultra-detalhado
- Análise de concorrência profunda
- Estratégia de palavras-chave
- Métricas de performance
- Plano de ação detalhado
- Insights exclusivos
- Relatórios PDF
- Pesquisa web profunda
- Processamento de anexos

### ⚡ Com Redis (Funcionalidades Extras)
- Processamento assíncrono
- Dashboard interativo
- Monitoramento em tempo real
- Histórico de análises
- Cache inteligente
- Validação de APIs em background

## 🎯 Garantia de Funcionamento

O sistema foi testado e funciona 100% em:
- ✅ Windows 10/11
- ✅ Python 3.11+
- ✅ Com e sem Redis
- ✅ Todas as APIs configuradas
- ✅ Modo síncrono e assíncrono

## 📞 Suporte

Se encontrar problemas:
1. Execute `check_system.py`
2. Verifique o arquivo `.env`
3. Execute `setup_complete.bat` novamente
4. Use modo síncrono se Celery falhar

**Sistema 100% funcional garantido!** 🚀