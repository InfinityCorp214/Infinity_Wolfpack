XEBKeepInContextMenu=true
TransparencyAlpha=0
TempX=840
TempY=32
ContextMenu_AllItems=2
oldmode = XEBVideoMode;
if XEBVideoMode == "NTSC" then
    ContextMenu_SelectedItem = 1
end
if XEBVideoMode == "PAL" then
    ContextMenu_SelectedItem = 2
end
oldVideoMode = XEBVideoMode
ContextMenu={};
ContextMenu[1] = {};
ContextMenu[1].Name = "NTSC"
ContextMenu[2] = {};
ContextMenu[2].Name = "PAL"


function restoreOldVmode()
    XEBVideoMode = oldmode;
    videoMode=XEBVideoMode;
    if videoMode=="NTSC" then
        Screen.setMode(NTSC, 704, 480)
        plusYValue=0;
        maxYvalue=480;
    else
        Screen.setMode(PAL, 704, 480)
        plusYValue=0;
        maxYvalue=480;
    end
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
    Font.ftPrint(fontSmall, 408+movec, plusYValue+360, 0, 512, 128, xetLang[49], baseColorFull)
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
    Font.ftPrint(fontSmall, 408, plusYValue+360, 0, 512, 128, xetLang[49], baseColorFull)
    ----------------------------------------------------------------------------
    if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
        if ContextMenu_SelectedItem == 1 then
            XEBVideoMode = "NTSC"
        else
            XEBVideoMode = "PAL"
        end
        videoMode=XEBVideoMode;
        videoModeChanged=true
        if videoMode=="NTSC" then
            Screen.setMode(NTSC, 704, 480)
            plusYValue=0;
            maxYvalue=480;
        else
            Screen.setMode(PAL, 704, 480)
            plusYValue=0;
            maxYvalue=480;
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
        videoModeChanged=false
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
    Font.ftPrint(fontSmall, 408+movec, plusYValue+360, 0, 512, 128, xetLang[49], baseColorFull)
    ----------------------------------------------------------------------------
    Screen.waitVblankStart()
    oldpad = pad;
    Screen.flip()
end
if videoModeChanged then
    Timer1 = Timer.new()
    for i = 1, 10 do
        pad = Pads.get()
        Screen.clear()
        ib=i*25
        ic=i*10
        if backgroundFilter then
            Graphics.drawImageExtended(themeInUse[-1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
        else
            Graphics.drawImage(themeInUse[-1], 0, plusYValue+0)
        end
        thmDrawBKG()
        DrawInterface(actualCat,actualOption,true)
        spinDisc()
        thmDrawBKGOL()
        Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
        Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,ic))
        Graphics.drawRect(352, 82, 704, 2, Color.new(255,255,255,ib))
        Graphics.drawRect(352, 120, 704, 2, Color.new(255,255,255,ib))
        Graphics.drawRect(352, 200, 704, 2, Color.new(255,255,255,ib))
        Font.ftPrint(fontBig, 352, 140, 11, 512, 64, xetLang[47], Color.new(255,255,255,64))
        Font.ftPrint(fontBig, 352, 170, 11, 512, 64, xetLang[48], Color.new(255,255,255,ib))
        Font.ftPrint(fontBig, 352, 102, 11, 512, 64, xetLang[46], Color.new(255,255,255,ib))
        Screen.waitVblankStart()
        Screen.flip()
        oldpad = pad;
    end
    selectedItem=2
    keepInMenu=true
    while keepInMenu do
        waitingTime = Timer.getTime(Timer1)
        if waitingTime >= 7000 then
            timeLeft="1"
        elseif waitingTime >= 6000 then
            timeLeft="2"
        elseif waitingTime >= 5000 then
            timeLeft="3"
        elseif waitingTime >= 4000 then
            timeLeft="4"
        elseif waitingTime >= 3000 then
            timeLeft="5"
        elseif waitingTime >= 2000 then
            timeLeft="6"
        elseif waitingTime >= 1000 then
            timeLeft="7"
        else
            timeLeft="8"
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
        Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
        Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100))
        Graphics.drawRect(352, 82, 704, 2, Color.new(255,255,255,255))
        Graphics.drawRect(352, 120, 704, 2, Color.new(255,255,255,255))
        Graphics.drawRect(352, 200, 704, 2, Color.new(255,255,255,255))
        Font.ftPrint(fontBig, 352, 102, 11, 512, 64, xetLang[46], Color.new(255,255,255,255))
        if selectedItem == 1 then
            Font.ftPrint(fontBig, 352, 140, 11, 512, 64, xetLang[47], Color.new(255,255,255,255))
            Font.ftPrint(fontBig, 352, 170, 11, 512, 64, xetLang[48], Color.new(255,255,255,64))
        else
            Font.ftPrint(fontBig, 352, 140, 11, 512, 64, xetLang[47], Color.new(255,255,255,64))
            Font.ftPrint(fontBig, 352, 170, 11, 512, 64, xetLang[48], Color.new(255,255,255,255))
        end
        Font.ftPrint(fontBig, 352, 228, 11, 704, 64, xetLang[50]..timeLeft..xetLang[51], Color.new(255,255,255,255))
        if Pads.check(pad, PAD_UP) and not Pads.check(oldpad, PAD_UP) then
            selectedItem=1
        end
        if Pads.check(pad, PAD_DOWN) and not Pads.check(oldpad, PAD_DOWN) then
            selectedItem=2
        end
        if waitingTime >= 8000 then
            restoreOldVmode()
            keepInMenu=false
        end
        if Pads.check(pad, PAD_CANCEL) and not Pads.check(oldpad, PAD_CANCEL) then
            restoreOldVmode()
            keepInMenu=false
        end
        if Pads.check(pad, PAD_ACCEPT) and not Pads.check(oldpad, PAD_ACCEPT) then
            if selectedItem == 2 then
                restoreOldVmode()
                keepInMenu=false
            else
                saveXEBCNF()
                keepInMenu=false
            end
        end
        Screen.waitVblankStart()
        Screen.flip()
        oldpad = pad;
    end
    Timer.destroy(Timer1)
    for i = 1, 10 do
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
        ib=i*25
        ic=i*6
        id=i*10
        Graphics.drawImageExtended(themeInUse[-3], 352, 240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255)
        Graphics.drawRect(352, 240, 704, 480, Color.new(0,0,0,100-id))
        Graphics.drawRect(352, 82, 704, 2, Color.new(255,255,255,255-ib))
        Graphics.drawRect(352, 120, 704, 2, Color.new(255,255,255,255-ib))
        Graphics.drawRect(352, 200, 704, 2, Color.new(255,255,255,255-ib))
        Font.ftPrint(fontBig, 352, 102, 11, 512, 64, xetLang[46], Color.new(255,255,255,255-ib))
        if selectedItem == 1 then
            Font.ftPrint(fontBig, 352, 140, 11, 512, 64, xetLang[47], Color.new(255,255,255,255-ib))
            Font.ftPrint(fontBig, 352, 170, 11, 512, 64, xetLang[48], Color.new(255,255,255,64-ic))
        else
            Font.ftPrint(fontBig, 352, 140, 11, 512, 64, xetLang[47], Color.new(255,255,255,64-ic))
            Font.ftPrint(fontBig, 352, 170, 11, 512, 64, xetLang[48], Color.new(255,255,255,255-ib))
        end
        Screen.waitVblankStart()
        Screen.flip()
        oldpad = pad;
    end
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