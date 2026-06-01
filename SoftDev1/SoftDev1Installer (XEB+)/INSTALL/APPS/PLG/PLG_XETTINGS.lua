-- This plugin is written for XEB+ Xmas Showcase, these features may not work in the full version.
-- DO NOT use this plugin with the full version of XEB+.

function saveXEBCNF()
    if childproofMode == false then
        childproofText = "false"
    elseif childproofMode == true then
        childproofText = "true"
    end
    if useAMPM == true then
        useAMPMtext = "true"
    elseif useAMPM == false then
        useAMPMtext = "false"
    end
    if monthsBefore == true then
        monthsBeforeText = "true"
    elseif monthsBefore == false then
        monthsBeforeText = "false"
    end
    if XEBPlusLanguageEmulation == true then
        XEBPlusLangText = "true"
    elseif XEBPlusLanguageEmulation == false then
        XEBPlusLangText = "false"
    end
    System.removeFile("CFG/xebplus.cfg")
    TextToSave = "--Theme folder's name\nXEBPlusTheme=\""..XEBPlusTheme.."\"\n--\"NTSC\" or \"PAL\"\nXEBVideoMode=\""..XEBVideoMode.."\"\n--\"X\" or \"O\"\nbuttonSettings=\""..buttonSettings.."\"\n--Enable Language Emulation (this setting is exclusive for the Xmas build, in the release build it will be enabled by default thanks to XEB+'s bootloader)\nXEBPlusLanguageEmulation="..XEBPlusLangText.."\n--0JP, 1EN, 2FR, 3ES, 4DE, 5IT, 6DU, 7PT\nsystemLanguage="..systemLanguage.."\n--true or false\nchildproofMode="..childproofText.."\n--2 for new mode, 1 for the classic one, 3 for forced ps2logo (modchips), 4 for smart ps2logo + cdfs, 5 for smart ps2logo + cdrom0\nlaunchPS2CDVD="..launchPS2CDVD.."\n--months before (true) or after days (false)\nmonthsBefore="..monthsBeforeText.."\n--use AM PM or not\nuseAMPM="..useAMPMtext.."\n--0 NoIOPReset / 1 NoUSB-ROM0 / 2 NoUSB-HB / 3 BDMUSB-ROM0 / 4 BDMUSB-HB / 5 2019USB-HB / 6 2019USB-ROM0 / 7 LegacyUSB-ROM0 / 8 LegacyUSB-HB / 9 ExternalUSB-ROM0 / 10 ExternalUSB-HB\ndefaultIOPResetMethod="..defaultIOPResetMethod.."\n                "
    xebConfFile=System.openFile("CFG/xebplus.cfg", FCREATE)
    System.writeFile(xebConfFile, TextToSave, string.len(TextToSave))
    System.closeFile(xebConfFile)
end

if theXEBPlusVersion == "XEBPLUS-2022-09" then
    Font.ftInit()
    fontXET = Font.ftLoad("THM/"..loadedTheme.."/font.ttf")
    fontBig = Font.ftLoad("THM/"..loadedTheme.."/font.ttf")
    fontSmall = Font.ftLoad("THM/"..loadedTheme.."/font.ttf")
    Font.ftSetCharSize(fontBig, 1250, 1250)
    Font.ftSetCharSize(fontSmall, 750, 750)
    Font.ftSetCharSize(fontXET, 1000, 1000)
    if XEBPlusLanguage == "en-US" then
        xetLang={};
        xetLang[0]="Refresh"
        xetLang[1]="Reload theme and plugins by restarting XEB+"
        xetLang[2]="Decide how to launch games from physical media"
        xetLang[3]="Change how the date is displayed"
        xetLang[4]="Select 12 hours clock or 24 hours clock"
        xetLang[5]="Decide what to do before launching an ELF"
        xetLang[6]="Enabled"
        xetLang[7]="Disabled"
        xetLang[8]="The ¶ button will be used to Accept\nand the ¬ button to Cancel." -- Buttons layout: CROSS button will be used to Accept
        xetLang[9]="The ¬ button will be used to Accept\nand the ¶ button to Cancel." -- Buttons layout: CIRCLE button will be used to Accept
        xetLang[10]="The "..XEBBTNACCEPT.." button will be used to Accept\nand the "..XEBBTNCANCEL.." button to Cancel." -- Buttons layout
        xetLang[11]="Language emulation"
        xetLang[12]="Change the language emulation settings"
        xetLang[13]="Language"
        xetLang[14]="Change the language applied to games"
        xetLang[15]="Applying a forced language will only work\nif language emulation is enabled. If you select\nEnglish, Spanish or Portuguese, XEB+ will\nbe launched using that language."
        xetLang[16]="Directory: " -- Theme
        xetLang[17]="Creator: " -- Theme
        xetLang[18]="Version: " -- Theme
        xetLang[19]="Recommended method"
        xetLang[20]="Recommended for users of MechaPwn 2.0\nwho has issues launching games."
        xetLang[21]="This launch method will only work properly in\nmodchips. Don't use it if your console don't\nhave a modchip installed."
        xetLang[22]="PS2LOGO will only be used when the game\nmatches your console's region.\nElse, Ghost CDFS will be used."
        xetLang[23]="PS2LOGO will only be used when the game\nmatches your console's region.\nElse, Direct CDROM0 will be used."
        xetLang[24]="Don't ever change this unless you have issues launching\napplications. This is only for troubleshooting purposes."
        xetLang[25]="Don't reset the IOP"
        xetLang[26]="Reset the IOP and loads the system drivers\nwith no USB support"
        xetLang[27]="Reset the IOP and loads the homebrew drivers\nwith no USB support"
        xetLang[28]="Reset the IOP and loads the system drivers\nand the BDM drivers"
        xetLang[29]="Reset the IOP and loads the homebrew drivers\nand the BDM drivers"
        xetLang[30]="Reset the IOP and loads the homebrew drivers\nand the USB drivers from 2019"
        xetLang[31]="Reset the IOP and loads the system drivers\nand the USB drivers from 2019"
        xetLang[32]="Reset the IOP and loads the system drivers\nand the USB drivers from circa 2012"
        xetLang[33]="Reset the IOP and loads the homebrew drivers\nand the USB drivers from circa 2012"
        xetLang[34]="Reset the IOP and loads the system drivers\nand loads the USB drivers from:\nmc0:/SYS-CONF/USBD.IRX and\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[35]="Reset the IOP and loads the homebrew drivers\nand loads the USB drivers from:\nmc0:/SYS-CONF/USBD.IRX and\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[36]="Select the USB drivers"
        xetLang[37]="You must restart XEB+ to apply these changes"
        xetLang[38]="Press "..XEBBTNEXTRAS.." to save settings and restart XEB+"
        xetLang[39]="USB Drivers"
        xetLang[40]="Select the USB drivers to use with XEB+"
        xetLang[41]="Uses the modern BDM USB drivers.\nSupports FAT32 and exFAT."
        xetLang[42]="Uses the USB drivers from 2019.\nSupports FAT32 only."
        xetLang[43]="Uses the USB drivers from circa 2012.\nSupports FAT32 only."
        xetLang[44]="Loads the drivers located at:\nmc0:/SYS-CONF/USBD.IRX and\nmc0:/SYS-CONF/USBHDFSD.IRX\nSupports whatever files you place there."
        xetLang[45]="Make sure the selected USB driver is\nsupported by your USB drive.\nDelete mc?:/SYS-CONF/XBL.CNF to restore\ndefault settings."
        xetLang[46]="Do you want to save this video mode?"
        xetLang[47]="Yes, save changes"
        xetLang[48]="No, restore the previous setting"
        xetLang[49]="If the screen remains black after changing\nthe video mode, the previous video mode\nwill be restored in 8 seconds"
        xetLang[50]="The previous video mode will be restored in "
        xetLang[51]=" seconds"
        xetLang[52]="To disable the childproof mode, you must\ninsert this code: Up, Up, Down, Down, Left,\nRight, Left, Right, Cross, Circle, Start"
    end
    if XEBPlusLanguage == "pt-BR" then
        xetLang={};
        xetLang[0]="Atualizar"
        xetLang[1]="Recarregue o tema e os plugins reiniciando o XEB+"
        xetLang[2]="Decida como lançar jogos a partir de mídia física"
        xetLang[3]="Alterar como a data é exibida"
        xetLang[4]="Selecione formato de 12 horas ou de 24 horas"
        xetLang[5]="Decida o que fazer antes de lançar um ELF"
        xetLang[6]="Habilitado"
        xetLang[7]="Desabilitado"
        xetLang[8]="O botão ¶ será usado para Aceitar\neo botão ¬ para Cancelar." -- Buttons layout: CROSS button will be used to Accept
        xetLang[9]="O botão ¬ será usado para Aceitar\neo botão ¶ para Cancelar." -- Buttons layout: CIRCLE button will be used to Accept
        xetLang[10]="O botão "..XEBBTNACCEPT.." será usado para Aceitar\neo botão "..XEBBTNCANCEL.." para Cancelar." -- Buttons layout
        xetLang[11]="Emulação de idioma"
        xetLang[12]="Alterar as configurações de emulação de idioma"
        xetLang[13]="Idioma"
        xetLang[14]="Alterar o idioma aplicado aos jogos"
        xetLang[15]="A aplicação de um idioma forçado só\nfuncionará se a emulação de idioma estiver\nhabilitada. Se você selecionar inglês, espanhol\nou português, o XEB+ será inicializado\nnesse idioma."
        xetLang[16]="Diretório: " -- Theme
        xetLang[17]="Criador: " -- Theme
        xetLang[18]="Versão: " -- Theme
        xetLang[19]="Método recomendado"
        xetLang[20]="Recomendado para usuários do MechaPwn\n2.0 who têm problemas para iniciar jogos."
        xetLang[21]="Este método de inicialização só funcionará\ncorretamente em modchips. Não use se seu\nconsole não tiver um modchip instalado."
        xetLang[22]="O PS2LOGO só será usado quando o jogo\ncorresponder à região do seu console.\nCaso contrário, o Ghost CDFS será usado."
        xetLang[23]="O PS2LOGO só será usado quando o jogo\ncorresponder à região do seu console.\nCaso contrário, o Direct CDROM0 será usado."
        xetLang[24]="Nunca altere isso, a menos que você tenha problemas\npara iniciar aplicativos. Isso é apenas para\nfins de solução de problemas."
        xetLang[25]="Não redefina o IOP"
        xetLang[26]="Redefina o IOP e carregue os drivers do sistema\nsem suporte a USB"
        xetLang[27]="Redefina o IOP e carregue os drivers homebrew\nsem suporte a USB"
        xetLang[28]="Redefina o IOP e carregue os drivers do sistema\ne os drivers BDM"
        xetLang[29]="Redefina o IOP e carregue os drivers homebrew\ne os drivers BDM"
        xetLang[30]="Redefina o IOP e carregue os drivers homebrew\ne os drivers USB de 2019"
        xetLang[31]="Redefina o IOP e carregue os drivers do sistema\ne os drivers USB de 2019"
        xetLang[32]="Redefina o IOP e carregue os drivers do sistema\ne os drivers USB de cerca de 2012"
        xetLang[33]="Redefina o IOP e carregue os drivers homebrew\ne os drivers USB de cerca de 2012"
        xetLang[34]="Redefina o IOP e carregue os drivers do sistema\ne carregue os drivers USB de:\nmc0:/SYS-CONF/USBD.IRX e\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[35]="Redefina o IOP e carregue os drivers homebrew\ne carregue os drivers USB de:\nmc0:/SYS-CONF/USBD.IRX e\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[36]="Selecione os drivers USB"
        xetLang[37]="Você deve reiniciar o XEB+ para aplicar essas alterações"
        xetLang[38]="Pressione "..XEBBTNEXTRAS.." para salvar as configurações e reiniciar o XEB+"
        xetLang[39]="Drivers USB"
        xetLang[40]="Selecione os drivers USB para usar com o XEB+"
        xetLang[41]="Usar os drivers USB modernos (BDM).\nSuporta FAT32 e exFAT."
        xetLang[42]="Usar os drivers USB de 2019.\nSuporta somente FAT32."
        xetLang[43]="Usar os drivers USB de por volta de 2012.\nSuporta somente FAT32."
        xetLang[44]="Carregar os drivers localizados em:\nmc0:/SYS-CONF/USBD.IRX e\nmc0:/SYS-CONF/USBHDFSD.IRX. Suporta\nqualquer ficheiro que colocar neste caminho."
        xetLang[45]="Por favor confirme se o driver USB é\nsuportado pêlo seu Pen Drive.\nApagar mc?:/SYS-CONF/XBL.CNF para\nrestaurar as configurações padrão."
        xetLang[46]="Salvar este modo de video?"
        xetLang[47]="Sim, salvar configurações."
        xetLang[48]="Não, restaurar as configurações anteriores."
        xetLang[49]="Se a tela ficar negra após a mudança do\nmodo de video, o anterior modo de video\nserá restaurado em 8 segundos."
        xetLang[50]="O modo de video anterior será restaurado em "
        xetLang[51]=" segundos."
        xetLang[52]="Para desativar o modo de segurança, você\ndeve inserir este código: Cima, Cima, Baixo,\nBaixo, Esquerda, Direita, Esquerda,\nDireita, Cruz, Círculo, Iniciar."
    end
    if XEBPlusLanguage == "es-419" then
        xetLang={};
        xetLang[0]="Refrescar"
        xetLang[1]="Reinicia XEB+ para recargar el tema y los plugins"
        xetLang[2]="Decide cómo cargar los juegos desde medios físicos"
        xetLang[3]="Cambia cómo se muestra la fecha"
        xetLang[4]="Selecciona si usar un reloj de 12 o 24 horas"
        xetLang[5]="Decide qué hacer antes de ejecutar un ELF"
        xetLang[6]="Habilitado"
        xetLang[7]="Deshabilitado"
        xetLang[8]="El botón ¶ será usado para Aceptar\ny el botón ¬ para Cancelar." -- Buttons layout: CROSS será usado para Aceptar
        xetLang[9]="El botón ¬ será usado para Aceptar\ny el botón ¶ para Cancelar." -- Buttons layout: CIRCLE será usado para Aceptar
        xetLang[10]="El botón "..XEBBTNACCEPT.." será usado para Aceptar\ny el botón "..XEBBTNCANCEL.." para Cancelar." -- Buttons layout
        xetLang[11]="Emulación de idioma"
        xetLang[12]="Cambia los ajustes de emulación de idioma"
        xetLang[13]="Idioma"
        xetLang[14]="Cambia el idioma que se aplicará a los juegos"
        xetLang[15]="Aplicar un idioma forzado solo funcionará\nsi la emulación de idioma está activa. De\nseleccionar Inglés, Español o Portugués, XEB+\nserá cargado usando ese idioma."
        xetLang[16]="Carpeta: " -- Theme
        xetLang[17]="Creador: " -- Theme
        xetLang[18]="Versión: " -- Theme
        xetLang[19]="Método recomendado"
        xetLang[20]="Recomendado para usuarios de MechaPwn 2.0\nque tengan problemas para iniciar juegos."
        xetLang[21]="Este método de carga solo funcionará\ncorrectamente en modchips. No lo uses si tu\nconsola no tiene uno instalado."
        xetLang[22]="PS2LOGO será usado solamente si la región\ndel juego concuerda con la consola.\nDe lo contrario, Ghost CDFS se usará."
        xetLang[23]="PS2LOGO será usado solamente si la región\ndel juego concuerda con la consola.\nDe lo contrario, Direct CDROM0 se usará."
        xetLang[24]="Nunca cambies esto a no ser que tengas problemas\nejecutando aplicaciones. Esto es solo para intentar\nsolventar problemas."
        xetLang[25]="No reinicia el IOP"
        xetLang[26]="Reinicia el IOP y carga los drivers del sistema\nsin soporte USB"
        xetLang[27]="Reinicia el IOP y carga los drivers homebrew\nsin soporte USB"
        xetLang[28]="Reinicia el IOP y carga los drivers del sistema\ny los drivers BDM"
        xetLang[29]="Reinicia el IOP y carga los drivers homebrew\ny los drivers BDM"
        xetLang[30]="Reinicia el IOP y carga los drivers homebrew\ny los drivers USB del 2019"
        xetLang[31]="Reinicia el IOP y carga los drivers del sistema\ny los drivers USB del 2019"
        xetLang[32]="Reinicia el IOP y carga los drivers del sistema\ny los drivers USB de cerca del 2012"
        xetLang[33]="Reinicia el IOP y carga los drivers homebrew\ny los drivers USB de cerca del 2012"
        xetLang[34]="Reinicia el IOP y carga los drivers del sistema\ny carga los drivers USB de:\nmc0:/SYS-CONF/USBD.IRX y\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[35]="Reinicia el IOP y carga los drivers homebrew\ny carga los drivers USB de:\nmc0:/SYS-CONF/USBD.IRX y\nmc0:/SYS-CONF/USBHDFSD.IRX"
        xetLang[36]="Selecciona los drivers USB"
        xetLang[37]="Debes reiniciar XEB+ para aplicar estos cambios"
        xetLang[38]="Presiona "..XEBBTNEXTRAS.." para salvar la configuración y reiniciar XEB+"
        xetLang[39]="Drivers USB"
        xetLang[40]="Selecciona los drivers USB a usar en XEB+"
        xetLang[41]="Usa los drivers USB modernos (BDM).\nSoporta FAT32 y exFAT."
        xetLang[42]="Usa los drivers USB de 2019.\nSoporta FAT32 solamente."
        xetLang[43]="Usa los drivers USB de alrededor del 2012.\nSoporta FAT32 solamente."
        xetLang[44]="Carga los drivers ubicados en:\nmc0:/SYS-CONF/USBD.IRX y\nmc0:/SYS-CONF/USBHDFSD.IRX\nAcepta cualquier driver que le pongas ahí."
        xetLang[45]="Asegúrate de que el driver USB seleccionado\nes soportado por tu dispositivo USB.\nElimina mc?:/SYS-CONF/XBL.CNF para\nrestarurar los valores por defecto."
        if isPALRegion then
            xetLang[46]="¿Quieres salvar este modo de vídeo?"
        else
            xetLang[46]="¿Quieres salvar este modo de video?"
        end
        xetLang[47]="Sí, salva los cambios."
        xetLang[48]="No, restaura la configuración anterior"
        if isPALRegion then
            xetLang[49]="Si la pantalla se queda en negro luego de\ncambiar la salida de vídeo, la anterior será\nrestaurada tras pasar 8 segundos"
            xetLang[50]="El modo anterior de vídeo será restaurado en "
        else
            xetLang[49]="Si la pantalla se queda en negro luego de\ncambiar la salida de video, la anterior será\nrestaurada tras pasar 8 segundos"
            xetLang[50]="El modo anterior de video será restaurado en "
        end
        xetLang[51]=" segundos"
        xetLang[52]="El modo infantil se deshabilita con el\nsiguiente código: Arriba, Arriba, Abajo,\nAbajo, Izquierda, Derecha, Izquierda, Derecha,\nEquis, Círculo, Start"
    end
    xebCath[1] = {};
    xebCath[1].Default = 2;
    xebCath[1].Icon = 2;
    xebCath[1].Amount = 5;
    catStoreCount[1]=5;
    xebCath[1].Option = {};
    xebCath[1].Option[1] = {};
    xebCath[1].Option[1].Type = "SingleELF";
    xebCath[1].Option[1].Name = xetLang[0];
    xebCath[1].Option[1].Description = xetLang[1];
    xebCath[1].Option[1].Icon = 133;
    xebCath[1].Option[1].Safe = true;
    xebCath[1].Option[1].ValueA = "XEBPLUS.ELF";
    xebCath[1].Option[1].ValueB = "XEBPLUS_XMAS.ELF";
    xebCath[1].Option[1].ValueC = "BOOT.ELF";
    xebCath[1].Option[2] = {};
    xebCath[1].Option[2].Type = "LuaCode";
    xebCath[1].Option[2].Value = "ExitToBrowser";
    xebCath[1].Option[2].Name = xebLang[4];
    xebCath[1].Option[2].Description = xebLang[44];
    xebCath[1].Option[2].Icon = 131;
    xebCath[1].Option[2].Safe = true;
    xebCath[1].Option[3] = {};
    xebCath[1].Option[3].Type = "LuaCode";
    xebCath[1].Option[3].Value = "Reboot";
    xebCath[1].Option[3].Name = xebLang[5];
    xebCath[1].Option[3].Description = xebLang[45];
    xebCath[1].Option[3].Icon = 134;
    xebCath[1].Option[3].Safe = true;
    xebCath[1].Option[4] = {};
    xebCath[1].Option[4].Type = "LuaCode";
    xebCath[1].Option[4].Value = "Shutdown";
    xebCath[1].Option[4].Name = xebLang[6];
    xebCath[1].Option[4].Description = xebLang[46];
    xebCath[1].Option[4].Icon = 132;
    xebCath[1].Option[4].Safe = true;
    xebCath[1].Option[5] = {};
    xebCath[1].Option[5].Type = "LuaCode";
    xebCath[1].Option[5].Value = "About";
    xebCath[1].Option[5].Name = xebLang[2];
    xebCath[1].Option[5].Description = xebLang[42];
    xebCath[1].Option[5].Icon = 120;
    xebCath[1].Option[5].Safe = true;
    xebCath[2].Default = 1;
    xebCath[2].Icon = 6;
    xebCath[2].Amount = 7;
    catStoreCount[2]=7
    xebCath[2].Option = {};
    xebCath[2].Option[1] = {};
    xebCath[2].Option[1].Name=xebLang[115]
    xebCath[2].Option[1].Description=xebLang[116]
    xebCath[2].Option[1].Type = "LuaScript";
    xebCath[2].Option[1].Icon = 69;
    xebCath[2].Option[1].ValueA = "APPS/XETTINGS/btnswap.lua";
    xebCath[2].Option[1].ValueB = "NONE";
    xebCath[2].Option[1].ValueC = "NONE";
    xebCath[2].Option[2] = {};
    xebCath[2].Option[2].Name=xetLang[11]
    xebCath[2].Option[2].Description=xetLang[12]
    xebCath[2].Option[2].Type = "LuaScript";
    xebCath[2].Option[2].Icon = 75;
    xebCath[2].Option[2].ValueA = "APPS/XETTINGS/langemu.lua";
    xebCath[2].Option[2].ValueB = "NONE";
    xebCath[2].Option[2].ValueC = "NONE";
    xebCath[2].Option[3] = {};
    xebCath[2].Option[3].Name=xetLang[13]
    xebCath[2].Option[3].Description=xetLang[14]
    xebCath[2].Option[3].Type = "LuaScript";
    xebCath[2].Option[3].Icon = 75;
    xebCath[2].Option[3].ValueA = "APPS/XETTINGS/langsys.lua";
    xebCath[2].Option[3].ValueB = "NONE";
    xebCath[2].Option[3].ValueC = "NONE";
    xebCath[2].Option[4] = {};
    xebCath[2].Option[4].Name=xebLang[10]
    xebCath[2].Option[4].Description=xebLang[50]
    xebCath[2].Option[4].Type = "LuaScript";
    xebCath[2].Option[4].Icon = 77;
    xebCath[2].Option[4].ValueA = "APPS/XETTINGS/theme.lua";
    xebCath[2].Option[4].ValueB = "NONE";
    xebCath[2].Option[4].ValueC = "NONE";
    xebCath[2].Option[5] = {};
    xebCath[2].Option[5].Name=xebLang[7]
    xebCath[2].Option[5].Description=xebLang[47]
    xebCath[2].Option[5].Type = "LuaScript";
    xebCath[2].Option[5].Icon = 71;
    xebCath[2].Option[5].ValueA = "APPS/XETTINGS/vmode.lua";
    xebCath[2].Option[5].ValueB = "NONE";
    xebCath[2].Option[5].ValueC = "NONE";
    xebCath[2].Option[6] = {};
    xebCath[2].Option[6].Name=xebLang[11]
    xebCath[2].Option[6].Description=xebLang[51]
    xebCath[2].Option[6].Type = "LuaScript";
    xebCath[2].Option[6].Icon = 76;
    xebCath[2].Option[6].ValueA = "APPS/XETTINGS/childproof.lua";
    xebCath[2].Option[6].ValueB = "NONE";
    xebCath[2].Option[6].ValueC = "NONE";
    xebCath[2].Option[7] = {};
    xebCath[2].Option[7].Name=xebLang[12]
    xebCath[2].Option[7].Description=xebLang[52]
    xebCath[2].Option[7].Type = "LuaScript";
    xebCath[2].Option[7].Icon = 78;
    xebCath[2].Option[7].ValueA = "APPS/XETTINGS/xebconf.lua";
    xebCath[2].Option[7].ValueB = "NONE";
    xebCath[2].Option[7].ValueC = "NONE";
    
    addFMCBCFG=false;
    if System.doesFileExist("mc0:/SYS-CONF/FMCB_CFG.ELF") then
        addFMCBCFG=true;
    elseif System.doesFileExist("mc1:/SYS-CONF/FMCB_CFG.ELF") then
        addFMCBCFG=true;
    elseif System.doesFileExist("mass:/PS2/APPS/FMCB_CFG/FMCB_CFG.ELF") then
        addFMCBCFG=true;
    end
    if addFMCBCFG then
        xebCath[2].Amount = 8;
        xebCath[2].Option[8] = {};
        xebCath[2].Option[8].Type = "SingleELF";
        xebCath[2].Option[8].Category = 3;
        xebCath[2].Option[8].Name = xebLang[97];
        xebCath[2].Option[8].Description = xebLang[98];
        xebCath[2].Option[8].Icon = 74;
        xebCath[2].Option[8].Safe = false;
        xebCath[2].Option[8].ValueA = "mass:/PS2/APPS/FMCB_CFG/FMCB_CFG.ELF";
        xebCath[2].Option[8].ValueB = "mc0:/SYS-CONF/FMCB_CFG.ELF";
        xebCath[2].Option[8].ValueC = "mc1:/SYS-CONF/FMCB_CFG.ELF";
        catStoreCount[2]=8
    end
end