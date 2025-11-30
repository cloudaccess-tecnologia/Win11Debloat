# Guia de Reversão - Win11Debloat

> **Autor da Documentação**: [Arnaldo Lima](https://arnaldolima.com)  
> **Data**: 29/11/2025 22:39 UTC-03:00

---

## 📋 Índice

1. [Visão Geral](#1-visão-geral)
2. [Reversão via Arquivos de Registro](#2-reversão-via-arquivos-de-registro)
3. [Reinstalação de Aplicativos](#3-reinstalação-de-aplicativos)
4. [Ponto de Restauração do Sistema](#4-ponto-de-restauração-do-sistema)
5. [Reversão Manual](#5-reversão-manual)
6. [Problemas Conhecidos](#6-problemas-conhecidos)

---

## 1. Visão Geral

O Win11Debloat foi projetado para permitir reversão da maioria das alterações. Existem três métodos principais:

| Método | Facilidade | Abrangência | Recomendado Para |
|--------|------------|-------------|------------------|
| Arquivos .reg | ⭐⭐⭐ Fácil | Parcial | Alterações específicas |
| Reinstalar Apps | ⭐⭐ Médio | Apps apenas | Aplicativos removidos |
| Ponto de Restauração | ⭐ Complexo | Total | Reversão completa |

---

## 2. Reversão via Arquivos de Registro

### 2.1 Localização dos Arquivos

Os arquivos de reversão estão em:
```
Win11Debloat/Regfiles/Undo/
```

### 2.2 Lista de Arquivos de Reversão

| Arquivo | Reverte |
|---------|---------|
| `Enable_Telemetry.reg` | Telemetria e diagnóstico |
| `Enable_Suggestions.reg` | Sugestões e dicas |
| `Enable_Bing_Search.reg` | Pesquisa Bing |
| `Enable_Copilot.reg` | Microsoft Copilot |
| `Enable_Recall.reg` | Windows Recall |
| `Enable_ClickToDo.reg` | Click to Do |
| `Enable_Edge_AI.reg` | IA no Edge |
| `Enable_Paint_AI.reg` | IA no Paint |
| `Enable_Notepad_AI.reg` | IA no Bloco de Notas |
| `Disable_Dark_Mode.reg` | Modo escuro |
| `Enable_Transparency.reg` | Transparência |
| `Enable_Animations.reg` | Animações |
| `Restore_Context_Menu.reg` | Menu de contexto W11 |
| `Enable_Mouse_Acceleration.reg` | Aceleração do mouse |
| `Enable_Sticky_Keys.reg` | Teclas de Aderência |
| `Enable_Fast_Startup.reg` | Inicialização Rápida |
| `Enable_Modern_Standby_Networking.reg` | Rede em Modern Standby |
| `Enable_Widgets.reg` | Widgets |
| `Enable_DVR.reg` | Gravação Xbox |
| `Enable_Game_Bar.reg` | Game Bar |
| `Align_Taskbar_Center.reg` | Alinhamento central da barra |
| `Show_Taskview.reg` | Botão Visão de Tarefas |
| `Show_Chat.reg` | Ícone de Chat |
| `Disable_End_Task.reg` | Opção Encerrar Tarefa |
| `Disable_Last_Active_Click.reg` | Último Clique Ativo |
| `Explorer_Open_Home.reg` | Explorador abre em Início |
| `Hide_Hidden_Folders.reg` | Ocultar arquivos ocultos |
| `Hide_File_Extensions.reg` | Ocultar extensões |
| `Show_Home.reg` | Seção Início |
| `Show_Gallery.reg` | Seção Galeria |
| `Show_DupliDrive.reg` | Unidades duplicadas |
| `Show_OneDrive.reg` | Pasta OneDrive |
| `Show_3DObjects.reg` | Pasta Objetos 3D |
| `Show_Music.reg` | Pasta Música |
| `Show_IncludeInLibrary.reg` | Incluir na biblioteca |
| `Show_GiveAccessTo.reg` | Conceder acesso a |
| `Show_Share.reg` | Compartilhar |
| `Enable_Start_Recommended.reg` | Seção Recomendados |
| `Enable_PhoneLink.reg` | Phone Link no menu |
| `Enable_Spotlight.reg` | Windows Spotlight |
| `Enable_Edge_Ads.reg` | Anúncios no Edge |
| `Enable_Lockscreen_Tips.reg` | Dicas na tela de bloqueio |

### 2.3 Como Aplicar

1. Navegue até `Regfiles/Undo/`
2. Clique duas vezes no arquivo `.reg` desejado
3. Clique em **Sim** quando perguntado se deseja adicionar ao registro
4. Reinicie o computador para aplicar todas as alterações

### 2.4 Aplicar Múltiplos Arquivos

Para aplicar vários arquivos de uma vez via PowerShell:

```powershell
# Navegar até a pasta Undo
cd "C:\Caminho\Para\Win11Debloat\Regfiles\Undo"

# Aplicar todos os arquivos de reversão
Get-ChildItem -Filter "*.reg" | ForEach-Object {
    Write-Host "Aplicando $($_.Name)..."
    reg import $_.FullName
}

# Reiniciar Explorer
Stop-Process -Name explorer -Force
Start-Process explorer
```

---

## 3. Reinstalação de Aplicativos

### 3.1 Via Microsoft Store

A maioria dos apps pode ser reinstalada pela Microsoft Store:

1. Abra a **Microsoft Store**
2. Pesquise pelo nome do app
3. Clique em **Instalar** ou **Obter**

### 3.2 Via PowerShell

Para reinstalar apps específicos:

```powershell
# Reinstalar Calculadora
Get-AppxPackage -AllUsers Microsoft.WindowsCalculator | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# Reinstalar Fotos
Get-AppxPackage -AllUsers Microsoft.Windows.Photos | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# Reinstalar todos os apps padrão
Get-AppxPackage -AllUsers | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" -ErrorAction SilentlyContinue}
```

### 3.3 Via WinGet

```powershell
# Reinstalar Microsoft Teams
winget install --id Microsoft.Teams

# Reinstalar OneDrive
winget install --id Microsoft.OneDrive

# Reinstalar Spotify
winget install --id Spotify.Spotify
```

### 3.4 Apps que NÃO Podem Ser Reinstalados Facilmente

| App | Motivo |
|-----|--------|
| `Microsoft.WindowsStore` | Requer reset do Windows ou comandos especiais |
| `Microsoft.XboxSpeechToTextOverlay` | Componente do sistema |

Para reinstalar a Microsoft Store:

```powershell
# Método 1: Via PowerShell (requer internet)
wsreset -i

# Método 2: Via DISM
DISM /Online /Add-ProvisionedAppxPackage /PackagePath:Microsoft.WindowsStore.appxbundle /LicensePath:License.xml
```

---

## 4. Ponto de Restauração do Sistema

### 4.1 Verificar Pontos Existentes

1. Pressione `Win + R`
2. Digite `rstrui.exe` e pressione Enter
3. Veja a lista de pontos de restauração disponíveis

### 4.2 Restaurar Sistema

1. Abra **Configurações** > **Sistema** > **Recuperação**
2. Clique em **Abrir Restauração do Sistema**
3. Selecione **Escolher um ponto de restauração diferente**
4. Escolha o ponto criado pelo Win11Debloat (descrição: "Win11Debloat")
5. Clique em **Avançar** e depois **Concluir**
6. Aguarde a restauração (pode levar 15-30 minutos)

### 4.3 Via Linha de Comando

```powershell
# Listar pontos de restauração
Get-ComputerRestorePoint

# Restaurar para um ponto específico (substitua o número)
Restore-Computer -RestorePoint 1 -Confirm:$false
```

---

## 5. Reversão Manual

### 5.1 Telemetria

```powershell
# Reativar telemetria
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 3
Set-Service -Name "DiagTrack" -StartupType Automatic
Start-Service -Name "DiagTrack"
```

### 5.2 Copilot

```powershell
# Reativar Copilot
Remove-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -ErrorAction SilentlyContinue
Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -ErrorAction SilentlyContinue
```

### 5.3 Menu de Contexto (W11)

```powershell
# Restaurar menu de contexto moderno do Windows 11
Remove-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" -Recurse -ErrorAction SilentlyContinue
Stop-Process -Name explorer -Force
Start-Process explorer
```

### 5.4 Barra de Tarefas

```powershell
# Centralizar ícones da barra de tarefas
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 1

# Mostrar Visão de Tarefas
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 1

# Mostrar Widgets
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 1
```

### 5.5 Explorador de Arquivos

```powershell
# Ocultar arquivos ocultos
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 2

# Ocultar extensões de arquivo
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 1

# Abrir em Início
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1
```

### 5.6 Menu Iniciar

Para restaurar os apps fixados do menu iniciar:

1. Faça backup do arquivo atual:
   ```
   %LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin
   ```

2. Restaure o backup anterior (se existir):
   ```
   %LOCALAPPDATA%\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin.bak
   ```

---

## 6. Problemas Conhecidos

### 6.1 Microsoft Edge Não Reinstala

Se você usou `ForceRemoveEdge`, o Edge pode não reinstalar normalmente:

1. Baixe o instalador do Edge em [microsoft.com/edge](https://www.microsoft.com/edge)
2. Execute o instalador como Administrador
3. Se falhar, use o comando:
   ```powershell
   winget install --id Microsoft.Edge --force
   ```

### 6.2 Menu Iniciar Não Restaura

Se o menu iniciar não restaurar corretamente:

1. Delete o arquivo `start2.bin`
2. Reinicie o computador
3. O Windows criará um novo arquivo padrão

### 6.3 Configurações Não Aplicam

Algumas configurações requerem reinicialização completa:

- Aceleração do mouse
- Teclas de Aderência
- Animações
- Inicialização Rápida

### 6.4 Apps Não Aparecem na Store

Alguns apps podem não aparecer na Microsoft Store se foram removidos do provisionamento:

```powershell
# Verificar apps provisionados
Get-AppxProvisionedPackage -Online | Select-Object DisplayName

# Restaurar provisionamento (requer imagem do Windows)
Add-AppxProvisionedPackage -Online -PackagePath "caminho\para\app.appx" -LicensePath "caminho\para\license.xml"
```

---

## 📊 Resumo de Reversibilidade

| Alteração | Reversível | Método |
|-----------|------------|--------|
| Telemetria | ✅ Sim | Arquivo .reg |
| Sugestões | ✅ Sim | Arquivo .reg |
| Copilot | ✅ Sim | Arquivo .reg |
| Recall | ✅ Sim | Arquivo .reg |
| Apps UWP | ✅ Sim | Microsoft Store |
| OneDrive | ✅ Sim | WinGet |
| Edge (normal) | ✅ Sim | WinGet |
| Edge (forçado) | ⚠️ Parcial | Instalador manual |
| Microsoft Store | ⚠️ Difícil | wsreset -i |
| Menu Iniciar | ✅ Sim | Backup/Delete |
| Barra de Tarefas | ✅ Sim | Arquivo .reg |
| Explorador | ✅ Sim | Arquivo .reg |

---

<div align="center">

**Documentação criada por [Arnaldo Lima](https://arnaldolima.com)**

</div>
