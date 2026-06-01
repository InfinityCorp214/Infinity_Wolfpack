if LaunchingFromXEBPlus then
	while areWeLoadingACustomDiscIcon do
		pad = Pads.get()
		checkDiscIconLoadingState()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawInterface(actualCat,actualOption,true)
		spinDisc()
		thmDrawBKGOL()
		Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
		Screen.waitVblankStart()
		oldpad = pad;
		Screen.flip()
	end
	
	if string.sub(xebLua_AppWorkingPath,1,2) ~= "mc" then
		smasherImagesTable={}
		smasherI=0
		function smasherCheckImageLoadingState()
			smasherStateofthis = Graphics.getLoadState()
			if smasherStateofthis == 1 then
				smasherImagesTable[smasherI] = Graphics.getLoadData()
				smasherStillLoading=false
			elseif smasherStateofthis == 2 then
				Graphics.threadLoadImage(smasherImageToLoad)
			end
		end
		
		for cerrandopantalla = 1, 25 do
			pad = Pads.get()
			Screen.clear()
			ponerColorFade=cerrandopantalla*10
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawInterface(actualCat,actualOption,true)
			spinDisc()
			thmDrawBKGOL()
			Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
			for Whatever = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 480, 0, ponerColorFade)
			end
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, ponerColorFade)
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		
		smasherImageToLoad=xebLua_AppWorkingPath.."png/background.png"
		Graphics.threadLoadImage(smasherImageToLoad)
		smasherStillLoading=true
		while smasherStillLoading do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawInterface(actualCat,actualOption,true)
			spinDisc()
			thmDrawBKGOL()
			Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
			for Whatever = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 480, 0, 255)
			end
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
			smasherCheckImageLoadingState()
		end
		Graphics.setImageFilters(smasherImagesTable[0],2)
		for cerrandopantalla = 1, 25 do
			pad = Pads.get()
			Screen.clear()
			ponerColorFade=cerrandopantalla*10
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawInterface(actualCat,actualOption,true)
			spinDisc()
			thmDrawBKGOL()
			Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
			for Whatever = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 480, 0, 255)
			end
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, ponerColorFade)
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, "Programmed by Howling Wolf & Chelsea - Designed by Berion", Color.new(255,255,255,ponerColorFade/2))
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		smasherTable={}
		--[[
		smasherTable[1]="code_1.png"
		smasherTable[2]="code_2.png"
		smasherTable[3]="ds3_psbutton.png"
		smasherTable[4]="ds3_trigger_lr2.png"
		smasherTable[5]="ds4_psbutton.png"
		smasherTable[6]="ds4_share_options.png"
		smasherTable[7]="ds4_touchbar.png"
		smasherTable[8]="ds5_mic.png"
		smasherTable[9]="ds5_options.png"
		smasherTable[10]="ds5_psbutton.png"
		smasherTable[11]="ds5_share.png"
		smasherTable[12]="ds5_touchbar.png"
		smasherTable[13]="ds12_trigger_lr2.png"
		smasherTable[14]="ds45_dpad_down.png"
		smasherTable[15]="ds45_dpad_left.png"
		smasherTable[16]="ds45_dpad_right.png"
		smasherTable[17]="ds45_dpad_up.png"
		smasherTable[18]="ds45_stick.png"
		smasherTable[19]="ds45_trigger_l2.png"
		smasherTable[20]="ds45_trigger_lr1.png"
		smasherTable[21]="ds45_trigger_r2.png"
		smasherTable[22]="ds123_analogue.png"
		smasherTable[23]="ds123_dpad_down.png"
		smasherTable[24]="ds123_dpad_left.png"
		smasherTable[25]="ds123_dpad_right.png"
		smasherTable[26]="ds123_dpad_up.png"
		smasherTable[27]="ds123_select.png"
		smasherTable[28]="ds123_start.png"
		smasherTable[29]="ds123_stick.png"
		smasherTable[30]="ds123_trigger_lr1.png"
		smasherTable[31]="ds12345_symbols.png"
		smasherTable[32]="joypad_1.png"
		smasherTable[33]="joypad_1-2_triggers.png"
		smasherTable[34]="joypad_2.png"
		smasherTable[35]="joypad_2_stick.png"
		smasherTable[36]="joypad_3.png"
		smasherTable[37]="joypad_3_stick.png"
		smasherTable[38]="joypad_3_triggers.png"
		smasherTable[39]="joypad_4.png"
		smasherTable[40]="joypad_4_stick.png"
		smasherTable[41]="joypad_4_triggers.png"
		smasherTable[42]="joypad_5.png"
		smasherTable[43]="joypad_5_led.png"
		smasherTable[44]="joypad_5_stick.png"
		smasherTable[45]="joypad_5_triggers_l.png"
		smasherTable[46]="joypad_5_triggers_r.png"
		smasherTable[47]="joypad_6.png"
		smasherTable[48]="joypad_6_led.png"
		smasherTable[49]="joypad_6_stick.png"
		smasherTable[50]="joypad_6_triggers_l.png"
		smasherTable[51]="joypad_6_triggers_r.png"
		smasherTable[52]="joypad_23_led.png"
		smasherTable[53]="mini_0.png"
		smasherTable[54]="mini_1.png"
		smasherTable[55]="mini_2.png"
		smasherTable[56]="mini_3.png"
		smasherTable[57]="mini_4.png"
		smasherTable[58]="mini_5.png"
		smasherTable[59]="mini_6.png"
		smasherTable[60]="shadow.png"
		]]--
		smasherTable[1]="code_1.png"
		smasherTable[2]="code_2.png"
		smasherTable[3]="ds3_psbutton.png"
		smasherTable[4]="ds3_trigger_lr2.png"
		smasherTable[5]="ds12_trigger_lr2.png"
		smasherTable[6]="ds123_analogue.png"
		smasherTable[7]="ds123_dpad_down.png"
		smasherTable[8]="ds123_dpad_left.png"
		smasherTable[9]="ds123_dpad_right.png"
		smasherTable[10]="ds123_dpad_up.png"
		smasherTable[11]="ds123_select.png"
		smasherTable[12]="ds123_start.png"
		smasherTable[13]="ds123_stick.png"
		smasherTable[14]="ds123_trigger_lr1.png"
		smasherTable[15]="ds12345_symbols.png"
		smasherTable[16]="joypad_1.png"
		smasherTable[17]="joypad_1-2_triggers.png"
		smasherTable[18]="joypad_2.png"
		smasherTable[19]="joypad_2_stick.png"
		smasherTable[20]="joypad_3.png"
		smasherTable[21]="joypad_3_stick.png"
		smasherTable[22]="joypad_3_triggers.png"
		smasherTable[23]="joypad_23_led.png"
		smasherTable[24]="mini_0.png"
		smasherTable[25]="mini_1.png"
		smasherTable[26]="mini_2.png"
		smasherTable[27]="mini_3.png"
		smasherTable[28]="shadow.png"
		
		Pads.initializePad()
		
		for smasherIA = 1, 28 do
			pad = Pads.get()
			Screen.clear()
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255)
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			smasherIB=smasherIA*4
			Graphics.drawRect(352, 400, smasherIA*5, 5, Color.new(255,255,255,14+smasherIB))
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, "Programmed by Howling Wolf & Chelsea - Designed by Berion", Color.new(255,255,255,128))
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
			smasherImagesTable[smasherIA]=Graphics.loadImage(xebLua_AppWorkingPath.."png/"..smasherTable[smasherIA])
			
			--[[
			smasherI=smasherIA
			smasherImageToLoad=xebLua_AppWorkingPath.."png/"..smasherTable[smasherIA]
			Graphics.threadLoadImage(smasherImageToLoad)
			smasherStillLoading=true
			while smasherStillLoading do
				pad = Pads.get()
				Screen.clear()
				if backgroundFilter then
					Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
				else
					Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
				end
				thmDrawBKG()
				DrawInterface(actualCat,actualOption,true)
				spinDisc()
				thmDrawBKGOL()
				Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
				for Whatever = 1, howMuchRedrawTransparencyLayer do
					Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 480, 0, 255)
				end
				Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 480, 0, 255)
				Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
				Screen.waitVblankStart()
				oldpad = pad;
				Screen.flip()
				smasherCheckImageLoadingState()
			end
			]]--
		end
		for smasherIA = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			smasherIB=smasherIA*12
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255)
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			Graphics.drawRect(352, 400, 140, 5, Color.new(255,255,255,128-smasherIB))
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, "Programmed by Howling Wolf & Chelsea - Designed by Berion", Color.new(255,255,255,128))
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for smasherIA = 1, 2 do
			pad = Pads.get()
			Screen.clear()
			smasherIB=smasherIA*12
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255)
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, "Programmed by Howling Wolf & Chelsea - Designed by Berion", Color.new(255,255,255,128))
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for cerrandopantalla = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			ponerColorFade=cerrandopantalla*25
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255)
			Graphics.drawImageExtended(xebPluginAssets[smasherLogo], 352, plusYValue+240, 0, 0, 512, 256, 512, 256, 0, 255)
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, "Programmed by Howling Wolf & Chelsea - Designed by Berion", Color.new(255,255,255,128))
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, ponerColorFade)
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		smasherKeys="0000000000"
		function smasherCode(smasherNewKey)
			smasherKeys=smasherNewKey..smasherKeys
			smasherKeys=string.sub(smasherKeys,1,10)
		end
		smasherKeepTheWhile=true
		smasherSubiendo=1
		--Graphics.setImageFilters(smasherImagesTable[19],2)
		--Graphics.setImageFilters(smasherImagesTable[21],2)
		Graphics.setImageFilters(smasherImagesTable[28],2)
		--for cerrandopantalla = 1, 10 do
		smasherMove=1
		smasherEffect=1
		smasherModeNow=1
		smasherModePrevious=1
		smasherFadeAndQuit=false
		smasherFadeAndQuitState=25
		smasherPadImage=20
		smasherAnalogImage=21
		while smasherKeepTheWhile do
			pad = Pads.get()
			Screen.clear()
			if smasherSubiendo ~= 11 then
				ponerColorFade=smasherSubiendo*25
			end
			smasherPadType = Pads.getType(0)
			rx, ry = Pads.getRightStick()
			lx, ly = Pads.getLeftStick()
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255)
			Graphics.drawImageExtended(smasherImagesTable[28], 352, plusYValue+440, 0, 0, 64, 32, 512, 32, 0, 255)
			if Pads.getState(0) == 0 then
				Pads.initializePad()
			end
			if smasherPadType == 0 then
				Graphics.drawImage(smasherImagesTable[16], 94, plusYValue+0)
				Graphics.drawImage(smasherImagesTable[17], 64, plusYValue+27)
				Graphics.drawImage(smasherImagesTable[17], 577, plusYValue+27)
				smasherPadImage=16
				smasherStartSelectY=197
				smasherHasAnalog=false
			else
				smasherhasPressure = Pads.hasPressure(0)
				if smasherhasPressure == 1 then
					Graphics.drawImage(smasherImagesTable[20], 94, plusYValue+0)
					Graphics.drawImage(smasherImagesTable[22], 64, plusYValue+27)
					Graphics.drawImage(smasherImagesTable[22], 577, plusYValue+27)
					smasherPadImage=20
					smasherAnalogImage=21
				else
					Graphics.drawImage(smasherImagesTable[18], 94, plusYValue+0)
					Graphics.drawImage(smasherImagesTable[17], 64, plusYValue+27)
					Graphics.drawImage(smasherImagesTable[17], 577, plusYValue+27)
					smasherPadImage=18
					smasherAnalogImage=19
				end
				if lx == -127 and ly == -127 and rx == -127 and ry == -127 then
					smasherModeNow = 2
					lx = 0
					ly = 0
					rx = 0
					ry = 0
				else
					smasherModeNow = 1
				end
				if smasherModeNow == 1 then
					Graphics.drawImage(smasherImagesTable[23], 343, plusYValue+240,255-smasherEffect)
				end
				if Pads.check(pad, PAD_L3) then
					Graphics.drawImage(smasherImagesTable[13], 236, plusYValue+216)
					if not Pads.check(oldpad, PAD_L3) then
						smasherCode("1")
					end
				end
				if Pads.check(pad, PAD_R3) then
					Graphics.drawImage(smasherImagesTable[13], 392, plusYValue+216)
					if not Pads.check(oldpad, PAD_R3) then
						smasherCode("3")
					end
				end
				Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], lx/5.7+274, ly/5.7+plusYValue+253.5, 0, 0, 128, 128, 128, 128, 0, 255)
				Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], rx/5.7+430, ry/5.7+plusYValue+253.5, 0, 0, 128, 128, 128, 128, 0, 255)
				smasherStartSelectY=161
				if smasherModeNow ~= smasherModePrevious then
					Graphics.drawImage(smasherImagesTable[6], 340, plusYValue+212)
				end
				smasherModePrevious = smasherModeNow
				smasherHasAnalog=true
			end
			
			if Pads.check(pad, PAD_L1) then
				pressure = Pads.getPressure(PAD_L1)
				Graphics.drawImage(smasherImagesTable[14], 64, plusYValue+27, pressure)
				Graphics.drawImage(smasherImagesTable[14], 64, plusYValue+27, pressure)
				if not Pads.check(oldpad, PAD_L1) then
					smasherCode("A")
				end
			end
			if Pads.check(pad, PAD_R1) then
				pressure = Pads.getPressure(PAD_R1)
				Graphics.drawImage(smasherImagesTable[14], 577, plusYValue+27, pressure)
				Graphics.drawImage(smasherImagesTable[14], 577, plusYValue+27, pressure)
				if not Pads.check(oldpad, PAD_R1) then
					smasherCode("D")
				end
			end
			if Pads.check(pad, PAD_L2) then
				pressure = Pads.getPressure(PAD_L2)
				Graphics.drawImage(smasherImagesTable[5], 64, plusYValue+66, pressure)
				Graphics.drawImage(smasherImagesTable[5], 64, plusYValue+66, pressure)
				if not Pads.check(oldpad, PAD_L2) then
					smasherCode("Q")
				end
			end
			if Pads.check(pad, PAD_R2) then
				pressure = Pads.getPressure(PAD_R2)
				Graphics.drawImage(smasherImagesTable[5], 577, plusYValue+66, pressure)
				Graphics.drawImage(smasherImagesTable[5], 577, plusYValue+66, pressure)
				if not Pads.check(oldpad, PAD_R2) then
					smasherCode("E")
				end
			end
			
			if Pads.check(pad, PAD_UP) then
				pressure = Pads.getPressure(PAD_UP)
				Graphics.drawImage(smasherImagesTable[10], 177, plusYValue+129, pressure)
				Graphics.drawImage(smasherImagesTable[10], 177, plusYValue+129, pressure)
				if not Pads.check(oldpad, PAD_UP) then
					smasherCode("I")
				end
			end
			if Pads.check(pad, PAD_DOWN) then
				pressure = Pads.getPressure(PAD_DOWN)
				Graphics.drawImage(smasherImagesTable[7], 177, plusYValue+180, pressure)
				Graphics.drawImage(smasherImagesTable[7], 177, plusYValue+180, pressure)
				if not Pads.check(oldpad, PAD_DOWN) then
					smasherCode("K")
				end
			end
			if Pads.check(pad, PAD_LEFT) then
				pressure = Pads.getPressure(PAD_LEFT)
				Graphics.drawImage(smasherImagesTable[8], 149, plusYValue+157, pressure)
				Graphics.drawImage(smasherImagesTable[8], 149, plusYValue+157, pressure)
				if not Pads.check(oldpad, PAD_LEFT) then
					smasherCode("J")
				end
			end
			if Pads.check(pad, PAD_RIGHT) then
				pressure = Pads.getPressure(PAD_RIGHT)
				Graphics.drawImage(smasherImagesTable[9], 200, plusYValue+157, pressure)
				Graphics.drawImage(smasherImagesTable[9], 200, plusYValue+157, pressure)
				if not Pads.check(oldpad, PAD_RIGHT) then
					smasherCode("L")
				end
			end
			
			if Pads.check(pad, PAD_SELECT) then
				Graphics.drawImage(smasherImagesTable[11], 291, plusYValue+smasherStartSelectY)
				if not Pads.check(oldpad, PAD_SELECT) then
					smasherCode("B")
				end
			end
			if Pads.check(pad, PAD_START) then
				Graphics.drawImage(smasherImagesTable[12], 387, plusYValue+smasherStartSelectY)
				if not Pads.check(oldpad, PAD_START) then
					smasherCode("N")
				end
			end
			
			if Pads.check(pad, PAD_TRIANGLE) then
				pressure = Pads.getPressure(PAD_TRIANGLE)
				Graphics.drawImage(smasherImagesTable[15], 496, plusYValue+106, pressure)
				Graphics.drawImage(smasherImagesTable[15], 496, plusYValue+106, pressure)
				if not Pads.check(oldpad, PAD_TRIANGLE) then
					smasherCode("S")
				end
			end
			if Pads.check(pad, PAD_CIRCLE) then
				pressure = Pads.getPressure(PAD_CIRCLE)
				Graphics.drawImage(smasherImagesTable[15], 542, plusYValue+152, pressure)
				Graphics.drawImage(smasherImagesTable[15], 542, plusYValue+152, pressure)
				if not Pads.check(oldpad, PAD_CIRCLE) then
					smasherCode("C")
				end
			end
			if Pads.check(pad, PAD_CROSS) then
				pressure = Pads.getPressure(PAD_CROSS)
				Graphics.drawImage(smasherImagesTable[15], 496, plusYValue+198, pressure)
				Graphics.drawImage(smasherImagesTable[15], 496, plusYValue+198, pressure)
				if not Pads.check(oldpad, PAD_CROSS) then
					smasherCode("X")
				end
			end
			if Pads.check(pad, PAD_SQUARE) then
				pressure = Pads.getPressure(PAD_SQUARE)
				Graphics.drawImage(smasherImagesTable[15], 450, plusYValue+152, pressure)
				Graphics.drawImage(smasherImagesTable[15], 450, plusYValue+152, pressure)
				if not Pads.check(oldpad, PAD_SQUARE) then
					smasherCode("Z")
				end
			end
			
			if smasherKeys == "ZXLJLJKKII" then
				smasherFadeAndQuit=true
				--smasherKeepTheWhile = false
			end
			
			smasherPadTypeA = Pads.getType(1)
			Font.ftPrint(fontSmall, 352, plusYValue+440, 11, 512, 64, ""..smasherPadType.." - "..smasherPadTypeA.." - "..smasherKeys.." - "..Pads.getState(0).." - "..smasherhasPressure, Color.new(255,255,255,128))
			Font.ftPrint(fontSmall, 352, plusYValue+460, 11, 512, 64, ""..lx.."   "..ly.."   "..rx.."   "..ry, Color.new(255,255,255,128))
			if smasherSubiendo ~= 11 then
				Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255-ponerColorFade)
				smasherSubiendo=smasherSubiendo+1
			end
			if smasherFadeAndQuit then
				Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, smasherFadeAndQuitState)
				Graphics.drawImage(smasherImagesTable[smasherPadImage], 94, plusYValue+0)
				Graphics.drawImage(smasherImagesTable[15], 450, plusYValue+152, 255-smasherFadeAndQuitState)
				Graphics.drawImage(smasherImagesTable[15], 450, plusYValue+152, 255-smasherFadeAndQuitState)
				if smasherHasAnalog then
					if smasherModeNow == 1 then
						Graphics.drawImage(smasherImagesTable[23], 343, plusYValue+240,255-smasherEffect)
					end
					Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], lx/5.7+274, ly/5.7+plusYValue+253.5, 0, 0, 128, 128, 128, 128, 0, 255)
					Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], rx/5.7+430, ry/5.7+plusYValue+253.5, 0, 0, 128, 128, 128, 128, 0, 255)
				end
				smasherFadeAndQuitState=smasherFadeAndQuitState+25
			end
			if smasherFadeAndQuitState == 250 then
				smasherKeepTheWhile = false
			end
			if smasherMove == 1 then
				smasherEffect = smasherEffect + 2
				if smasherEffect == 51 then
					smasherMove = 2
				end
			else
				smasherEffect = smasherEffect - 2
				if smasherEffect == 1 then
					smasherMove = 1
				end
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		---------------------
		for cerrandopantalla = 1, 25 do
			pad = Pads.get()
			Screen.clear()
			ponerColorFade=cerrandopantalla*10
			smasherMovePad=cerrandopantalla*14.88
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawInterface(actualCat,actualOption,true)
			spinDisc()
			thmDrawBKGOL()
			Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
			Graphics.drawImageExtended(smasherImagesTable[0], 352, plusYValue+240, 0, 0, 128, 128, 720, 488, 0, 255-ponerColorFade)
			Graphics.drawImage(smasherImagesTable[smasherPadImage], 94, plusYValue-smasherMovePad)
			if smasherHasAnalog then
				rx, ry = Pads.getRightStick()
				lx, ly = Pads.getLeftStick()
				if lx == -127 and ly == -127 and rx == -127 and ry == -127 then
					smasherModeNow = 2
					lx = 0
					ly = 0
					rx = 0
					ry = 0
				else
					smasherModeNow = 1
				end
				if smasherModeNow == 1 then
					Graphics.drawImage(smasherImagesTable[23], 343, plusYValue+240-smasherMovePad,255-smasherEffect)
				end
				Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], lx/5.7+274, ly/5.7+plusYValue+253.5-smasherMovePad, 0, 0, 128, 128, 128, 128, 0, 255)
				Graphics.drawImageExtended(smasherImagesTable[smasherAnalogImage], rx/5.7+430, ry/5.7+plusYValue+253.5-smasherMovePad, 0, 0, 128, 128, 128, 128, 0, 255)
			end
			if smasherMove == 1 then
				smasherEffect = smasherEffect + 2
				if smasherEffect == 51 then
					smasherMove = 2
				end
			else
				smasherEffect = smasherEffect - 2
				if smasherEffect == 1 then
					smasherMove = 1
				end
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for cerrandopantalla = 1, 2 do
			pad = Pads.get()
			Screen.clear()
			ponerColorFade=cerrandopantalla*10
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawInterface(actualCat,actualOption,true)
			spinDisc()
			thmDrawBKGOL()
			Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		Graphics.freeImage(smasherImagesTable[0]);
		for smasherfreethm = 1, 28 do
			--System.printDebugSimple("------------------------------------\nFree image number "..smasherfreethm.."\n")
			--System.displayErrorXEBPlus("------------------------------------\nFree image number "..smasherfreethm.."\n")
			Graphics.freeImage(smasherImagesTable[smasherfreethm]);
		end
		smasherImagesTable=nil;
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawInterface(actualCat,actualOption,true)
		spinDisc()
		thmDrawBKGOL()
		Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
		Screen.waitVblankStart()
		oldpad = pad;
	else
		fadeToBlackItem()
		ShowError(xebLang[144])
		fadeFromBlack()
	end
else
	Font.fmLoad()
	for zzz = 1, 150 do
		Screen.clear();
		Font.fmPrint(52, 52, 0.77, "Error:\nThis software can only be launched\nfrom XtremeEliteBoot+.")
		ZZZMath=150-zzz
		--Font.fmPrint(52, 152, 0.77, xebLua_AppWorkingPath.."\n"..xebLua_AppFilename.."\n"..xebLua_AppExtension.."\n"..ZZZMath)
		Font.fmPrint(52, 152, 0.77, ""..ZZZMath)
		Screen.waitVblankStart()
		Screen.flip()
	end
	Font.fmUnload()
end