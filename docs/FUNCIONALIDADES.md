# Funcionalidades Detalhadas - Win11Debloat

> **Autor da Documentação**: [Arnaldo Lima](https://arnaldolima.com)  
> **Data**: 29/11/2025 22:39 UTC-03:00

---

## 📋 Índice

1. [Remoção de Aplicativos](#1-remoção-de-aplicativos)
2. [Telemetria e Privacidade](#2-telemetria-e-privacidade)
3. [Recursos de IA](#3-recursos-de-ia)
4. [Personalização Visual](#4-personalização-visual)
5. [Barra de Tarefas](#5-barra-de-tarefas)
6. [Menu Iniciar](#6-menu-iniciar)
7. [Explorador de Arquivos](#7-explorador-de-arquivos)
8. [Configurações de Sistema](#8-configurações-de-sistema)

---

## 1. Remoção de Aplicativos

### 1.1 Apps Removidos por Padrão

Os seguintes aplicativos são removidos quando você escolhe a seleção padrão:

#### Apps Microsoft

| App | ID do Pacote | Descrição |
|-----|--------------|-----------|
| Clipchamp | `Clipchamp.Clipchamp` | Editor de vídeo da Microsoft |
| 3D Builder | `Microsoft.3DBuilder` | Software básico de modelagem 3D |
| Cortana | `Microsoft.549981C3F5F10` | Assistente de voz (descontinuado) |
| Bing Finance | `Microsoft.BingFinance` | Notícias financeiras (descontinuado) |
| Bing Food | `Microsoft.BingFoodAndDrink` | Receitas (descontinuado) |
| Bing Health | `Microsoft.BingHealthAndFitness` | Saúde e fitness (descontinuado) |
| Bing News | `Microsoft.BingNews` | Agregador de notícias |
| Bing Sports | `Microsoft.BingSports` | Notícias esportivas (descontinuado) |
| Bing Translator | `Microsoft.BingTranslator` | Serviço de tradução |
| Bing Travel | `Microsoft.BingTravel` | Planejamento de viagens (descontinuado) |
| Bing Weather | `Microsoft.BingWeather` | Previsão do tempo |
| Copilot | `Microsoft.Copilot` | Assistente de IA |
| Dicas | `Microsoft.Getstarted` | Guia introdutório do Windows |
| Mensagens | `Microsoft.Messaging` | App de mensagens (depreciado) |
| 3D Viewer | `Microsoft.Microsoft3DViewer` | Visualizador de modelos 3D |
| Journal | `Microsoft.MicrosoftJournal` | App de anotações com caneta |
| Office Hub | `Microsoft.MicrosoftOfficeHub` | Hub do Microsoft Office |
| Power BI | `Microsoft.MicrosoftPowerBIForWindows` | Cliente de análise de negócios |
| Solitaire | `Microsoft.MicrosoftSolitaireCollection` | Coleção de jogos de paciência |
| Sticky Notes | `Microsoft.MicrosoftStickyNotes` | Notas adesivas (substituído pelo OneNote) |
| Mixed Reality | `Microsoft.MixedReality.Portal` | Portal de Realidade Mista |
| Speed Test | `Microsoft.NetworkSpeedTest` | Teste de velocidade de internet |
| News | `Microsoft.News` | Agregador de notícias |
| OneNote | `Microsoft.Office.OneNote` | App de anotações (versão UWP) |
| Sway | `Microsoft.Office.Sway` | App de apresentações |
| OneConnect | `Microsoft.OneConnect` | Gerenciamento de operadora móvel |
| Power Automate | `Microsoft.PowerAutomateDesktop` | Ferramenta de automação |
| Print 3D | `Microsoft.Print3D` | Preparação para impressão 3D |
| Skype | `Microsoft.SkypeApp` | App de comunicação Skype |
| To Do | `Microsoft.Todos` | Gerenciador de tarefas |
| Dev Home | `Microsoft.Windows.DevHome` | Utilitário para desenvolvedores |
| Alarmes | `Microsoft.WindowsAlarms` | App de Alarmes e Relógio |
| Feedback Hub | `Microsoft.WindowsFeedbackHub` | App de feedback para Microsoft |
| Mapas | `Microsoft.WindowsMaps` | App de mapas e navegação |
| Gravador de Voz | `Microsoft.WindowsSoundRecorder` | Gravador de áudio básico |
| Xbox App | `Microsoft.XboxApp` | App Xbox antigo |
| Filmes e TV | `Microsoft.ZuneVideo` | App de vídeos |
| Family Safety | `MicrosoftCorporationII.MicrosoftFamily` | App de segurança familiar |
| Quick Assist | `MicrosoftCorporationII.QuickAssist` | Ferramenta de assistência remota |
| Teams | `MicrosoftTeams` / `MSTeams` | Microsoft Teams |

#### Apps de Terceiros

| App | ID do Pacote |
|-----|--------------|
| Amazon | `Amazon.com.Amazon` |
| Prime Video | `AmazonVideo.PrimeVideo` |
| Adobe Photoshop Express | `AdobeSystemsIncorporated.AdobePhotoshopExpress` |
| Asphalt 8 | `Asphalt8Airborne` |
| Autodesk SketchBook | `AutodeskSketchBook` |
| Candy Crush Saga | `king.com.CandyCrushSaga` |
| Candy Crush Soda | `king.com.CandyCrushSodaSaga` |
| Disney+ | `Disney` |
| Duolingo | `Duolingo-LearnLanguagesforFree` |
| Facebook | `Facebook` |
| Fitbit | `fitbit` |
| Flipboard | `Flipboard` |
| Hulu | `HULULLC.HULUPLUS` |
| Instagram | `Instagram` |
| LinkedIn | `LinkedInforWindows` |
| Netflix | `Netflix` |
| Plex | `Plex` |
| Spotify | `Spotify` |
| TikTok | `TikTok` |
| Twitter/X | `Twitter` |
| Viber | `Viber` |
| WinZip | `WinZipUniversal` |

### 1.2 Apps NÃO Removidos por Padrão

Estes apps são mantidos a menos que você os selecione manualmente:

| App | Motivo |
|-----|--------|
| Microsoft Edge | Navegador padrão (só removível na EEA) |
| Microsoft Store | Essencial para instalação de apps |
| Fotos | Visualizador de imagens padrão |
| Calculadora | Utilitário essencial |
| Câmera | Necessário para webcam |
| Bloco de Notas | Editor de texto essencial |
| Terminal | Terminal padrão do Windows 11 |
| Phone Link | Integração com celular |
| Xbox Gaming | Necessário para alguns jogos |

### 1.3 Como Funciona a Remoção

O script usa dois métodos para remover apps:

1. **Remove-AppxPackage**: Para a maioria dos apps UWP
2. **WinGet**: Para OneDrive e Microsoft Edge

```powershell
# Exemplo de remoção via AppxPackage
Get-AppxPackage -Name "*Microsoft.BingWeather*" -AllUsers | Remove-AppxPackage -AllUsers

# Exemplo de remoção via WinGet
winget uninstall --accept-source-agreements --disable-interactivity --id Microsoft.OneDrive
```

---

## 2. Telemetria e Privacidade

### 2.1 O Que é Desativado

| Configuração | Chave de Registro | Valor |
|--------------|-------------------|-------|
| Telemetria | `HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\AllowTelemetry` | 0 |
| Histórico de Atividades | `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy\ActivityHistory` | 0 |
| Rastreamento de Apps | `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Start_TrackProgs` | 0 |
| Anúncios Direcionados | `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo\Enabled` | 0 |
| Dados de Diagnóstico | `HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack` | Desativado |

### 2.2 Sugestões e Anúncios Desativados

- Dicas no Menu Iniciar
- Sugestões de apps
- Anúncios na tela de bloqueio
- Sugestões no Explorador de Arquivos
- Notificações de "Concluir configuração"
- Anúncios no Microsoft Edge
- Feed MSN no Edge

### 2.3 Pesquisa Bing

O script remove completamente a integração do Bing com a pesquisa do Windows:

- Remove pesquisa web do menu iniciar
- Remove Bing AI da pesquisa
- Remove Cortana da pesquisa
- Remove o app `Microsoft.BingSearch`

---

## 3. Recursos de IA

### 3.1 Microsoft Copilot

**O que é desativado:**
- Ícone do Copilot na barra de tarefas
- Atalho de teclado Win+C
- Integração do Copilot com o sistema

**Chaves de registro afetadas:**
```
HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot\TurnOffWindowsCopilot = 1
HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot\TurnOffWindowsCopilot = 1
```

### 3.2 Windows Recall (W11 24H2+)

**O que é:**
Windows Recall é um recurso que tira screenshots periódicos da sua tela e usa IA para indexar o conteúdo.

**O que é desativado:**
- Captura automática de screenshots
- Indexação por IA do conteúdo da tela
- Histórico visual de atividades

### 3.3 Click to Do (W11 24H2+)

**O que é:**
Ferramenta de análise de texto e imagem por IA que sugere ações contextuais.

**O que é desativado:**
- Análise de texto por IA
- Análise de imagens por IA
- Sugestões de ações contextuais

### 3.4 IA em Apps Específicos

| App | O que é desativado |
|-----|-------------------|
| **Edge** | Copilot no navegador, sugestões de IA, composição de texto |
| **Paint** | Cocreator, geração de imagens por IA |
| **Notepad** | Reescrita por IA, sugestões de texto |

---

## 4. Personalização Visual

### 4.1 Modo Escuro

Ativa o tema escuro para:
- Interface do sistema (barra de tarefas, menu iniciar)
- Aplicativos que suportam modo escuro
- Explorador de Arquivos

### 4.2 Transparência

Desativa efeitos de transparência em:
- Barra de tarefas
- Menu Iniciar
- Central de Ações
- Janelas de apps

**Benefício:** Melhora performance em hardware mais antigo.

### 4.3 Animações

Desativa animações visuais:
- Animações de janelas (minimizar/maximizar)
- Efeitos de transição
- Animações do menu

**Benefício:** Interface mais responsiva.

### 4.4 Menu de Contexto Clássico (W11)

Restaura o menu de contexto do Windows 10:
- Mostra todas as opções diretamente
- Remove a opção "Mostrar mais opções"
- Acesso mais rápido a funções

### 4.5 Aceleração do Mouse

Desativa "Aprimorar precisão do ponteiro":
- Movimento do mouse mais previsível
- Recomendado para jogos
- Melhor para trabalho de precisão

---

## 5. Barra de Tarefas

### 5.1 Alinhamento de Ícones (W11)

Move os ícones da barra de tarefas para a esquerda, similar ao Windows 10.

### 5.2 Agrupamento de Janelas (W11)

| Opção | Comportamento |
|-------|---------------|
| **Sempre** | Sempre agrupa janelas do mesmo app |
| **Quando Cheia** | Agrupa apenas quando a barra está cheia |
| **Nunca** | Nunca agrupa, mostra todas as janelas separadas |

### 5.3 Ícone de Pesquisa (W11)

| Opção | Aparência |
|-------|-----------|
| **Ocultar** | Remove completamente |
| **Ícone** | Mostra apenas o ícone de lupa |
| **Ícone + Rótulo** | Mostra ícone com texto "Pesquisar" |
| **Caixa de Pesquisa** | Mostra caixa de texto completa |

### 5.4 Widgets

Desativa completamente o serviço de widgets:
- Remove ícone da barra de tarefas
- Remove widgets da tela de bloqueio
- Desativa o serviço em segundo plano

### 5.5 Encerrar Tarefa (W11 23H2+)

Adiciona opção "Encerrar Tarefa" ao clicar com botão direito em apps na barra de tarefas.

### 5.6 Last Active Click

Permite alternar entre janelas do mesmo app clicando repetidamente no ícone da barra de tarefas.

---

## 6. Menu Iniciar

### 6.1 Limpar Apps Fixados (W11)

Remove todos os apps fixados do menu iniciar:
- Pode ser aplicado apenas ao usuário atual
- Pode ser aplicado a todos os usuários
- Pode ser aplicado ao perfil padrão (novos usuários)

### 6.2 Seção Recomendados (W11)

Desativa a seção "Recomendados" que mostra:
- Arquivos recentes
- Apps sugeridos
- Documentos abertos recentemente

### 6.3 Phone Link no Menu (W11)

Remove a integração do Phone Link (Vincular ao Telefone) do menu iniciar.

---

## 7. Explorador de Arquivos

### 7.1 Local Padrão de Abertura

| Opção | Abre em |
|-------|---------|
| **Início** | Página inicial com acesso rápido |
| **Este PC** | Lista de unidades e pastas principais |
| **Downloads** | Pasta de downloads do usuário |
| **OneDrive** | Pasta do OneDrive |

### 7.2 Arquivos Ocultos

Mostra:
- Arquivos ocultos
- Pastas ocultas
- Unidades ocultas
- Arquivos protegidos do sistema (opcional)

### 7.3 Extensões de Arquivo

Mostra extensões para tipos de arquivo conhecidos:
- `.txt`, `.docx`, `.pdf`, etc.
- Ajuda a identificar arquivos maliciosos
- Facilita renomeação de extensões

### 7.4 Painel de Navegação

**Windows 11:**
- Ocultar seção "Início"
- Ocultar seção "Galeria"
- Ocultar unidades duplicadas

**Windows 10:**
- Ocultar pasta "Objetos 3D"
- Ocultar pasta "Música"
- Ocultar pasta "OneDrive"

### 7.5 Menu de Contexto (W10)

Oculta opções do menu de contexto:
- "Incluir na biblioteca"
- "Conceder acesso a"
- "Compartilhar"

---

## 8. Configurações de Sistema

### 8.1 Inicialização Rápida

**O que é:**
Fast Startup é um modo híbrido que salva o estado do kernel para acelerar a inicialização.

**Por que desativar:**
- Garante desligamento completo
- Evita problemas com dual-boot
- Resolve alguns problemas de drivers
- Permite atualizações completas do sistema

### 8.2 Modern Standby Networking (W11)

**O que é:**
Mantém conexão de rede durante o modo de espera moderno (S0).

**Por que desativar:**
- Reduz consumo de bateria
- Evita downloads em segundo plano
- Melhora vida útil da bateria em laptops

### 8.3 Xbox Game Bar

**O que é desativado:**
- Gravação de tela/jogo (DVR)
- Integração com controle Xbox
- Popups de "msgaming overlay"
- Atalho Win+G

**Nota:** Alguns jogos podem exigir esses recursos.

### 8.4 Modo Sysprep

Aplica alterações ao perfil de usuário padrão do Windows:
- Novos usuários herdam as configurações
- Útil para administradores de sistema
- Ideal para preparação de imagens do Windows

---

## 📊 Resumo de Impacto

| Categoria | Impacto na Performance | Impacto na Privacidade | Reversível |
|-----------|------------------------|------------------------|------------|
| Remoção de Apps | ⭐⭐⭐ Alto | ⭐⭐ Médio | ✅ Sim |
| Telemetria | ⭐ Baixo | ⭐⭐⭐ Alto | ✅ Sim |
| Recursos de IA | ⭐⭐ Médio | ⭐⭐⭐ Alto | ✅ Sim |
| Personalização | ⭐⭐ Médio | ⭐ Baixo | ✅ Sim |
| Barra de Tarefas | ⭐ Baixo | ⭐ Baixo | ✅ Sim |
| Explorador | ⭐ Baixo | ⭐ Baixo | ✅ Sim |
| Sistema | ⭐⭐ Médio | ⭐ Baixo | ✅ Sim |

---

<div align="center">

**Documentação criada por [Arnaldo Lima](https://arnaldolima.com)**

</div>
