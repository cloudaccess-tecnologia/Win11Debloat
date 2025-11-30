# Análise Técnica Detalhada - Win11Debloat

> **Autor da Documentação**: [Arnaldo Lima](https://arnaldolima.com)  
> **Data**: 29/11/2025 22:39 UTC-03:00

---

## 📋 Índice

1. [Visão Geral da Arquitetura](#1-visão-geral-da-arquitetura)
2. [Fluxo de Execução](#2-fluxo-de-execução)
3. [Funções Principais](#3-funções-principais)
4. [Sistema de Parâmetros](#4-sistema-de-parâmetros)
5. [Manipulação de Registro](#5-manipulação-de-registro)
6. [Remoção de Aplicativos](#6-remoção-de-aplicativos)
7. [Interface do Usuário](#7-interface-do-usuário)
8. [Tratamento de Erros](#8-tratamento-de-erros)
9. [Compatibilidade](#9-compatibilidade)
10. [Segurança](#10-segurança)

---

## 1. Visão Geral da Arquitetura

### 1.1 Estrutura do Script Principal

O `Win11Debloat.ps1` possui **2092 linhas** organizadas em:

```
┌─────────────────────────────────────────────────────────────┐
│  SEÇÃO 1: Declaração de Parâmetros (linhas 1-77)            │
├─────────────────────────────────────────────────────────────┤
│  SEÇÃO 2: Funções Auxiliares (linhas 78-947)                │
│  ├── ShowAppSelectionForm (95-342)                          │
│  ├── ReadAppslistFromFile (346-368)                         │
│  ├── RemoveApps (372-474)                                   │
│  ├── ForceRemoveEdge (478-533)                              │
│  ├── Strip-Progress (537-558)                               │
│  ├── CheckModernStandbySupport (562-587)                    │
│  ├── GetUserDirectory (591-619)                             │
│  ├── RegImport (623-651)                                    │
│  ├── RestartExplorer (655-682)                              │
│  ├── ReplaceStartMenuForAllUsers (687-723)                  │
│  ├── ReplaceStartMenu (728-766)                             │
│  ├── AddParameter (770-800)                                 │
│  ├── PrintHeader (803-821)                                  │
│  ├── PrintFromFile (824-841)                                │
│  ├── PrintAppsList (844-861)                                │
│  ├── AwaitKeyToExit (864-874)                               │
│  ├── GetUserName (877-883)                                  │
│  ├── CreateSystemRestorePoint (886-946)                     │
│  └── DisplayCustomModeOptions (949-1427)                    │
├─────────────────────────────────────────────────────────────┤
│  SEÇÃO 3: Inicialização (linhas 1431-1505)                  │
├─────────────────────────────────────────────────────────────┤
│  SEÇÃO 4: Menu e Seleção de Modo (linhas 1507-1745)         │
├─────────────────────────────────────────────────────────────┤
│  SEÇÃO 5: Execução de Parâmetros (linhas 1746-2092)         │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 Dependências

| Componente | Versão Mínima | Obrigatório |
|------------|---------------|-------------|
| PowerShell | 5.1 | ✅ Sim |
| Windows | 10 (build 18362+) | ✅ Sim |
| WinGet | 1.4+ | ❌ Não (recomendado) |
| .NET Framework | 4.5+ | ✅ Sim |

### 1.3 Arquivos de Suporte

```
Regfiles/
├── 45 arquivos .reg (configurações principais)
├── Sysprep/
│   └── 56 arquivos .reg (configurações para perfil padrão)
└── Undo/
    └── 45 arquivos .reg (reversão de alterações)
```

---

## 2. Fluxo de Execução

### 2.1 Diagrama de Fluxo Principal

```
┌──────────────────┐
│     INÍCIO       │
└────────┬─────────┘
         ▼
┌──────────────────┐
│ Verificar Admin  │──No──► Erro e Sair
└────────┬─────────┘
         │ Yes
         ▼
┌──────────────────┐
│ Verificar WinGet │
└────────┬─────────┘
         ▼
┌──────────────────┐
│ Verificar Versão │
│    do Windows    │
└────────┬─────────┘
         ▼
┌──────────────────┐
│ Processar Params │
│   de Linha Cmd   │
└────────┬─────────┘
         ▼
    ┌────┴────┐
    │ Params? │
    └────┬────┘
    No   │   Yes
    ▼    │    ▼
┌────────┐   ┌────────────┐
│ Menu   │   │ Executar   │
│Interativo│  │ Direto     │
└────┬───┘   └─────┬──────┘
     │             │
     └──────┬──────┘
            ▼
┌──────────────────┐
│ Executar Ações   │
│ (switch $Params) │
└────────┬─────────┘
         ▼
┌──────────────────┐
│ Reiniciar        │
│ Explorer         │
└────────┬─────────┘
         ▼
┌──────────────────┐
│      FIM         │
└──────────────────┘
```

### 2.2 Modos de Execução

| Modo | Trigger | Comportamento |
|------|---------|---------------|
| **Interativo** | Sem parâmetros | Mostra menu, aguarda input |
| **Padrão** | `-RunDefaults` | Executa configurações padrão |
| **Padrão Lite** | `-RunDefaultsLite` | Padrão sem remover apps |
| **Salvo** | `-RunSavedSettings` | Usa configurações anteriores |
| **Silencioso** | `-Silent` | Sem prompts de confirmação |
| **Sysprep** | `-Sysprep` | Aplica ao perfil padrão |

---

## 3. Funções Principais

### 3.1 ShowAppSelectionForm

**Propósito:** Exibe formulário Windows Forms para seleção de apps.

```powershell
function ShowAppSelectionForm {
    # Carrega assemblies do Windows Forms
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms")
    [reflection.assembly]::loadwithpartialname("System.Drawing")
    
    # Cria formulário com:
    # - CheckedListBox para lista de apps
    # - Checkbox "Mostrar apenas instalados"
    # - Checkbox "Marcar/Desmarcar todos"
    # - Botões Confirmar/Cancelar
}
```

**Características:**
- Suporta seleção múltipla com Shift+Click
- Filtra apps instalados via WinGet
- Salva seleção em `CustomAppsList`
- Ordena lista alfabeticamente

### 3.2 RemoveApps

**Propósito:** Remove aplicativos do sistema.

```powershell
function RemoveApps {
    param ($appslist)
    
    Foreach ($app in $appsList) {
        if ($app -eq "Microsoft.OneDrive" -or $app -eq "Microsoft.Edge") {
            # Usa WinGet para OneDrive e Edge
            winget uninstall --id $app
        }
        else {
            # Usa Remove-AppxPackage para outros apps
            Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
            
            # Remove também do provisionamento (novos usuários)
            Get-AppxProvisionedPackage -Online | 
                Where-Object { $_.PackageName -like $app } | 
                Remove-ProvisionedAppxPackage -Online -AllUsers
        }
    }
}
```

**Diferenças por versão:**
- **Windows 11 (22000+):** Usa `-AllUsers` diretamente
- **Windows 10:** Remove primeiro do usuário atual, depois de todos

### 3.3 RegImport

**Propósito:** Importa arquivos de registro com suporte a Sysprep.

```powershell
function RegImport {
    param ($message, $path)
    
    if ($Sysprep) {
        # Carrega hive do usuário padrão
        reg load "HKU\Default" "$defaultUserPath\NTUSER.DAT"
        reg import "$PSScriptRoot\Regfiles\Sysprep\$path"
        reg unload "HKU\Default"
    }
    elseif ($User) {
        # Carrega hive do usuário especificado
        reg load "HKU\Default" "$userPath\NTUSER.DAT"
        reg import "$PSScriptRoot\Regfiles\Sysprep\$path"
        reg unload "HKU\Default"
    }
    else {
        # Importa diretamente
        reg import "$PSScriptRoot\Regfiles\$path"
    }
}
```

### 3.4 ForceRemoveEdge

**Propósito:** Remove Microsoft Edge forçadamente.

```powershell
function ForceRemoveEdge {
    # 1. Permite desinstalação via registro
    $hklm.CreateSubKey('SOFTWARE\Microsoft\EdgeUpdateDev').SetValue('AllowUninstall', '')
    
    # 2. Cria stub para permitir desinstalação
    New-Item "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
    
    # 3. Executa desinstalador
    $uninstallString = $uninstallRegKey.GetValue('UninstallString') + ' --force-uninstall'
    Start-Process cmd.exe "/c $uninstallString"
    
    # 4. Remove atalhos e entradas de registro restantes
}
```

**⚠️ Aviso:** Só funciona na Área Econômica Europeia (EEA) devido a regulamentações.

### 3.5 CreateSystemRestorePoint

**Propósito:** Cria ponto de restauração do sistema.

```powershell
function CreateSystemRestorePoint {
    # Verifica se restauração está habilitada
    $SysRestore = Get-ItemProperty -Path "HKLM:\...\SystemRestore" -Name "RPSessionInterval"
    
    if ($SysRestore.RPSessionInterval -eq 0) {
        # Habilita restauração do sistema
        Enable-ComputerRestore -Drive "$env:SystemDrive"
    }
    
    # Verifica se já existe ponto recente (24h)
    $recentRestorePoints = Get-ComputerRestorePoint | 
        Where-Object { (Get-Date) - $_.CreationTime -le 24h }
    
    if ($recentRestorePoints.Count -eq 0) {
        Checkpoint-Computer -Description "Win11Debloat" -RestorePointType "MODIFY_SETTINGS"
    }
}
```

### 3.6 ReplaceStartMenu

**Propósito:** Substitui o menu iniciar do Windows 11.

```powershell
function ReplaceStartMenu {
    param (
        $startMenuTemplate = "$PSScriptRoot/Assets/Start/start2.bin",
        $startMenuBinFile = "$env:LOCALAPPDATA\...\start2.bin"
    )
    
    # Faz backup do arquivo atual
    Move-Item -Path $startMenuBinFile -Destination "$startMenuBinFile.bak"
    
    # Copia template (menu vazio)
    Copy-Item -Path $startMenuTemplate -Destination $startMenuBinFile
}
```

---

## 4. Sistema de Parâmetros

### 4.1 Declaração de Parâmetros

O script usa `CmdletBinding` com 76+ parâmetros:

```powershell
[CmdletBinding(SupportsShouldProcess)]
param (
    # Parâmetros de controle
    [switch]$Silent,
    [switch]$Sysprep,
    [string]$LogPath,
    [string]$User,
    [switch]$CreateRestorePoint,
    
    # Parâmetros de execução
    [switch]$RunDefaults,
    [switch]$RunDefaultsLite,
    [switch]$RunSavedSettings,
    
    # Parâmetros de remoção de apps
    [switch]$RemoveApps,
    [switch]$RemoveAppsCustom,
    # ... mais 60+ parâmetros
)
```

### 4.2 Processamento de Parâmetros

```powershell
$script:Params = $PSBoundParameters

# Parâmetros especiais (não contam como seleções)
$SPParams = 'WhatIf', 'Confirm', 'Verbose', 'Silent', 'Sysprep', 'Debug', 'User', 'CreateRestorePoint', 'LogPath'

# Conta parâmetros especiais
foreach ($Param in $SPParams) {
    if ($script:Params.ContainsKey($Param)) {
        $SPParamCount++
    }
}

# Se apenas parâmetros especiais, mostra menu
if ($SPParamCount -eq $script:Params.Count) {
    # Modo interativo
}
```

### 4.3 Aliases de Parâmetros

Alguns parâmetros têm aliases para compatibilidade:

| Parâmetro Principal | Alias |
|---------------------|-------|
| `DisableBingSearches` | `DisableBing` |
| `DisableLockscrTips` | `DisableLockscreenTips` |
| `DisableWindowsSuggestions` | `DisableSuggestions` |
| `HideWidgets` | `DisableWidgets` |
| `HideChat` | `DisableChat` |

---

## 5. Manipulação de Registro

### 5.1 Estrutura dos Arquivos .reg

```reg
Windows Registry Editor Version 5.00

; Comentário explicativo
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\...]
"NomeValor"=dword:00000000
"OutroValor"="string"
```

### 5.2 Categorias de Alterações

| Categoria | Hive | Escopo |
|-----------|------|--------|
| Telemetria | HKLM | Sistema |
| Sugestões | HKCU | Usuário |
| Barra de Tarefas | HKCU | Usuário |
| Explorador | HKCU | Usuário |
| Políticas | HKLM\SOFTWARE\Policies | Sistema |

### 5.3 Arquivos Sysprep

Os arquivos em `Regfiles/Sysprep/` usam `HKU\Default` em vez de `HKCU`:

```reg
; Arquivo normal (HKCU)
[HKEY_CURRENT_USER\Software\Microsoft\Windows\...]

; Arquivo Sysprep (HKU\Default)
[HKU\Default\Software\Microsoft\Windows\...]
```

---

## 6. Remoção de Aplicativos

### 6.1 Métodos de Remoção

```
┌─────────────────────────────────────────────────────────────┐
│                    REMOÇÃO DE APPS                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │   WinGet    │    │ AppxPackage │    │ Provisioned │     │
│  │             │    │             │    │   Package   │     │
│  └──────┬──────┘    └──────┬──────┘    └──────┬──────┘     │
│         │                  │                  │             │
│         ▼                  ▼                  ▼             │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐     │
│  │  OneDrive   │    │ Apps UWP    │    │ Novos       │     │
│  │  Edge       │    │ (maioria)   │    │ Usuários    │     │
│  └─────────────┘    └─────────────┘    └─────────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 6.2 Verificação de WinGet

```powershell
# Verifica se WinGet está instalado e é versão 1.4+
if ((Get-AppxPackage -Name "*Microsoft.DesktopAppInstaller*") -and 
    ([int](((winget -v) -replace 'v','').split('.')[0..1] -join '') -gt 14)) {
    $script:wingetInstalled = $true
}
```

### 6.3 Lista de Apps (Appslist.txt)

Formato do arquivo:

```
# Comentário de seção
AppName                    # Comentário do app (será removido)
#AppName                   # App comentado (não será removido por padrão)
```

---

## 7. Interface do Usuário

### 7.1 Cores do Console

| Cor | Uso |
|-----|-----|
| Amarelo | Opções de menu, avisos |
| Vermelho | Erros |
| Cinza Escuro | Informações secundárias |
| Padrão | Texto normal |

### 7.2 Formulário de Seleção de Apps

```
┌────────────────────────────────────────────────────────────┐
│  Win11Debloat Application Selection                    [X] │
├────────────────────────────────────────────────────────────┤
│  Check apps that you wish to remove, uncheck apps to keep  │
│  ☐ Check/Uncheck all                                       │
│  ┌──────────────────────────────────────────────────────┐  │
│  │ ☑ Clipchamp.Clipchamp                                │  │
│  │ ☑ Microsoft.BingWeather                              │  │
│  │ ☑ Microsoft.Copilot                                  │  │
│  │ ☐ Microsoft.WindowsStore                             │  │
│  │ ...                                                  │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                            │
│  [Confirm]  [Cancel]           ☐ Only show installed apps  │
└────────────────────────────────────────────────────────────┘
```

---

## 8. Tratamento de Erros

### 8.1 Verificações de Segurança

```powershell
# Verifica modo de linguagem do PowerShell
if ($ExecutionContext.SessionState.LanguageMode -ne "FullLanguage") {
    Write-Host "Error: PowerShell execution is restricted" -ForegroundColor Red
    AwaitKeyToExit
}

# Verifica privilégios de administrador
#Requires -RunAsAdministrator
```

### 8.2 Try-Catch em Operações Críticas

```powershell
try {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers
}
catch {
    Write-Host "Unable to remove $app" -ForegroundColor Yellow
    Write-Host $_.Exception.StackTrace -ForegroundColor Gray
}
```

### 8.3 Timeouts

```powershell
# Timeout para operações WinGet
$job = Start-Job { return winget list }
$jobDone = $job | Wait-Job -TimeOut 10

if (-not $jobDone) {
    Write-Host "Operation timed out" -ForegroundColor Red
}
```

---

## 9. Compatibilidade

### 9.1 Detecção de Versão do Windows

```powershell
$WinVersion = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentBuild

# Windows 10: < 22000
# Windows 11 21H2: 22000
# Windows 11 22H2: 22621
# Windows 11 23H2: 22631
# Windows 11 24H2: 26100
```

### 9.2 Funcionalidades por Versão

| Build | Funcionalidades Disponíveis |
|-------|----------------------------|
| < 22000 | Funcionalidades básicas (W10) |
| 22000+ | Menu contexto, alinhamento taskbar |
| 22621+ | Opções de IA, menu iniciar |
| 22631+ | End Task na taskbar |
| 26100+ | Sticky Keys, Recall, Click to Do |

### 9.3 Verificação de Modern Standby

```powershell
function CheckModernStandbySupport {
    switch -Regex (powercfg /a) {
        '(.*S0.{1,}\))' {
            return $true  # Suporta Modern Standby
        }
    }
    return $false
}
```

---

## 10. Segurança

### 10.1 Requisitos de Execução

- **Administrador:** Obrigatório para modificar registro e remover apps
- **Política de Execução:** Bypass temporário recomendado
- **Modo de Linguagem:** FullLanguage obrigatório

### 10.2 Logging

```powershell
# Inicia transcript para log
Start-Transcript -Path "$PSScriptRoot/Win11Debloat.log" -Append -IncludeInvocationHeader

# Ou em caminho personalizado
Start-Transcript -Path "$LogPath/Win11Debloat.log"
```

### 10.3 Backup Automático

- **Menu Iniciar:** Backup em `start2.bin.bak`
- **Ponto de Restauração:** Criado antes das alterações (opcional)
- **Configurações Salvas:** Armazenadas em `SavedSettings`

### 10.4 Limitações de Segurança

| Ação | Permitido | Motivo |
|------|-----------|--------|
| Remover Windows Defender | ❌ Não | Segurança do sistema |
| Desativar Windows Update | ❌ Não | Segurança do sistema |
| Remover Microsoft Store | ⚠️ Com aviso | Difícil reinstalar |
| Remover Edge | ⚠️ Apenas EEA | Regulamentação |

---

## 📊 Métricas do Código

| Métrica | Valor |
|---------|-------|
| Total de Linhas | 2092 |
| Funções | 19 |
| Parâmetros | 76+ |
| Arquivos .reg | 161 |
| Complexidade Ciclomática | Média |

---

<div align="center">

**Análise técnica por [Arnaldo Lima](https://arnaldolima.com)**

</div>
