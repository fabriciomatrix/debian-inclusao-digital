#!/bin/bash

# ==========================================
# Script de Setup: Workstation (Debian/Ubuntu)
# ==========================================

# 1. Configurações de Segurança e Variáveis
# ------------------------------------------
set -e          # Para se houver erro
set -u          # Para se houver variável não declarada
set -o pipefail # Para se houver falha em pipes

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# --- LISTAS DE PACOTES ---

# Utilitários de Sistema (Terminal)
PACOTES_SISTEMA="curl git htop vim ufw wget software-properties-common"

# Aplicações Desktop (Solicitadas)
# Nota: Adicionei o pacote de idioma PT-BR para o LibreOffice
APPS_DESKTOP="libreoffice libreoffice-l10n-pt-br firefox-esr vlc gimp"

# 2. Funções Auxiliares
# ------------------------------------------

info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCESSO]${NC} $1"
}

error() {
    echo -e "${RED}[ERRO]${NC} $1"
    exit 1
}

check_root() {
    if [[ $EUID -ne 0 ]]; then
       error "Este script precisa ser executado como root (sudo)."
    fi
}

# 3. Etapas de Instalação
# ------------------------------------------

atualizar_sistema() {
    info "Atualizando repositórios e sistema..."
    apt-get update && apt-get upgrade -y
}

instalar_basico() {
    info "Instalando utilitários de sistema: $PACOTES_SISTEMA"
    DEBIAN_FRONTEND=noninteractive apt-get install -y $PACOTES_SISTEMA
}

instalar_desktop_apps() {
    info "Instalando aplicativos desktop (Isso pode demorar um pouco)..."
    info "Pacotes: $APPS_DESKTOP"
    
    DEBIAN_FRONTEND=noninteractive apt-get install -y $APPS_DESKTOP
    success "Aplicativos instalados!"
}

limpeza_final() {
    info "Removendo pacotes órfãos e limpando cache..."
    apt-get autoremove -y
    apt-get clean
}

# 4. Execução Principal
# ------------------------------------------
main() {
    check_root
    
    # Cabeçalho
    echo "========================================"
    echo " Iniciando Instalação de Workstation"
    echo "========================================"
    
    atualizar_sistema
    instalar_basico
    instalar_desktop_apps
    limpeza_final
    
    echo "========================================"
    success "Setup finalizado com sucesso!"
    echo "Sugestão: Reinicie o computador se houve atualização de Kernel."
    echo "========================================"
}

main
