<div align="center" markdown="1">
   <sup>Agradecimentos Especiais para:</sup>
   <br>
   <br>
   <a href="https://www.warp.dev/windebloat">
      <img alt="Warp sponsorship" width="400" src="https://github.com/user-attachments/assets/c21102f7-bab9-4344-a731-0cf6b341cab2">
   </a>

### [Warp, the intelligent terminal for developers](https://www.warp.dev/windebloat)
[Available for MacOS, Linux, & Windows](https://www.warp.dev/windebloat)<br>

</div>
<hr>

# Win11Debloat - Versão Português Brasil

[![Versão](https://img.shields.io/badge/Versão-2025.11.29-blue?style=for-the-badge)](https://github.com/Raphire/Win11Debloat)
[![Licença](https://img.shields.io/badge/Licença-MIT-green?style=for-the-badge)](./Win11Debloat/LICENSE)
[![Windows 11](https://img.shields.io/badge/Windows-11-0078D6?style=for-the-badge&logo=windows)](https://www.microsoft.com/windows/windows-11)
[![Windows 10](https://img.shields.io/badge/Windows-10-0078D6?style=for-the-badge&logo=windows)](https://www.microsoft.com/windows)

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Requisitos](#-requisitos)
- [Instalação](#-instalação)
- [Como Usar](#-como-usar)
- [Parâmetros Disponíveis](#-parâmetros-disponíveis)
- [Estrutura do Projeto](#-estrutura-do-projeto)
- [Reversão de Alterações](#-reversão-de-alterações)
- [FAQ](#-faq)
- [Créditos](#-créditos)

---

## 📖 Sobre o Projeto

**Win11Debloat** é um script PowerShell leve e fácil de usar que permite limpar e otimizar rapidamente sua experiência no Windows. Ele pode:

- Remover aplicativos bloatware pré-instalados
- Desativar telemetria e rastreamento
- Remover elementos intrusivos da interface
- Desativar recursos de IA indesejados
- E muito mais!

> ⚠️ **Aviso**: Este script foi desenvolvido com cuidado para não quebrar funcionalidades do sistema operacional, mas use por sua conta e risco!

---

## ✨ Funcionalidades

### 🗑️ Remoção de Aplicativos

| Funcionalidade | Descrição |
|----------------|-----------|
| Remover Bloatware | Remove uma ampla variedade de apps pré-instalados |
| Limpar Menu Iniciar | Remove ou substitui todos os apps fixados do menu iniciar |
| Apps de Terceiros | Remove apps como Netflix, Spotify, TikTok, etc. |
| Apps HP OEM | Remove software pré-instalado da HP |

### 🔒 Telemetria e Privacidade

| Funcionalidade | Descrição |
|----------------|-----------|
| Desativar Telemetria | Desativa coleta de dados de diagnóstico |
| Desativar Rastreamento | Desativa histórico de atividades e rastreamento de apps |
| Desativar Anúncios | Remove anúncios direcionados e sugestões |
| Desativar Spotlight | Desativa plano de fundo do Windows Spotlight |

### 🤖 IA e Copilot

| Funcionalidade | Descrição | Versão |
|----------------|-----------|--------|
| Desativar Copilot | Remove o Microsoft Copilot | W10/W11 |
| Desativar Recall | Desativa o Windows Recall | W11 |
| Desativar Click to Do | Desativa análise de texto/imagem por IA | W11 |
| Desativar IA no Edge | Remove recursos de IA do navegador | W11 |
| Desativar IA no Paint | Remove recursos de IA do Paint | W11 |
| Desativar IA no Notepad | Remove recursos de IA do Bloco de Notas | W11 |

### 🎨 Personalização

| Funcionalidade | Descrição | Versão |
|----------------|-----------|--------|
| Modo Escuro | Ativa o modo escuro para sistema e apps | W10/W11 |
| Menu Contexto Clássico | Restaura o menu de contexto do Windows 10 | W11 |
| Desativar Transparência | Remove efeitos de transparência | W10/W11 |
| Desativar Animações | Remove animações visuais | W10/W11 |
| Desativar Aceleração Mouse | Desativa "Aprimorar precisão do ponteiro" | W10/W11 |
| Desativar Sticky Keys | Desativa atalho das Teclas de Aderência | W11 |

### 📁 Explorador de Arquivos

| Funcionalidade | Descrição |
|----------------|-----------|
| Local Padrão | Altera onde o Explorador abre (Início, Este PC, Downloads, OneDrive) |
| Arquivos Ocultos | Mostra arquivos, pastas e unidades ocultas |
| Extensões de Arquivo | Mostra extensões para tipos conhecidos |
| Ocultar Início/Galeria | Oculta seções do painel de navegação (W11) |
| Ocultar Objetos 3D | Oculta pasta Objetos 3D (W10) |

### 📌 Barra de Tarefas

| Funcionalidade | Descrição | Versão |
|----------------|-----------|--------|
| Alinhar à Esquerda | Alinha ícones à esquerda | W11 |
| Combinar Botões | Configura agrupamento de janelas | W11 |
| Ocultar Pesquisa | Oculta ou altera ícone de pesquisa | W11 |
| Ocultar Visão de Tarefas | Remove botão de visão de tarefas | W11 |
| Desativar Widgets | Remove widgets da barra e tela de bloqueio | W10/W11 |
| Ocultar Chat | Remove ícone do chat/Meet Now | W10 |
| Encerrar Tarefa | Adiciona opção "Encerrar Tarefa" no menu | W11 |

### ⚡ Outros

| Funcionalidade | Descrição |
|----------------|-----------|
| Desativar Inicialização Rápida | Garante desligamento completo |
| Desativar Rede em Standby | Reduz consumo de bateria em Modern Standby |
| Desativar Xbox Game Bar | Remove gravação de tela e integração com controle |
| Modo Sysprep | Aplica alterações ao perfil padrão do Windows |

---

## 💻 Requisitos

- **Sistema Operacional**: Windows 10 ou Windows 11
- **PowerShell**: Versão 5.1 ou superior
- **Privilégios**: Administrador
- **WinGet**: Recomendado (versão 1.4+) para remoção de alguns apps

---

## 📥 Instalação

### Método Rápido (Recomendado)

1. Abra o **PowerShell** ou **Terminal** como Administrador
2. Execute o comando:

```powershell
& ([scriptblock]::Create((irm "https://debloat.raphi.re/")))
```

### Método Manual

1. Baixe a [última versão](https://github.com/Raphire/Win11Debloat/releases/latest)
2. Extraia o arquivo .ZIP
3. Execute `Executar.bat` (versão PT-BR) ou `Run.bat`

### Método Avançado

1. Baixe e extraia o projeto
2. Abra o PowerShell como Administrador
3. Execute:

```powershell
Set-ExecutionPolicy Unrestricted -Scope Process -Force
.\Win11Debloat.ps1
```

---

## 🚀 Como Usar

### Menu Principal

Ao executar o script, você verá o menu:

```
-------------------------------------------------------------------------------------------
 Win11Debloat Script - Menu
-------------------------------------------------------------------------------------------
(1) Modo Padrão: Aplica rapidamente as alterações recomendadas
(2) Modo Personalizado: Selecione manualmente as alterações
(3) Modo Remoção de Apps: Selecione e remova apps sem outras alterações
(4) Aplicar configurações salvas da última execução

(0) Mostrar mais informações
```

### Modos de Execução

| Modo | Descrição |
|------|-----------|
| **Padrão** | Aplica configurações recomendadas para a maioria dos usuários |
| **Personalizado** | Permite escolher cada opção individualmente |
| **Remoção de Apps** | Foca apenas na remoção de aplicativos |
| **Configurações Salvas** | Reaplica as últimas configurações usadas |

---

## ⚙️ Parâmetros Disponíveis

### Parâmetros Gerais

| Parâmetro | Descrição |
|-----------|-----------|
| `-Silent` | Executa sem interação do usuário |
| `-Sysprep` | Modo Sysprep para perfil padrão |
| `-User "nome"` | Aplica alterações a outro usuário |
| `-LogPath "caminho"` | Define local do arquivo de log |
| `-CreateRestorePoint` | Cria ponto de restauração antes de iniciar |

### Parâmetros de Execução Rápida

| Parâmetro | Descrição |
|-----------|-----------|
| `-RunDefaults` | Executa modo padrão com remoção de apps |
| `-RunDefaultsLite` | Executa modo padrão sem remover apps |
| `-RunSavedSettings` | Executa com configurações salvas |

### Parâmetros de Remoção de Apps

| Parâmetro | Descrição |
|-----------|-----------|
| `-RemoveApps` | Remove seleção padrão de apps |
| `-RemoveAppsCustom` | Remove apps da lista personalizada |
| `-RemoveGamingApps` | Remove apps relacionados a jogos |
| `-RemoveCommApps` | Remove Mail, Calendário e Pessoas |
| `-RemoveHPApps` | Remove apps OEM da HP |
| `-RemoveW11Outlook` | Remove novo Outlook para Windows |
| `-ForceRemoveEdge` | Força remoção do Microsoft Edge |

### Parâmetros de Privacidade

| Parâmetro | Descrição |
|-----------|-----------|
| `-DisableTelemetry` | Desativa telemetria e rastreamento |
| `-DisableBing` | Remove Bing da pesquisa do Windows |
| `-DisableCopilot` | Desativa Microsoft Copilot |
| `-DisableRecall` | Desativa Windows Recall |
| `-DisableClickToDo` | Desativa Click to Do |
| `-DisableSuggestions` | Desativa sugestões e dicas |
| `-DisableEdgeAds` | Desativa anúncios no Edge |
| `-DisableLockscreenTips` | Desativa dicas na tela de bloqueio |
| `-DisableDesktopSpotlight` | Desativa Spotlight na área de trabalho |

### Parâmetros de IA

| Parâmetro | Descrição |
|-----------|-----------|
| `-DisableEdgeAI` | Desativa IA no Edge |
| `-DisablePaintAI` | Desativa IA no Paint |
| `-DisableNotepadAI` | Desativa IA no Bloco de Notas |

### Parâmetros de Personalização

| Parâmetro | Descrição |
|-----------|-----------|
| `-EnableDarkMode` | Ativa modo escuro |
| `-DisableTransparency` | Desativa transparência |
| `-DisableAnimations` | Desativa animações |
| `-RevertContextMenu` | Restaura menu de contexto do W10 |
| `-DisableMouseAcceleration` | Desativa aceleração do mouse |
| `-DisableStickyKeys` | Desativa atalho Sticky Keys |

### Parâmetros da Barra de Tarefas

| Parâmetro | Descrição |
|-----------|-----------|
| `-TaskbarAlignLeft` | Alinha ícones à esquerda |
| `-HideSearchTb` | Oculta pesquisa |
| `-ShowSearchIconTb` | Mostra apenas ícone de pesquisa |
| `-ShowSearchBoxTb` | Mostra caixa de pesquisa |
| `-HideTaskview` | Oculta Visão de Tarefas |
| `-DisableWidgets` | Desativa widgets |
| `-HideChat` | Oculta chat |
| `-EnableEndTask` | Ativa "Encerrar Tarefa" |
| `-EnableLastActiveClick` | Ativa clique na última janela ativa |

### Parâmetros do Explorador

| Parâmetro | Descrição |
|-----------|-----------|
| `-ExplorerToHome` | Abre em Início |
| `-ExplorerToThisPC` | Abre em Este PC |
| `-ExplorerToDownloads` | Abre em Downloads |
| `-ExplorerToOneDrive` | Abre em OneDrive |
| `-ShowHiddenFolders` | Mostra arquivos ocultos |
| `-ShowKnownFileExt` | Mostra extensões de arquivo |
| `-HideHome` | Oculta seção Início |
| `-HideGallery` | Oculta seção Galeria |
| `-HideDupliDrive` | Oculta unidades duplicadas |

### Parâmetros do Menu Iniciar

| Parâmetro | Descrição |
|-----------|-----------|
| `-ClearStart` | Limpa apps fixados (usuário atual) |
| `-ClearStartAllUsers` | Limpa apps fixados (todos usuários) |
| `-DisableStartRecommended` | Desativa seção Recomendados |
| `-DisableStartPhoneLink` | Desativa Phone Link no menu |

### Parâmetros de Sistema

| Parâmetro | Descrição |
|-----------|-----------|
| `-DisableFastStartup` | Desativa Inicialização Rápida |
| `-DisableModernStandbyNetworking` | Desativa rede em Modern Standby |
| `-DisableDVR` | Desativa gravação Xbox |
| `-DisableGameBarIntegration` | Desativa integração Game Bar |

---

## 📂 Estrutura do Projeto

```
Win11Debloat/
├── Win11Debloat.ps1      # Script principal
├── Executar.bat          # Arquivo de execução (PT-BR)
├── Run.bat               # Arquivo de execução (EN)
├── Get.ps1               # Script de download automático
├── Appslist.txt          # Lista de apps para remoção
├── ListaApps.txt         # Lista de apps (PT-BR)
├── LICENSE               # Licença MIT
├── README.md             # Documentação original
├── Assets/
│   ├── Menus/            # Arquivos de menu
│   │   ├── DefaultSettings
│   │   ├── ConfiguracoesPadrao
│   │   ├── Info
│   │   └── Informacoes
│   └── Start/            # Templates do menu iniciar
├── Regfiles/             # Arquivos de registro
│   ├── *.reg             # Configurações do sistema
│   ├── Sysprep/          # Configurações para Sysprep
│   └── Undo/             # Arquivos para reverter alterações
└── docs/
    ├── README_PT-BR.md   # Esta documentação
    ├── FUNCIONALIDADES.md
    ├── PARAMETROS.md
    └── REVERSAO.md
```

---

## ↩️ Reversão de Alterações

### Usando Arquivos de Registro

Os arquivos na pasta `Regfiles/Undo/` podem reverter a maioria das alterações:

1. Navegue até `Regfiles/Undo/`
2. Clique duas vezes no arquivo `.reg` correspondente
3. Confirme a importação
4. Reinicie o computador

### Reinstalando Apps

A maioria dos apps removidos pode ser reinstalada pela Microsoft Store:

1. Abra a **Microsoft Store**
2. Pesquise pelo nome do app
3. Clique em **Instalar**

> ⚠️ **Exceções**: `Microsoft.WindowsStore` e `Microsoft.XboxSpeechToTextOverlay` não podem ser reinstalados facilmente!

### Usando Ponto de Restauração

Se você criou um ponto de restauração:

1. Pesquise por "Restauração do Sistema"
2. Selecione "Restaurar o computador a um ponto anterior"
3. Escolha o ponto criado pelo Win11Debloat
4. Siga as instruções

---

## ❓ FAQ

### O script é seguro?

Sim, o script foi desenvolvido com cuidado para não quebrar funcionalidades essenciais do Windows. Todas as alterações são feitas via registro do Windows e comandos PowerShell padrão.

### Posso reverter as alterações?

Sim! A maioria das alterações pode ser revertida usando os arquivos na pasta `Regfiles/Undo/` ou reinstalando apps pela Microsoft Store.

### Funciona no Windows 10?

Sim, mas algumas funcionalidades são exclusivas do Windows 11 (como desativar Recall, Click to Do, etc.).

### Preciso de internet?

Não para executar o script localmente. Apenas o método rápido de instalação requer internet.

### O script remove o Windows Defender?

Não. O script não altera configurações de segurança do Windows Defender.

---

## 👏 Créditos

### Projeto Original
- **Autor**: [Raphire](https://github.com/Raphire)
- **Repositório**: [Win11Debloat](https://github.com/Raphire/Win11Debloat)
- **Licença**: MIT

### Tradução e Documentação PT-BR
- **Autor**: [Arnaldo Lima](https://arnaldolima.com)
- **Data**: 29/11/2025 22:39 UTC-03:00

### Contribuidores
- loadstring1 & ave9858 (código de remoção forçada do Edge)
- [LazyAdmin](https://lazyadmin.nl) (código de substituição do menu iniciar)

---

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](../LICENSE) para detalhes.

```
MIT License

Copyright (c) 2020 Raphire (https://github.com/Raphire)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
```

---

<div align="center">

**⭐ Se este projeto foi útil, considere dar uma estrela no repositório original!**

[Repositório Original](https://github.com/Raphire/Win11Debloat) | [Reportar Bug](https://github.com/Raphire/Win11Debloat/issues) | [Sugerir Funcionalidade](https://github.com/Raphire/Win11Debloat/discussions)

</div>
