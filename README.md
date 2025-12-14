#  Projeto Renova Debian: Inclusão Sociodigital

![Debian Version](https://img.shields.io/badge/Debian-12%20Bookworm-A81D33?logo=debian)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow)

> **Tecnologia para todos.** Um projeto para transformar computadores antigos em estações de trabalho produtivas e educativas para ONGs e escolas comunitárias.

---

## Sobre o Projeto

O **Renova Debian** é uma iniciativa acadêmica e social que visa combater dois problemas simultâneos: o descarte prematuro de eletrônicos (lixo eletrônico) e a exclusão digital em comunidades carentes.

Muitos computadores são descartados por empresas por não suportarem sistemas operacionais modernos (como Windows 11). No entanto, com o software correto, esse hardware ainda é extremamente capaz.

Este repositório contém scripts de automação e documentação para configurar o **Debian GNU/Linux** de forma otimizada, leve e amigável para usuários iniciantes, permitindo a criação de laboratórios de informática de baixo custo (ou custo zero).

## Objetivos

- **Sustentabilidade:** Estender a vida útil de hardware antigo (Green IT).
- **Inclusão:** Fornecer um sistema operacional gratuito, seguro e completo para estudo e trabalho.
- **Automação:** Permitir que técnicos voluntários configurem um laboratório inteiro rapidamente usando scripts Bash.

## Stack Tecnológica

- **Sistema Base:** Debian 12 (Bookworm) - Escolhido pela estabilidade "Rock Solid" e suporte a hardware legado.
- **Interface Gráfica:** XFCE - Leve, personalizável e com layout familiar para quem vem do Windows.
- **Softwares Inclusos:** LibreOffice, Firefox ESR, GIMP, VLC, Scratch (Educação).
- **Scripts:** Bash Shell Scripting para pós-instalação e configuração.

## Requisitos de Hardware

O projeto foca em hardware modesto, comumente encontrado em doações:

| Componente | Mínimo | Recomendado |
| :--- | :--- | :--- |
| **Processador** | Core 2 Duo / Athlon 64 | Core i3 (2ª Gen) ou superior |
| **Memória RAM** | 2 GB | 4 GB |
| **Armazenamento**| 40 GB HDD | 120 GB SSD |
| **Arquitetura** | amd64 (64-bit) | amd64 (64-bit) |

## Como Usar (Instalação)

### Passo 1: Instalação do Sistema Base
1. Baixe a ISO oficial do [Debian Netinst](https://www.debian.org/download).
2. Instale o sistema básico (durante a instalação, **desmarque** todas as opções de interface gráfica e servidor web/print. Deixe apenas "Utilitários de sistema padrão").

### Passo 2: Executando o Script Renova
Após logar no terminal do novo sistema como `root` (ou usuário com `sudo`), execute:

```bash
# 1. Instale o git (se não tiver)
apt install git -y

# 2. Clone este repositório
git clone [https://github.com/SEU_USUARIO/debian-inclusao-digital.git](https://github.com/SEU_USUARIO/debian-inclusao-digital.git)

# 3. Entre na pasta e dê permissão de execução
cd debian-inclusao-digital/scripts
chmod +x setup.sh

# 4. Execute o script
./setup.sh
