XEBKeepInContextMenu=true
TransparencyAlpha=0
Timer1=0
TempX=840
TempY=32
listdir = System.listDirectory("THM/")
ContextMenu_AllItems=#listdir
ContextMenu = {};
for nr =1, #listdir do
    thmLoad = false
    tempFile="THM/"..listdir[nr].name.."/theme.lua"
    dofile(tempFile)
	ContextMenu[nr] = {};
	ContextMenu[nr].Name = thmName
    ContextMenu[nr].Folder = listdir[nr].name
    ContextMenu[nr].Version = thmVersion
    ContextMenu[nr].Author = thmCreator
    thmLoad = true
end
table.sort(ContextMenu, function (TempTabA, TempTabB) return TempTabA.Name < TempTabB.Name end)
ContextMenu_SelectedItem = 1
for nra =1, #listdir do
    if ContextMenu[nra].Folder == XEBPlusTheme then
        ContextMenu_SelectedItem = nra
    end
end
olditem=ContextMenu_SelectedItem

for move = 1, 10 do
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

    moveb=move*25
    movec=310-move*31

    for i = 1, howMuchRedrawTransparencyLayer do
        Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, moveb)
    end
    ----------------------------------------------------------------------------
    Graphics.drawImageExtended(themeInUse[-5], 549+movec, 240, 0, 0, 325, 480, 325, 480, 0, 255)
    TempY=8+ContextMenu_SelectedItem*24
    if ContextMenu_SelectedItem >= 19 then
        TempA=ContextMenu_SelectedItem-18
        AdjustY=TempA*24
    else
        AdjustY=0
    end
    Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY-AdjustY, 0, 0, 310, 22, 310, 22, 0, 255)
    for ItemToDraw = 1,ContextMenu_AllItems do
        TempY=ItemToDraw*24-AdjustY
        Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
    end
    TempXb=-320+move*35
    textToPrint=xetLang[17]..ContextMenu[ContextMenu_SelectedItem].Author
    Font.ftPrint(fontSmall, TempXb, plusYValue+360, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[16]..ContextMenu[ContextMenu_SelectedItem].Folder
    Font.ftPrint(fontSmall, TempXb, plusYValue+375, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[18]..ContextMenu[ContextMenu_SelectedItem].Version
    Font.ftPrint(fontSmall, TempXb, plusYValue+390, 0, 340, 64, textToPrint, baseColorFull)
    ----------------------------------------------------------------------------
    Screen.waitVblankStart()
    oldpad = pad;
    Screen.flip()
end
themePreviewLoaded=false
while XEBKeepInContextMenu do
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
    for i = 1, howMuchRedrawTransparencyLayer do
        Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
    end
    ----------------------------------------------------------------------------
    Graphics.drawImageExtended(themeInUse[-5], 549, 240, 0, 0, 325, 480, 325, 480, 0, 255)
    TempY=8+ContextMenu_SelectedItem*24
    if ContextMenu_SelectedItem >= 19 then
        TempA=ContextMenu_SelectedItem-18
        AdjustY=TempA*24
    else
        AdjustY=0
    end
    Graphics.drawImageExtended(themeInUse[-4], 549, TempY-AdjustY, 0, 0, 310, 22, 310, 22, 0, 255)
    for ItemToDraw = 1,ContextMenu_AllItems do
        TempY=ItemToDraw*24-AdjustY
        Font.ftPrint(fontSmall, 408, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
    end
    textToPrint=xetLang[17]..ContextMenu[ContextMenu_SelectedItem].Author
    Font.ftPrint(fontSmall, 30, plusYValue+360, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[16]..ContextMenu[ContextMenu_SelectedItem].Folder
    Font.ftPrint(fontSmall, 30, plusYValue+375, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[18]..ContextMenu[ContextMenu_SelectedItem].Version
    Font.ftPrint(fontSmall, 30, plusYValue+390, 0, 340, 64, textToPrint, baseColorFull)
    ----------------------------------------------------------------------------
    if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
        XEBPlusTheme=ContextMenu[ContextMenu_SelectedItem].Folder
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

    if ContextMenu_SelectedItem == olditem then
        Timer1=Timer1+1
    else
        Timer1=0
        themePreviewLoaded=false
    end
    if Timer1 == 16 then
        themeToUse=ContextMenu[ContextMenu_SelectedItem].Folder
        themeInUse[-8] = Graphics.loadImage("THM/"..themeToUse.."/thm_preview.png")
        themePreviewLoaded=true
    end
    if Timer1 >= 18 then
        TempVar1=Timer1-18
        TempVar2=TempVar1*52
        if Timer1 >= 23 then
            Timer1 = 23
        end
        if TempVar2 >= 255 then
            TempVar2=255
        end
        Graphics.drawImageExtended(themeInUse[-8], 200, plusYValue+240, 0, 0, 352, 240, 352, 240, 0, TempVar2)
    end

    Screen.waitVblankStart()
    oldpad = pad;
    Screen.flip()
    olditem=ContextMenu_SelectedItem
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
    DrawInterface(actualCat,actualOption,true)
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
    if ContextMenu_SelectedItem >= 19 then
        TempA=ContextMenu_SelectedItem-18
        AdjustY=TempA*24
    else
        AdjustY=0
    end
    Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY-AdjustY, 0, 0, 310, 22, 310, 22, 0, 255)
    for ItemToDraw = 1,ContextMenu_AllItems do
        TempY=ItemToDraw*24-AdjustY
        Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
    end
    TempXb=30-move*35
    textToPrint=xetLang[17]..ContextMenu[ContextMenu_SelectedItem].Author
    Font.ftPrint(fontSmall, TempXb, plusYValue+360, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[16]..ContextMenu[ContextMenu_SelectedItem].Folder
    Font.ftPrint(fontSmall, TempXb, plusYValue+375, 0, 340, 64, textToPrint, baseColorFull)
    textToPrint=xetLang[18]..ContextMenu[ContextMenu_SelectedItem].Version
    Font.ftPrint(fontSmall, TempXb, plusYValue+390, 0, 340, 64, textToPrint, baseColorFull)
    ----------------------------------------------------------------------------
    if themePreviewLoaded then
        TempVar2=255-moveb
        Graphics.drawImageExtended(themeInUse[-8], 200-TempXb, plusYValue+240, 0, 0, 352, 240, 352, 240, 0, TempVar2)
    end
    Screen.waitVblankStart()
    oldpad = pad;
    Screen.flip()
end

if themePreviewLoaded then
    Graphics.freeImage(themeInUse[-8])
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
oldpad = pad;

saveXEBCNF()