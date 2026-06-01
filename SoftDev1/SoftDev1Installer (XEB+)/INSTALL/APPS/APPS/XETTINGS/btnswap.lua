XEBKeepInContextMenu=true
TransparencyAlpha=0
TempX=840
TempY=32
ContextMenu_AllItems=2
if buttonSettings == "X" then
    ContextMenu_SelectedItem = 2
end
if buttonSettings == "O" then
    ContextMenu_SelectedItem = 1
end
ContextMenu={};
ContextMenu[1] = {};
ContextMenu[1].Name = xebLang[117]
ContextMenu[2] = {};
ContextMenu[2].Name = xebLang[118]

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
    Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
    for ItemToDraw = 1,ContextMenu_AllItems do
        TempY=ItemToDraw*24
        Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
    end
    if ContextMenu_SelectedItem == 1 then
        Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 400, 64, xetLang[9], baseColorFull)
    else
        Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 400, 64, xetLang[8], baseColorFull)
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
    DrawInterface(actualCat,actualOption,true)
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
        Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 400, 64, xetLang[9], baseColorFull)
    else
        Font.ftPrint(fontSmall, 408, plusYValue+380, 0, 400, 64, xetLang[8], baseColorFull)
    end
    ----------------------------------------------------------------------------
    if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
        if ContextMenu_SelectedItem == 2 then
            buttonSettings="X"
            XEBBTNACCEPT="¶"
            PAD_ACCEPT=PAD_CROSS
            XEBBTNCANCEL="¬"
            PAD_CANCEL=PAD_CIRCLE
            XEBBTNSUBMEN="¨"
            PAD_SUBMEN=PAD_TRIANGLE
            XEBBTNEXTRAS="¯"
            PAD_EXTRAS=PAD_SQUARE
        elseif ContextMenu_SelectedItem == 1 then
            buttonSettings="O"
            XEBBTNACCEPT="¬"
            PAD_ACCEPT=PAD_CIRCLE
            XEBBTNCANCEL="¶"
            PAD_CANCEL=PAD_CROSS
            XEBBTNSUBMEN="¨"
            PAD_SUBMEN=PAD_TRIANGLE
            XEBBTNEXTRAS="¯"
            PAD_EXTRAS=PAD_SQUARE
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
    Graphics.drawImageExtended(themeInUse[-4], 549+movec, TempY, 0, 0, 310, 22, 310, 22, 0, 255)
    for ItemToDraw = 1,ContextMenu_AllItems do
        TempY=ItemToDraw*24
        Font.ftPrint(fontSmall, 408+movec, plusYValue+TempY, 0, 400, 64, ContextMenu[ItemToDraw].Name, baseColorFull)
    end
    if ContextMenu_SelectedItem == 1 then
        Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 400, 64, xetLang[9], baseColorFull)
    else
        Font.ftPrint(fontSmall, 408+movec, plusYValue+380, 0, 400, 64, xetLang[8], baseColorFull)
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
DrawInterface(actualCat,actualOption,true)
spinDisc()
thmDrawBKGOL()
oldpad = pad;

saveXEBCNF()