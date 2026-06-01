GoToSubMenuIcon(actualCat,actualOption,true)
XEBKeepInSubMenu=true

SelectedItem=1 -- item selected after entering the submenu
ItemTotal = 5 -- total items count
Item = {};
Item[1] = {};
Item[1].Name = xebLang[220];
Item[1].Description = xetLang[2]
Item[1].Icon = 78
Item[2] = {};
Item[2].Name = xebLang[214];
Item[2].Description = xetLang[3]
Item[2].Icon = 78
Item[3] = {};
Item[3].Name = xebLang[217];
Item[3].Description = xetLang[4]
Item[3].Icon = 78
Item[4] = {};
Item[4].Name = xebLang[213];
Item[4].Description = xetLang[5]
Item[4].Icon = 78
Item[5] = {};
Item[5].Name = xetLang[39];
Item[5].Description = xetLang[40];
Item[5].Icon = 78


function SubMenu_DrawItem(SubMenu_TempX, SubMenu_TempY, SubMenu_TempFaded, SubMenu_TempName, SubMenu_TempIcon, SubMenu_TempDescription) -- int, int, boolean, string, string
	SubMenu_IconToDraw = SubMenu_TempIcon;
	if SubMenu_TempFaded then
		if SubMenu_TempName ~= "" then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY, columnsFade)
			if SubMenu_IconToDraw == SubMenu_TempIcon then
				Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, baseColorFaded)
			else
				Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, baseColorFaded)
			end
		end
		Font.ftPrint(fontBig, SubMenu_TempX+69, plusYValue+SubMenu_TempY+16, 0, 512, 64, SubMenu_TempName, baseColorFaded)
	else
		if SubMenu_TempName ~= "" then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY)
			if SubMenu_IconToDraw == SubMenu_TempIcon then
				Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, baseColorFull)
			else
				Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, baseColorFull)
			end
		end
		Font.ftPrint(fontBig, SubMenu_TempX+69, plusYValue+SubMenu_TempY+16, 0, 512, 64, SubMenu_TempName, baseColorFull)
	end
end

function SubMenu_DrawItemFrame(SubMenu_TempX, SubMenu_TempY, SubMenu_TempFaded, SubMenu_TempName, SubMenu_TempTheFrame, SubMenu_TempTheColorA, SubMenu_TempTheColorB, SubMenu_TempIcon, SubMenu_TempDescription) -- int, int, boolean/int, string, int, u32 color, u32 color, string
	SubMenu_IconToDraw = SubMenu_TempIcon;
	if SubMenu_TempName ~= "" then
		if SubMenu_TempFaded == true then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY, SubMenu_SpriteGetAnimationAlphaMin(SubMenu_TempTheFrame))
		elseif SubMenu_TempFaded == false then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY, SubMenu_SpriteGetAnimationAlphaMinMax(SubMenu_TempTheFrame))
		elseif SubMenu_TempFaded == 2 then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY, SubMenu_SpriteGetAnimationAlphaMax(SubMenu_TempTheFrame))
		elseif SubMenu_TempFaded == 3 then
			Graphics.drawImage(themeInUse[SubMenu_IconToDraw], SubMenu_TempX, plusYValue+SubMenu_TempY, SubMenu_SpriteGetAnimationAlphaMaxFade(SubMenu_TempTheFrame))
		end
		if SubMenu_IconToDraw == SubMenu_TempIcon then
			Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, SubMenu_ColorGetAnimationAlpha(SubMenu_TempTheFrame,SubMenu_TempTheColorA,SubMenu_TempTheColorB))
		else
			Font.ftPrint(fontSmall, SubMenu_TempX+70, plusYValue+SubMenu_TempY+32, 0, 512, 64, SubMenu_TempDescription, SubMenu_ColorGetAnimationAlpha(SubMenu_TempTheFrame,SubMenu_TempTheColorA,SubMenu_TempTheColorB))
		end
	end
	Font.ftPrint(fontBig, SubMenu_TempX+69, plusYValue+SubMenu_TempY+16, 0, 512, 64, SubMenu_TempName, SubMenu_ColorGetAnimationAlpha(SubMenu_TempTheFrame,SubMenu_TempTheColorA,SubMenu_TempTheColorB))
end

function SubMenu_ColorGetAnimationAlpha(SubMenu_TempFrame,SubMenu_TempColorA,SubMenu_TempColorB) -- int, u32 color, u32 color
	SubMenu_TempColorAA=Color.getA(SubMenu_TempColorA);
	SubMenu_TempColorBA=Color.getA(SubMenu_TempColorB);
	SubMenu_TempColorAR=Color.getR(SubMenu_TempColorA);
	SubMenu_TempColorBR=Color.getR(SubMenu_TempColorB);
	SubMenu_TempColorAG=Color.getG(SubMenu_TempColorA);
	SubMenu_TempColorBG=Color.getG(SubMenu_TempColorB);
	SubMenu_TempColorAB=Color.getB(SubMenu_TempColorA);
	SubMenu_TempColorBB=Color.getB(SubMenu_TempColorB);
	SubMenu_TempAlphaC=SubMenu_TempColorAA-SubMenu_TempColorBA;
	SubMenu_TempAlphaC=SubMenu_TempAlphaC/4;
	SubMenu_TempAlphaC=SubMenu_TempFrame*SubMenu_TempAlphaC;
	SubMenu_TempAlphaC=SubMenu_TempColorBA+SubMenu_TempAlphaC
	SubMenu_TempNextColorA=XEBMathRound(SubMenu_TempAlphaC);
	SubMenu_TempAlphaC=SubMenu_TempColorAR-SubMenu_TempColorBR;
	SubMenu_TempAlphaC=SubMenu_TempAlphaC/4;
	SubMenu_TempAlphaC=SubMenu_TempFrame*SubMenu_TempAlphaC;
	SubMenu_TempAlphaC=SubMenu_TempColorBR+SubMenu_TempAlphaC
	SubMenu_TempNextColorR=XEBMathRound(SubMenu_TempAlphaC);
	SubMenu_TempAlphaC=SubMenu_TempColorAG-SubMenu_TempColorBG;
	SubMenu_TempAlphaC=SubMenu_TempAlphaC/4;
	SubMenu_TempAlphaC=SubMenu_TempFrame*SubMenu_TempAlphaC;
	SubMenu_TempAlphaC=SubMenu_TempColorBG+SubMenu_TempAlphaC
	SubMenu_TempNextColorG=XEBMathRound(SubMenu_TempAlphaC);
	SubMenu_TempAlphaC=SubMenu_TempColorAB-SubMenu_TempColorBB;
	SubMenu_TempAlphaC=SubMenu_TempAlphaC/4;
	SubMenu_TempAlphaC=SubMenu_TempFrame*SubMenu_TempAlphaC;
	SubMenu_TempAlphaC=SubMenu_TempColorBB+SubMenu_TempAlphaC
	SubMenu_TempNextColorB=XEBMathRound(SubMenu_TempAlphaC);
	SubMenu_TempNewColor=Color.new(SubMenu_TempNextColorR,SubMenu_TempNextColorG,SubMenu_TempNextColorB,SubMenu_TempNextColorA);
	return SubMenu_TempNewColor;
end

function SubMenu_SpriteGetAnimationAlphaMin(SubMenu_TempFrame)
	SubMenu_TempAlpha=columnsFade;
	SubMenu_TempAlpha=SubMenu_TempAlpha/4;
	SubMenu_TempAlpha=SubMenu_TempFrame*SubMenu_TempAlpha;
	SubMenu_TempAlpha=XEBMathRound(SubMenu_TempAlpha);
	return SubMenu_TempAlpha;
end

function SubMenu_SpriteGetAnimationAlphaMax(SubMenu_TempFrame)
	SubMenu_TempAlpha=255;
	SubMenu_TempAlpha=SubMenu_TempAlpha-columnsFade
	SubMenu_TempAlpha=SubMenu_TempAlpha/4;
	SubMenu_TempAlpha=SubMenu_TempFrame*SubMenu_TempAlpha;
	SubMenu_TempAlpha=columnsFade+SubMenu_TempAlpha
	SubMenu_TempAlpha=XEBMathRound(SubMenu_TempAlpha);
	return SubMenu_TempAlpha;
end

function SubMenu_SpriteGetAnimationAlphaMaxFade(SubMenu_TempFrame)
	SubMenu_TempAlpha=columnsFade;
	SubMenu_TempAlpha=SubMenu_TempAlpha-255
	SubMenu_TempAlpha=SubMenu_TempAlpha/4;
	SubMenu_TempAlpha=SubMenu_TempFrame*SubMenu_TempAlpha;
	SubMenu_TempAlpha=255+SubMenu_TempAlpha
	SubMenu_TempAlpha=XEBMathRound(SubMenu_TempAlpha);
	return SubMenu_TempAlpha;
end

function SubMenu_SpriteGetAnimationAlphaMinMax(SubMenu_TempFrame)
	if SubMenu_TempFrame == 4 then
		SubMenu_TempAlpha=255;
	else
		SubMenu_TempAlpha=SubMenu_TempFrame*64
	end
	return SubMenu_TempAlpha;
end

SubMenu_ColorFullZero=Color.new(Color.getR(baseColorFull),Color.getG(baseColorFull),Color.getB(baseColorFull),0)
SubMenu_ColorFadedZero=Color.new(Color.getR(baseColorFaded),Color.getG(baseColorFaded),Color.getB(baseColorFaded),0)

for SubMenu_i = -7, 0 do
	Item[SubMenu_i] = {};
	Item[SubMenu_i].Name = "";
	Item[SubMenu_i].Description = "";
end	
for SubMenu_i = ItemTotal+1, ItemTotal+7 do
	Item[SubMenu_i] = {};
	Item[SubMenu_i].Name = "";
	Item[SubMenu_i].Description = "";
end

for SubMenu_i = 1, 3 do
	pad = Pads.get()
	Screen.clear()
	if backgroundFilter then
		Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
	else
		Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
	end
	thmDrawBKG()
	DrawSubMenu(actualCat,actualOption,true)
	SubMenu_ItemPosition = -5
	for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
		SubMenu_iB_Y = SubMenu_ItemPosition*71
		if SubMenu_iB == SelectedItem then
			SubMenu_DrawItemFrame(152, 206, false, Item[SubMenu_iB].Name, SubMenu_i, baseColorFull, SubMenu_ColorFullZero, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
		else
			SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, SubMenu_i, baseColorFaded, SubMenu_ColorFadedZero, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
		end
		SubMenu_ItemPosition=SubMenu_ItemPosition+1
	end
	spinDisc()
	thmDrawBKGOL()
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
end

SubMenu_HoldingUp=99
SubMenu_HoldingUpDash=0
SubMenu_HoldingDown=99
SubMenu_HoldingDownDash=0

function SubMenu_AnimateUp()
	spinDisc()
	thmDrawBKGOL()
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
	for SubMenu_Move = 1, 3 do
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_PositionUp = XEBMathRound(SubMenu_Move * 17.75)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135+SubMenu_PositionUp, 3, Item[SubMenu_iB].Name, SubMenu_Move, baseColorFaded, baseColorFull, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			elseif SubMenu_iB == SelectedItem-1 then
				SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135+SubMenu_PositionUp, 2, Item[SubMenu_iB].Name, SubMenu_Move, baseColorFull, baseColorFaded, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135+SubMenu_PositionUp, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		if not Pads.check(pad, PAD_UP) then
			SubMenu_HoldingUp=99
			SubMenu_HoldingUpDash=0
		end
		if SubMenu_Move ~= 3 then
			spinDisc()
			thmDrawBKGOL()
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
	end
end

function SubMenu_AnimateDown()
	spinDisc()
	thmDrawBKGOL()
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
	for SubMenu_Move = 1, 3 do
		SubMenu_MoveBack=4-SubMenu_Move
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_PositionDown = XEBMathRound(SubMenu_Move * 17.75)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135-SubMenu_PositionDown, 2, Item[SubMenu_iB].Name, SubMenu_MoveBack, baseColorFull, baseColorFaded, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			elseif SubMenu_iB == SelectedItem+1 then
				SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135-SubMenu_PositionDown, 3, Item[SubMenu_iB].Name, SubMenu_MoveBack, baseColorFaded, baseColorFull, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135-SubMenu_PositionDown, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		if not Pads.check(oldpad, PAD_DOWN) then
			SubMenu_HoldingDown=99
			SubMenu_HoldingDownDash=0
		end
		if not Pads.check(pad, PAD_DOWN) then
			SubMenu_HoldingDown=99
			SubMenu_HoldingDownDash=0
		end
		if SubMenu_Move ~= 3 then
			spinDisc()
			thmDrawBKGOL()
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
	end
end

SubMenuMode=0

while XEBKeepInSubMenu do
	if SubMenuMode == 0 then
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
			if SelectedItem == 1 then
				TransparencyAlpha=0
				TempX=840
				TempY=32
				ContextMenu_AllItems=5
				ContextMenu_SelectedItem=launchPS2CDVD
				ContextMenu={};
				ContextMenu[1] = {};
				ContextMenu[1].Name = xebLang[221]
				ContextMenu[2] = {};
				ContextMenu[2].Name = xebLang[222]
				ContextMenu[3] = {};
				ContextMenu[3].Name = xebLang[223]
				ContextMenu[4] = {};
				ContextMenu[4].Name = xebLang[224]
				ContextMenu[5] = {};
				ContextMenu[5].Name = xebLang[225]
				SubMenuMode=1
			end
			if SelectedItem == 2 then
				TransparencyAlpha=0
				TempX=840
				TempY=32
				ContextMenu_AllItems=2
				if monthsBefore == false then
					ContextMenu_SelectedItem = 1
				end
				if monthsBefore == true then
					ContextMenu_SelectedItem = 2
				end
				ContextMenu={};
				ContextMenu[1] = {};
				ContextMenu[1].Name = xebLang[215]
				ContextMenu[2] = {};
				ContextMenu[2].Name = xebLang[216]
				SubMenuMode=2
			end
			if SelectedItem == 3 then
				TransparencyAlpha=0
				TempX=840
				TempY=32
				ContextMenu_AllItems=2
				if useAMPM == false then
					ContextMenu_SelectedItem = 2
				end
				if useAMPM == true then
					ContextMenu_SelectedItem = 1
				end
				ContextMenu={};
				ContextMenu[1] = {};
				ContextMenu[1].Name = xebLang[218]
				ContextMenu[2] = {};
				ContextMenu[2].Name = xebLang[219]
				SubMenuMode=3
			end
			if SelectedItem == 4 then
				TransparencyAlpha=0
				TempX=840
				TempY=32
				ContextMenu_AllItems=11
				if defaultIOPResetMethod == 0 then
					ContextMenu_SelectedItem = 1
				end
				if defaultIOPResetMethod == 1 then
					ContextMenu_SelectedItem = 2
				end
				if defaultIOPResetMethod == 2 then
					ContextMenu_SelectedItem = 3
				end
				if defaultIOPResetMethod == 3 then
					ContextMenu_SelectedItem = 4
				end
				if defaultIOPResetMethod == 4 then
					ContextMenu_SelectedItem = 5
				end
				if defaultIOPResetMethod == 5 then
					ContextMenu_SelectedItem = 6
				end
				if defaultIOPResetMethod == 6 then
					ContextMenu_SelectedItem = 7
				end
				if defaultIOPResetMethod == 7 then
					ContextMenu_SelectedItem = 8
				end
				if defaultIOPResetMethod == 8 then
					ContextMenu_SelectedItem = 9
				end
				if defaultIOPResetMethod == 9 then
					ContextMenu_SelectedItem = 10
				end
				if defaultIOPResetMethod == 10 then
					ContextMenu_SelectedItem = 11
				end
				ContextMenu={};
				ContextMenu[1] = {};
				ContextMenu[1].Name = "NoIOPReset"
				ContextMenu[2] = {};
				ContextMenu[2].Name = "NoUSB-ROM0"
				ContextMenu[3] = {};
				ContextMenu[3].Name = "NoUSB-HB"
				ContextMenu[4] = {};
				ContextMenu[4].Name = "BDMUSB-ROM0"
				ContextMenu[5] = {};
				ContextMenu[5].Name = "BDMUSB-HB"
				ContextMenu[6] = {};
				ContextMenu[6].Name = "2019USB-HB"
				ContextMenu[7] = {};
				ContextMenu[7].Name = "2019USB-ROM0"
				ContextMenu[8] = {};
				ContextMenu[8].Name = "LegacyUSB-ROM0"
				ContextMenu[9] = {};
				ContextMenu[9].Name = "LegacyUSB-HB"
				ContextMenu[10] = {};
				ContextMenu[10].Name = "ExternalUSB-ROM0"
				ContextMenu[11] = {};
				ContextMenu[11].Name = "ExternalUSB-HB"
				SubMenuMode=4
			end
			if SelectedItem == 5 then
				TransparencyAlpha=0
				TempX=840
				TempY=32
				ContextMenu_AllItems=4
				if H_USBDrivers == "BDM" then
					ContextMenu_SelectedItem = 1
				end
				if H_USBDrivers == "NEO" then
					ContextMenu_SelectedItem = 2
				end
				if H_USBDrivers == "OLD" then
					ContextMenu_SelectedItem = 3
				end
				if H_USBDrivers == "EXT" then
					ContextMenu_SelectedItem = 4
				end
				ContextMenu={};
				ContextMenu[1] = {};
				ContextMenu[1].Name = "BDM"
				ContextMenu[2] = {};
				ContextMenu[2].Name = "NEO"
				ContextMenu[3] = {};
				ContextMenu[3].Name = "OLD"
				ContextMenu[4] = {};
				ContextMenu[4].Name = "EXT"
				SubMenuMode=5
			end
		elseif Pads.check(pad, PAD_UP) then
			if not Pads.check(oldpad, PAD_UP) then
				if SelectedItem ~= 1 then
					SubMenu_HoldingUp=1;
					SubMenu_HoldingUpDash=SubMenu_HoldingUpDash+1;
					SubMenu_AnimateUp()
					SelectedItem = SelectedItem - 1
				end
			elseif SubMenu_HoldingUp==17 and Pads.check(oldpad, PAD_UP) then
				if SelectedItem ~= 1 then
					SubMenu_HoldingUp=1;
					SubMenu_HoldingUpDash=SubMenu_HoldingUpDash+1;
					SubMenu_AnimateUp()
					SelectedItem = SelectedItem - 1
				end
			elseif SubMenu_HoldingUpDash>1 and Pads.check(oldpad, PAD_UP) then
				if SelectedItem ~= 1 then
					SubMenu_HoldingUp=1;
					SubMenu_HoldingUpDash=SubMenu_HoldingUpDash+1;
					SubMenu_AnimateUp()
					SelectedItem = SelectedItem - 1
				end
			end
			SubMenu_HoldingUp=SubMenu_HoldingUp+1;
		elseif Pads.check(pad, PAD_DOWN) then
			if not Pads.check(oldpad, PAD_DOWN) then
				if SelectedItem ~= ItemTotal then
					SubMenu_HoldingDown=1;
					SubMenu_HoldingDownDash=SubMenu_HoldingDownDash+1;
					SubMenu_AnimateDown()
					SelectedItem = SelectedItem + 1
				end
			elseif SubMenu_HoldingDown==17 and Pads.check(oldpad, PAD_DOWN) then
				if SelectedItem ~= ItemTotal then
					SubMenu_HoldingUp=1;
					SubMenu_HoldingDownDash=SubMenu_HoldingDownDash+1;
					SubMenu_AnimateDown()
					SelectedItem = SelectedItem + 1
				end
			elseif SubMenu_HoldingDownDash>1 and Pads.check(oldpad, PAD_DOWN) then
				if SelectedItem ~= ItemTotal then
					SubMenu_HoldingDown=1;
					SubMenu_HoldingDownDash=SubMenu_HoldingDownDash+1;
					SubMenu_AnimateDown()
					SelectedItem = SelectedItem + 1
				end
			end
			SubMenu_HoldingDown=SubMenu_HoldingDown+1;
		elseif Pads.check(pad, PAD_LEFT) and not Pads.check(oldpad, PAD_LEFT) then
			XEBKeepInSubMenu=false
		end
		if not Pads.check(pad, PAD_UP) then
			SubMenu_HoldingUp=99
			SubMenu_HoldingUpDash=0
		end
		if not Pads.check(pad, PAD_DOWN) then
			SubMenu_HoldingDown=99
			SubMenu_HoldingDownDash=0
		end
		if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
			XEBKeepInSubMenu=false
		end
		spinDisc()
		thmDrawBKGOL()
		Screen.waitVblankStart()
		oldpad = pad;
		Screen.flip()
	end
	if SubMenuMode == 1 then
		XEBKeepInContextMenu=true
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=310-move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[19], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[20], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[21], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[22], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[23], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		while XEBKeepInContextMenu do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[19], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[20], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[21], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[22], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[23], baseColorFull)
			end
			----------------------------------------------------------------------------
			if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
				launchPS2CDVD = ContextMenu_SelectedItem
				XEBKeepInContextMenu=false
			end
			if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
				if ContextMenu_SelectedItem > 1 then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem-1
				end
			end
			if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
				if ContextMenu_SelectedItem < ContextMenu_AllItems then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem+1
				end
			end
			if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
				XEBKeepInContextMenu=false
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255-moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[19], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[20], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[21], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[22], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[23], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		spinDisc()
		thmDrawBKGOL()
		oldpad = pad;
		SubMenuMode=0
	end
	if SubMenuMode == 2 then
		XEBKeepInContextMenu=true
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=310-move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		while XEBKeepInContextMenu do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
				if ContextMenu_SelectedItem == 1 then
					monthsBefore = false
				end
				if ContextMenu_SelectedItem == 2 then
					monthsBefore = true
				end
				XEBKeepInContextMenu=false
			end
			if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
				if ContextMenu_SelectedItem > 1 then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem-1
				end
			end
			if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
				if ContextMenu_SelectedItem < ContextMenu_AllItems then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem+1
				end
			end
			if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
				XEBKeepInContextMenu=false
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255-moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		spinDisc()
		thmDrawBKGOL()
		oldpad = pad;
		SubMenuMode=0
	end
	if SubMenuMode == 3 then
		XEBKeepInContextMenu=true
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=310-move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		while XEBKeepInContextMenu do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
				if ContextMenu_SelectedItem == 1 then
					useAMPM = true
				end
				if ContextMenu_SelectedItem == 2 then
					useAMPM = false
				end
				XEBKeepInContextMenu=false
			end
			if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
				if ContextMenu_SelectedItem > 1 then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem-1
				end
			end
			if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
				if ContextMenu_SelectedItem < ContextMenu_AllItems then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem+1
				end
			end
			if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
				XEBKeepInContextMenu=false
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255-moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		spinDisc()
		thmDrawBKGOL()
		oldpad = pad;
		SubMenuMode=0
	end
	if SubMenuMode == 4 then
		XEBKeepInContextMenu=true
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=310-move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Graphics.drawRect(198, 420, 342, 60, Color.new(255,24,24,move*10))
			Font.ftPrint(fontSmall, 30, plusYValue+393, 0, 512, 64, xetLang[24], Color.new(255,255,255,moveb))
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[25], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[26], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[27], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[28], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[29], baseColorFull)
			elseif ContextMenu_SelectedItem == 6 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[30], baseColorFull)
			elseif ContextMenu_SelectedItem == 7 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[31], baseColorFull)
			elseif ContextMenu_SelectedItem == 8 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[32], baseColorFull)
			elseif ContextMenu_SelectedItem == 9 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[33], baseColorFull)
			elseif ContextMenu_SelectedItem == 10 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[34], baseColorFull)
			elseif ContextMenu_SelectedItem == 11 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[35], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		while XEBKeepInContextMenu do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Graphics.drawRect(198, 420, 342, 60, Color.new(255,24,24,100))
			Font.ftPrint(fontSmall, 30, plusYValue+393, 0, 512, 64, xetLang[24], baseColorFull)
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[25], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[26], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[27], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[28], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[29], baseColorFull)
			elseif ContextMenu_SelectedItem == 6 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[30], baseColorFull)
			elseif ContextMenu_SelectedItem == 7 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[31], baseColorFull)
			elseif ContextMenu_SelectedItem == 8 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[32], baseColorFull)
			elseif ContextMenu_SelectedItem == 9 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[33], baseColorFull)
			elseif ContextMenu_SelectedItem == 10 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[34], baseColorFull)
			elseif ContextMenu_SelectedItem == 11 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[35], baseColorFull)
			end
			----------------------------------------------------------------------------
			if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
				if ContextMenu_SelectedItem == 1 then
					defaultIOPResetMethod = 0
				end
				if ContextMenu_SelectedItem == 2 then
					defaultIOPResetMethod = 1
				end
				if ContextMenu_SelectedItem == 3 then
					defaultIOPResetMethod = 2
				end
				if ContextMenu_SelectedItem == 4 then
					defaultIOPResetMethod = 3
				end
				if ContextMenu_SelectedItem == 5 then
					defaultIOPResetMethod = 4
				end
				if ContextMenu_SelectedItem == 6 then
					defaultIOPResetMethod = 5
				end
				if ContextMenu_SelectedItem == 7 then
					defaultIOPResetMethod = 6
				end
				if ContextMenu_SelectedItem == 8 then
					defaultIOPResetMethod = 7
				end
				if ContextMenu_SelectedItem == 9 then
					defaultIOPResetMethod = 8
				end
				if ContextMenu_SelectedItem == 10 then
					defaultIOPResetMethod = 9
				end
				if ContextMenu_SelectedItem == 11 then
					defaultIOPResetMethod = 10
				end
				XEBKeepInContextMenu=false
			end
			if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
				if ContextMenu_SelectedItem > 1 then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem-1
				end
			end
			if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
				if ContextMenu_SelectedItem < ContextMenu_AllItems then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem+1
				end
			end
			if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
				XEBKeepInContextMenu=false
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255-moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Graphics.drawRect(198, 420, 342, 60, Color.new(255,24,24,100-move*10))
			Font.ftPrint(fontSmall, 30, plusYValue+393, 0, 512, 64, xetLang[24], Color.new(255,255,255,255-moveb))
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[25], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[26], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[27], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[28], baseColorFull)
			elseif ContextMenu_SelectedItem == 5 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[29], baseColorFull)
			elseif ContextMenu_SelectedItem == 6 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[30], baseColorFull)
			elseif ContextMenu_SelectedItem == 7 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[31], baseColorFull)
			elseif ContextMenu_SelectedItem == 8 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[32], baseColorFull)
			elseif ContextMenu_SelectedItem == 9 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[33], baseColorFull)
			elseif ContextMenu_SelectedItem == 10 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[34], baseColorFull)
			elseif ContextMenu_SelectedItem == 11 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[35], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		spinDisc()
		thmDrawBKGOL()
		oldpad = pad;
		SubMenuMode=0
	end
	if SubMenuMode == 5 then
		XEBKeepInContextMenu=true
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=310-move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Font.ftPrint(fontSmall, 408+movec, plusYValue+290, 0, 512, 64, xetLang[45], baseColorFull)
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[41], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[42], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[43], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[44], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		while XEBKeepInContextMenu do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Font.ftPrint(fontSmall, 408, plusYValue+290, 0, 512, 64, xetLang[45], baseColorFull)
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[41], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[42], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[43], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 512, 64, xetLang[44], baseColorFull)
			end
			----------------------------------------------------------------------------
			if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
				if ContextMenu_SelectedItem == 1 then
					H_USBDrivers="BDM"
				end
				if ContextMenu_SelectedItem == 2 then
					H_USBDrivers="NEO"
				end
				if ContextMenu_SelectedItem == 3 then
					H_USBDrivers="OLD"
				end
				if ContextMenu_SelectedItem == 4 then
					H_USBDrivers="EXT"
				end
				changedUSBDrivers=true
				XEBKeepInContextMenu=false
			end
			if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
				if ContextMenu_SelectedItem > 1 then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem-1
				end
			end
			if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
				if ContextMenu_SelectedItem < ContextMenu_AllItems then
					ContextMenu_SelectedItem=ContextMenu_SelectedItem+1
				end
			end
			if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
				XEBKeepInContextMenu=false
			end
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		for move = 1, 10 do
			pad = Pads.get()
			Screen.clear()
			if backgroundFilter then
				Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
			else
				Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
			end
			thmDrawBKG()
			DrawSubMenu(actualCat,actualOption,true)
			SubMenu_ItemPosition = -5
			for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
				SubMenu_iB_Y = SubMenu_ItemPosition*71
				if SubMenu_iB == SelectedItem then
					SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				else
					SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
				end
				SubMenu_ItemPosition=SubMenu_ItemPosition+1
			end
			spinDisc()
			thmDrawBKGOL()
		
			moveb=move*25
			movec=move*31
		
			for i = 1, howMuchRedrawTransparencyLayer do
				Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255-moveb)
			end
			----------------------------------------------------------------------------
			Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
			TempY=8+ContextMenu_SelectedItem*24
			Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
			for ItemToDraw = 1,ContextMenu_AllItems do
				TempY=ItemToDraw*24
				Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
			end
			Font.ftPrint(fontSmall, 408+movec, plusYValue+290, 0, 512, 64, xetLang[45], baseColorFull)
			if ContextMenu_SelectedItem == 1 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[41], baseColorFull)
			elseif ContextMenu_SelectedItem == 2 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[42], baseColorFull)
			elseif ContextMenu_SelectedItem == 3 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[43], baseColorFull)
			elseif ContextMenu_SelectedItem == 4 then
				Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 512, 64, xetLang[44], baseColorFull)
			end
			----------------------------------------------------------------------------
			Screen.waitVblankStart()
			oldpad = pad;
			Screen.flip()
		end
		pad = Pads.get()
		Screen.clear()
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawSubMenu(actualCat,actualOption,true)
		SubMenu_ItemPosition = -5
		for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
			SubMenu_iB_Y = SubMenu_ItemPosition*71
			if SubMenu_iB == SelectedItem then
				SubMenu_DrawItem(152, 206, false, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			else
				SubMenu_DrawItem(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
			end
			SubMenu_ItemPosition=SubMenu_ItemPosition+1
		end
		spinDisc()
		thmDrawBKGOL()
		oldpad = pad;
		SubMenuMode=0
	end
end

for SubMenu_i = 1, 3 do
	pad = Pads.get()
	Screen.clear()
	if backgroundFilter then
		Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
	else
		Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
	end
	thmDrawBKG()
	DrawSubMenu(actualCat,actualOption,true)
	SubMenu_ReverseFrame=4-SubMenu_i
	SubMenu_ItemPosition = -5
	for SubMenu_iB = SelectedItem-6, SelectedItem+5 do
		SubMenu_iB_Y = SubMenu_ItemPosition*71
		if SubMenu_iB == SelectedItem then
			SubMenu_DrawItemFrame(152, 206, false, Item[SubMenu_iB].Name, SubMenu_ReverseFrame, baseColorFull, SubMenu_ColorFullZero, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
		else
			SubMenu_DrawItemFrame(152, SubMenu_iB_Y+135, true, Item[SubMenu_iB].Name, SubMenu_ReverseFrame, baseColorFaded, SubMenu_ColorFadedZero, Item[SubMenu_iB].Icon, Item[SubMenu_iB].Description)
		end
		SubMenu_ItemPosition=SubMenu_ItemPosition+1
	end
	spinDisc()
	thmDrawBKGOL()
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
end

if changedUSBDrivers then
	xblCnfPath="CFG/XBL.CNF"
    listdira = System.listDirectory("mc0:/")
    listdirb = System.listDirectory("mc1:/")
    mcinfoa = System.getMCInfo(0)
    mcinfob = System.getMCInfo(1)
	if System.doesDirectoryExist("mc0:/SYS-CONF/USBD.IRX") then
		xblCnfPath = "mc0:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc0:/SYS-CONF/USBHDFSD.IRX") then
		xblCnfPath = "mc0:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc0:/SYS-CONF/sysconf.icn") then
		xblCnfPath = "mc0:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc0:/SYS-CONF/icon.sys") then
		xblCnfPath = "mc0:/SYS-CONF/XBL.CNF"
	end
    if System.doesDirectoryExist("mc1:/SYS-CONF/USBD.IRX") then
		xblCnfPath = "mc1:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc1:/SYS-CONF/USBHDFSD.IRX") then
		xblCnfPath = "mc1:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc1:/SYS-CONF/sysconf.icn") then
		xblCnfPath = "mc1:/SYS-CONF/XBL.CNF"
	elseif System.doesDirectoryExist("mc1:/SYS-CONF/icon.sys") then
		xblCnfPath = "mc1:/SYS-CONF/XBL.CNF"
	end
	TextToSaveB = "H_USBDrivers = "..H_USBDrivers.."\n  "
	xblCnfFile=System.openFile(xblCnfPath, FCREATE)
	System.removeFile(xblCnfFile)
	System.writeFile(xblCnfFile, TextToSaveB, string.len(TextToSaveB))
	System.closeFile(xblCnfFile)
    changedUSBDrivers=false
end
saveXEBCNF()
BackFromSubMenuIcon(actualCat,actualOption,true)
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
oldpad = pad;