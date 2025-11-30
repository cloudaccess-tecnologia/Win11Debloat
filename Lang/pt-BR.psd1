# ============================================================================
# Win11Debloat - Arquivo de Idioma Portugues Brasil
# Autor Original: Raphire (https://github.com/Raphire)
# Traducao: Arnaldo Lima (https://arnaldolima.com)
# Data: 29/11/2025 22:39 UTC-03:00
# ============================================================================

@{
    # Mensagens do Sistema
    ErrorPolicyRestricted = "Erro: Win11Debloat nao pode ser executado no seu sistema, a execucao do PowerShell esta restrita por politicas de seguranca"
    ErrorWingetNotInstalled = "Aviso: WinGet nao esta instalado ou esta desatualizado. Isso pode impedir o Win11Debloat de remover certos apps."
    PressAnyKeyToContinue = "Pressione qualquer tecla para continuar..."
    PressAnyKeyToExit = "Pressione qualquer tecla para sair..."
    PressEnterToConfirm = "Pressione Enter para confirmar suas escolhas e executar o script ou pressione CTRL+C para sair..."
    PressEnterToExecute = "Pressione Enter para executar o script ou pressione CTRL+C para sair..."
    ScriptCompleted = "Script concluido! Por favor, verifique acima se ha erros."
    NoChangesMessage = "O script foi concluido sem fazer nenhuma alteracao."
    
    # Menu Principal
    MenuTitle = "Win11Debloat Script - Menu"
    MenuOption1 = "(1) Modo Padrao: Aplica rapidamente as alteracoes recomendadas"
    MenuOption2 = "(2) Modo Personalizado: Selecione manualmente as alteracoes"
    MenuOption3 = "(3) Modo Remocao de Apps: Selecione e remova apps sem outras alteracoes"
    MenuOption4 = "(4) Aplicar configuracoes salvas da ultima execucao"
    MenuOption0 = "(0) Mostrar mais informacoes"
    MenuPrompt = "Por favor, selecione uma opcao"
    
    # Modo Padrao
    DefaultModeTitle = "Win11Debloat Script - Modo Padrao"
    DefaultModeNote = "Nota: A selecao padrao de apps inclui Microsoft Teams, Spotify, Sticky Notes e mais. Selecione a opcao 2 para verificar e alterar quais apps sao removidos pelo script."
    DefaultModeChanges = "Win11Debloat fara as seguintes alteracoes:"
    
    # Modo Personalizado
    CustomModeTitle = "Win11Debloat Script - Modo Personalizado"
    
    # Remocao de Apps
    AppRemovalTitle = "Win11Debloat Script - Remocao de Apps"
    AppRemovalOptions = "Opcoes:"
    AppRemovalOptionN = " (n) Nao remover nenhum app"
    AppRemovalOption1 = " (1) Remover apenas a selecao padrao de apps"
    AppRemovalOption2 = " (2) Remover a selecao padrao de apps, alem de apps de email, calendario e jogos"
    AppRemovalOption3 = " (3) Selecionar manualmente quais apps remover"
    AppRemovalPrompt = "Deseja remover algum app? Apps serao removidos para todos os usuarios"
    AppRemovalCancelled = "Selecao cancelada, nenhum app foi removido"
    AppSelectionCancelled = "Selecao de aplicativos cancelada, por favor tente novamente"
    AppsSelectedForRemoval = "Voce selecionou {0} apps para remocao"
    RemovingApps = "> Removendo {0} apps..."
    RemovingDefaultApps = "> Removendo selecao padrao de {0} apps..."
    AttemptingToRemove = "Tentando remover {0}..."
    RemovedForAllUsers = "Removido {0} para todos os usuarios"
    RemovedForCurrentUser = "Removido {0} para o usuario atual"
    UnableToRemove = "Nao foi possivel remover {0}"
    UnableToRemoveFromImage = "Nao foi possivel remover {0} da imagem do Windows"
    
    # Formulario de Selecao de Apps
    AppSelectionFormTitle = "Win11Debloat - Selecao de Aplicativos"
    AppSelectionLabel = "Marque os apps que deseja remover, desmarque os apps que deseja manter"
    AppSelectionConfirm = "Confirmar"
    AppSelectionCancel = "Cancelar"
    AppSelectionOnlyInstalled = "Mostrar apenas apps instalados"
    AppSelectionCheckAll = "Marcar/Desmarcar todos"
    AppSelectionLoading = "Carregando apps..."
    AppSelectionUnableToLoad = "Nao foi possivel carregar a lista de apps instalados via winget, alguns apps podem nao ser exibidos na lista."
    AppSelectionStoreWarning = "Tem certeza que deseja desinstalar a Microsoft Store? Este app nao pode ser reinstalado facilmente."
    
    # Perguntas do Modo Personalizado
    QuestionDisableTelemetry = "Desativar telemetria, dados de diagnostico, historico de atividades, rastreamento de apps e anuncios direcionados?"
    QuestionDisableSuggestions = "Desativar dicas, truques, sugestoes e anuncios no menu iniciar, configuracoes, notificacoes, explorador e tela de bloqueio e Edge?"
    QuestionDisableBing = "Desativar e remover pesquisa web do Bing, Bing AI e Cortana da pesquisa do Windows?"
    QuestionDisableAI = "Deseja desativar algum recurso de IA? Isso se aplica a todos os usuarios"
    QuestionDisableSpotlight = "Desativar plano de fundo Windows Spotlight na area de trabalho?"
    QuestionEnableDarkMode = "Ativar modo escuro para sistema e apps?"
    QuestionDisableTransparency = "Desativar transparencia, animacoes e efeitos visuais?"
    QuestionRevertContextMenu = "Restaurar o menu de contexto antigo estilo Windows 10?"
    QuestionDisableMouseAcceleration = "Desativar Aprimorar Precisao do Ponteiro, tambem conhecido como aceleracao do mouse?"
    QuestionDisableStickyKeys = "Desativar o atalho de teclado das Teclas de Aderencia?"
    QuestionDisableFastStartup = "Desativar Inicializacao Rapida? Isso se aplica a todos os usuarios"
    QuestionDisableModernStandby = "Desativar conectividade de rede durante Modern Standby? Isso se aplica a todos os usuarios"
    QuestionDisableGameBar = "Desativar integracao do Game Bar e gravacao de tela/jogo? Isso tambem para popups ms-gamingoverlay e ms-gamebar"
    
    # Opcoes de IA
    AIOptionsTitle = "Opcoes:"
    AIOptionN = " (n) Nao desativar nenhum recurso de IA"
    AIOption1 = " (1) Desativar Microsoft Copilot, Windows Recall e Click to Do"
    AIOption2 = " (2) Desativar Microsoft Copilot, Windows Recall, Click to Do e recursos de IA no Microsoft Edge, Paint e Bloco de Notas"
    
    # Mensagens de Acao
    ActionCreateRestorePoint = "Criar um ponto de restauracao do sistema"
    ActionRemoveApps = "Remover a selecao padrao de apps"
    ActionRemoveCustomApps = "Remover {0} apps"
    ActionRemoveCommApps = "Remover os apps Mail, Calendario e Pessoas"
    ActionRemoveOutlook = "Remover o novo app Outlook para Windows"
    ActionRemoveGamingApps = "Remover o Xbox App e Xbox Gamebar"
    ActionDisableDVR = "Desativar gravacao de tela/jogo do Xbox"
    ActionDisableGameBar = "Desativar integracao do Game Bar"
    ActionDisableTelemetry = "Desativar telemetria, dados de diagnostico, historico de atividades, rastreamento de apps e anuncios direcionados"
    ActionDisableSuggestions = "Desativar dicas, truques, sugestoes e anuncios no menu iniciar, configuracoes, notificacoes e Explorador de Arquivos"
    ActionDisableEdgeAds = "Desativar anuncios, sugestoes e feed de noticias MSN no Microsoft Edge"
    ActionDisableBing = "Desativar e remover pesquisa web do Bing, Bing AI e Cortana da pesquisa do Windows"
    ActionDisableCopilot = "Desativar e remover Microsoft Copilot"
    ActionDisableRecall = "Desativar Windows Recall"
    ActionDisableClickToDo = "Desativar Click to Do (analise de texto e imagem por IA)"
    ActionDisableEdgeAI = "Desativar recursos de IA no Edge"
    ActionDisablePaintAI = "Desativar recursos de IA no Paint"
    ActionDisableNotepadAI = "Desativar recursos de IA no Bloco de Notas"
    ActionDisableSpotlight = "Desativar a opcao de plano de fundo Windows Spotlight na area de trabalho"
    ActionEnableDarkMode = "Ativar modo escuro para sistema e apps"
    ActionDisableTransparency = "Desativar efeitos de transparencia"
    ActionDisableAnimations = "Desativar animacoes e efeitos visuais"
    ActionRevertContextMenu = "Restaurar o menu de contexto antigo estilo Windows 10"
    ActionDisableMouseAcceleration = "Desativar Aprimorar Precisao do Ponteiro (aceleracao do mouse)"
    ActionDisableStickyKeys = "Desativar o atalho de teclado das Teclas de Aderencia"
    ActionDisableFastStartup = "Desativar Inicializacao Rapida"
    ActionDisableModernStandby = "Desativar conectividade de rede durante Modern Standby"
    ActionTaskbarAlignLeft = "Alinhar icones da barra de tarefas a esquerda"
    ActionHideSearch = "Ocultar icone de pesquisa da barra de tarefas"
    ActionHideTaskview = "Ocultar o botao de visao de tarefas da barra de tarefas"
    ActionDisableWidgets = "Desativar widgets na barra de tarefas e tela de bloqueio"
    ActionHideChat = "Ocultar o icone de chat (meet now) da barra de tarefas"
    ActionShowHiddenFolders = "Mostrar arquivos, pastas e unidades ocultas"
    ActionShowFileExtensions = "Mostrar extensoes de arquivo para tipos conhecidos"
    ActionHideHome = "Ocultar a secao Inicio do painel de navegacao do Explorador de Arquivos"
    ActionHideGallery = "Ocultar a secao Galeria do painel de navegacao do Explorador de Arquivos"
    ActionHideOneDrive = "Ocultar a pasta OneDrive no painel lateral do Explorador de Arquivos"
    ActionHide3DObjects = "Ocultar a pasta Objetos 3D em 'Este PC' no Explorador de Arquivos"
    ActionHideMusic = "Ocultar a pasta Musica em 'Este PC' no Explorador de Arquivos"
    
    # Ponto de Restauracao
    RestorePointAttempt = "> Tentando criar um ponto de restauracao do sistema..."
    RestorePointDisabled = "A restauracao do sistema esta desativada, deseja ativa-la e criar um ponto de restauracao?"
    RestorePointCreated = "Ponto de restauracao do sistema criado com sucesso"
    RestorePointExists = "Um ponto de restauracao recente ja existe, nenhum novo ponto de restauracao foi criado."
    RestorePointError = "Erro: Falha ao criar ponto de restauracao do sistema, operacao expirou"
    
    # Reiniciar Explorer
    RestartingExplorer = "> Reiniciando o processo do Windows Explorer para aplicar todas as alteracoes... (Isso pode causar alguma oscilacao)"
    UnableToRestartExplorer = "Nao foi possivel reiniciar o processo do Windows Explorer, por favor reinicie seu PC manualmente para aplicar todas as alteracoes."
    
    # Erros
    ErrorWingetRequired = "Erro: WinGet nao esta instalado ou esta desatualizado, {0} nao pode ser removido"
    ErrorUserNotFound = "Erro: Nao foi possivel encontrar o caminho do diretorio do usuario para o usuario {0}"
    ErrorNoSavedSettings = "Erro: Nenhuma configuracao salva encontrada, nenhuma alteracao foi feita"
    ErrorSysprepW10 = "Erro: O modo Sysprep do Win11Debloat nao e suportado no Windows 10"
}
