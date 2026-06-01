if LaunchingFromXEBPlus then
	for cerrandopantalla = 1, 5 do
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
		ponerColorFade=cerrandopantalla*20
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,ponerColorFade))
		Screen.waitVblankStart()
		oldpad = pad;
		Screen.flip()
	end
	elTexto=""
	SeguirMostrandoError=true
	for cerrandopantalla = 1, 12 do	
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
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
		ponerColorFade=cerrandopantalla*20
		Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,ponerColorFade))
		Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,ponerColorFade))
		Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,ponerColorFade))
		Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,ponerColorFade/2))
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
	DrawInterface(actualCat,actualOption,true)
	spinDisc()
	thmDrawBKGOL()
	Font.ftPrint(fontSmall, 352, plusYValue+453, 11, 512, 64, getInfoBarText(actualCat, actualOption), infoColor)
	Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
	Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
	Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
	elTexto="A disc is required to use this script, else, it will freeze\nIt will resume as soon as you insert a valid disc\n\nLoading ESR modules"
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
	Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
	Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
	Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
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
	Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
	Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
	Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
	System.loadIRX(System.currentDirectory().."ESR/cdvdv.irx")
	elTexto="A disc is required to use this script, else, it will freeze\nIt will resume as soon as you insert a valid disc\n\nLoading ESR modules - OK\nUpdating CDVD information"
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
	Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
	Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
	Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
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
	Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
	Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
	Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
	Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
	Screen.waitVblankStart()
	oldpad = pad;
	Screen.flip()
	XEBDisc[0]=-1
	XEBDisc = readCDVD()
	setCDVD()
	oldXEBDisc = XEBDisc;
	elTexto="A disc is required to use this script, else, it will freeze\nIt will resume as soon as you insert a valid disc\n\nLoading ESR modules - OK\nUpdating CDVD information - OK\n\nESR has been loaded!"
	for cerrandopantalla = 1,5 do
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
		nuevoColorPrueba=cerrandopantalla*20
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
		Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
		Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
		Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
		Font.ftPrint(fontSmall, 352, plusYValue+423, 11, 512, 64, XEBBTNACCEPT.." "..xebLang[53], Color.new(255,255,255,nuevoColorPrueba))
		Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
		Screen.waitVblankStart()
		if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
			SeguirMostrandoError=false
		end
		oldpad = pad;
		Screen.flip()
	end
	while SeguirMostrandoError do
		pad = Pads.get()
		Screen.clear()
		if areWeLoadingACustomDiscIcon then
			checkDiscIconLoadingState()
		end
		if backgroundFilter then
			Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
		else
			Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
		end
		thmDrawBKG()
		DrawInterface(actualCat,actualOption,true)
		spinDisc()
		thmDrawBKGOL()
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
		Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,255))
		Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,255))
		Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,255))
		Font.ftPrint(fontSmall, 352, plusYValue+423, 11, 512, 64, XEBBTNACCEPT.." "..xebLang[53], Color.new(255,255,255,128))
		Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,128))
		Screen.waitVblankStart()
		if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
			SeguirMostrandoError=false
		end
		oldpad = pad;
		Screen.flip()
	end
	for cerrandopantalla = 1, 12 do	
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
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
		ponerColorFade=cerrandopantalla*20
		ponerColorFade=252-ponerColorFade
		Graphics.drawRect(352, 72, 704, 1, Color.new(255,255,255,ponerColorFade/2))
		Graphics.drawRect(352, 106, 704, 1, Color.new(255,255,255,ponerColorFade/2))
		Graphics.drawRect(352, 409, 704, 1, Color.new(255,255,255,ponerColorFade/2))
		Font.ftPrint(fontSmall, 352, plusYValue+423, 11, 512, 64, XEBBTNACCEPT.." "..xebLang[53], Color.new(255,255,255,ponerColorFade/2))
		Font.ftPrint(fontSmall, 52, plusYValue+77, 1, 512, 512, "Quick ESR Loader"..":\n\n"..elTexto, Color.new(255,255,255,ponerColorFade/2))
		Screen.waitVblankStart()
		oldpad = pad;
		Screen.flip()
	end
	for cerrandopantalla = 1, 5 do
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
		ponerColorFade=cerrandopantalla*20
		ponerColorFade=101-ponerColorFade
		Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,ponerColorFade))
		Screen.waitVblankStart()
		oldpad = pad;
		Screen.flip()
	end
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
end