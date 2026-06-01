--------------------------------------------------
--                  THEME INFO                  --
--             (You can edit this!)             --
--------------------------------------------------
thmName = "The #XEBPlus Game"
thmVersion = "1.0"
thmCreator = "Berion, Howling Wolf & Chelsea. Character sprites by: https://www.deviantart.com/little-pebbles/. Rock by: FlatRedBall"
thmforXEBPlus = "XEBPLUS-2022-09"
--------------------------------------------------

--------------------------------------------------
--     DON'T EDIT OR REMOVE THE LINE BELLOW     --
--------------------------------------------------
if thmLoad == true then -- DO NOT REMOVE THIS LINE
--------------------------------------------------

--------------------------------------------------
--               COLORS / COLOURS               --
--             (You can edit this!)             --
--------------------------------------------------
baseColorFull = Color.new(27, 64, 105, 128)
baseColorFaded = Color.new(27, 64, 105, 0)
infoColor = Color.new(35, 27, 7, 128)
timeColor = Color.new(255, 255, 255, 128)
textColorOverShadow = Color.new(255, 255, 255, 128)
lineColorOverShadow = Color.new(255, 255, 255, 128)
categoriesFade = 256
columnsFade = 256
backgroundFilter = true
backgroundValueX = 256
backgroundValueY = 256
discIconSize = 42
hideShadowOnFade = true --if true, the disc's shadow will not be displayed when moving
howMuchRedrawTransparencyLayer = 2
--------------------------------------------------

--------------------------------------------------
--                 EXTRA ASSETS                 --
--             (You can edit this!)             --
--------------------------------------------------
-- Create a table with the names and extensions --
-- of every extra asset you need, but remember  --
-- RAM is precious. Also, remember to use ""    --
-- and make the numbers sequential.             --
--------------------------------------------------
themeAssetUserTable[1]="TheRock.png";
themeAssetUserFilter[1]=false;
themeAssetUserTable[2]="SpA.png";
themeAssetUserFilter[2]=false;
themeAssetUserTable[3]="SpB.png";
themeAssetUserFilter[3]=false;
themeAssetUserTable[4]="SpC.png";
themeAssetUserFilter[4]=false;
themeAssetUserTable[5]="SpD.png";
themeAssetUserFilter[5]=false;
themeAssetUserTable[6]="Grass.png";
themeAssetUserFilter[6]=false;
drawChar=1
isJumping=0
jumpheight=20
jumpdirection="up"
colisionDone=false
blinkState=1
actualBlink=1
waitCounter=1
rockOnMap=-175
firstRockOnMap=true
scoreCounter=0
function drawCharLoop(drawCharNow)
	if isJumping == 0 then
		drawCharNowA = drawCharNow / 5
		drawCharNowA = XEBMathRound(drawCharNowA)
		if colisionDone == true and blinkState == 1 then
			if drawCharNowA == 1 or drawCharNowA == 0 then
				Graphics.drawImage(themeAssetUser[2], 37, plusYValue+252, 72)
			elseif drawCharNowA == 2 then
				Graphics.drawImage(themeAssetUser[3], 37, plusYValue+252, 72)
			elseif drawCharNowA == 3 then
				Graphics.drawImage(themeAssetUser[2], 37, plusYValue+252, 72)
			elseif drawCharNowA == 4 then
				Graphics.drawImage(themeAssetUser[4], 37, plusYValue+252, 72)
			end
			waitCounter = waitCounter + 1
			if waitCounter == 10 then
				actualBlink = actualBlink + 1
				blinkState = 2
				waitCounter = 1
			end
			if actualBlink == 10 then
				Pads.rumble(0 ,0)
				colisionDone=false
				blinkState=1
				actualBlink=1
				waitCounter=1
			end
		else
			if drawCharNowA == 1 or drawCharNowA == 0 then
				Graphics.drawImage(themeAssetUser[2], 37, plusYValue+252)
			elseif drawCharNowA == 2 then
				Graphics.drawImage(themeAssetUser[3], 37, plusYValue+252)
			elseif drawCharNowA == 3 then
				Graphics.drawImage(themeAssetUser[2], 37, plusYValue+252)
			elseif drawCharNowA == 4 then
				Graphics.drawImage(themeAssetUser[4], 37, plusYValue+252)
			end
			if colisionDone then
				waitCounter = waitCounter + 1
				if waitCounter == 10 then
					actualBlink = actualBlink + 1
					blinkState = 1
					waitCounter = 1
				end
				if actualBlink == 10 then
					Pads.rumble(0 ,0)
					colisionDone=false
					blinkState=1
					actualBlink=1
					waitCounter=1
				end
			end
		end
		retdrawChar = drawCharNow+1
		if retdrawChar == 17 then
			retdrawChar = 1;
		end
		return retdrawChar;
	else
		if colisionDone == true and blinkState == 1 then
			if jumpdirection == "up" then
				Graphics.drawImage(themeAssetUser[5], 37, plusYValue+252-jumpheight, 72)
				jumpheight=jumpheight+11
				if jumpheight > 175 then
					jumpdirection="down"
				end
			else
				Graphics.drawImage(themeAssetUser[5], 37, plusYValue+252-jumpheight, 72)
				jumpheight=jumpheight-11
				if jumpheight == 20 then
					isJumping=0
					jumpdirection = "up"
				end
			end
			waitCounter = waitCounter + 1
			if waitCounter == 10 then
				actualBlink = actualBlink + 1
				blinkState = 2
				waitCounter = 1
			end
			if actualBlink == 10 then
				Pads.rumble(0 ,0)
				colisionDone=false
				blinkState=1
				actualBlink=1
				waitCounter=1
			end
		else
			if jumpdirection == "up" then
				Graphics.drawImage(themeAssetUser[5], 37, plusYValue+252-jumpheight)
				jumpheight=jumpheight+11
				if jumpheight > 175 then
					jumpdirection="down"
				end
			else
				Graphics.drawImage(themeAssetUser[5], 37, plusYValue+252-jumpheight)
				jumpheight=jumpheight-11
				if jumpheight == 20 then
					isJumping=0
					jumpdirection = "up"
				end
			end
			if colisionDone then
				waitCounter = waitCounter + 1
				if waitCounter == 10 then
					actualBlink = actualBlink + 1
					blinkState = 1
					waitCounter = 1
				end
				if actualBlink == 10 then
					Pads.rumble(0 ,0)
					colisionDone=false
					blinkState=1
					actualBlink=1
					waitCounter=1
				end
			end
		end
		return 1;
	end
end
floorPosition=0
function drawGrass()
	for elsuelo=0, 14 do
		elPlus=elsuelo*64
		valorSpriteX=elPlus+floorPosition
		Graphics.drawImage(themeAssetUser[6], valorSpriteX, plusYValue+352)
	end
	floorPosition=floorPosition-5.7
	if floorPosition < -64 then
		floorPosition = floorPosition + 64
	end
end
--------------------------------------------------

--------------------------------------------------
--     BLANK SPACE FOR WHATEVER YOU WANNA DO    --
--             (You can edit this!)             --
--------------------------------------------------

--------------------------------------------------

--------------------------------------------------
--             BACKGROUND FUNCTIONS             --
--             (You can edit this!)             --
--------------------------------------------------
-- Here you can do a bit of magic on the theme. --
-- There will be two functions for you to edit  --
-- and they will be used to draw the background --
-- and the background overlay of the theme.     --
-- By default, background.png will always be    --
-- drawn, then it will do thmDrawBKG(), then    --
-- the XEB+ interface and then thmDrawBKGOL().  --
--------------------------------------------------
function thmDrawBKG()
	drawTime(17,17)
end

function thmDrawBKGOL()
	rockOnMap = rockOnMap - 5.7
	if rockOnMap < 0.01 and rockOnMap > -5.77 then
		scoreCounter=scoreCounter+1
	end
	if rockOnMap < -128 then
		if firstRockOnMap then
			rockOnMap = 1750
			firstRockOnMap = false
			scoreCounter=0
		else
			rockOnMap = math.random(780,1750)
		end
	end
	if jumpheight < 50 and rockOnMap < 105 and rockOnMap > 0 and colisionDone == false then
		colisionDone = true
	end
	drawGrass()
	Graphics.drawImage(themeAssetUser[1], rockOnMap, plusYValue+315)
	drawChar=drawCharLoop(drawChar)
	thmpadlx, thmpadly = Pads.getLeftStick()
	if thmpadly < -100 and isJumping == 0 then
		isJumping = 1
	end
	if colisionDone then
		Pads.rumble(1 ,255)
		scoreCounter=0
	end
	Font.ftPrint(fontSmall, 615, plusYValue+444, 0, 64, 64, "Score: "..scoreCounter, infoColor)
	--Graphics.drawImageExtended(themeAssetUser[1], 352, plusYValue+393, 0, 0, 1, 173, 704, 173, 0, 255)
end

function thmExit()
	Pads.rumble(0 ,0)
end
--------------------------------------------------

--------------------------------------------------
--    DON'T EDIT OR REMOVE THE LINES BELLOW:    --
--------------------------------------------------
thmPL=true;             -- DO NOT REMOVE THIS LINE
end                     -- DO NOT REMOVE THIS LINE
--------------------------------------------------