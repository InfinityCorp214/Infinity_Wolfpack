--------------------------------------------------
--                  THEME INFO                  --
--             (You can edit this!)             --
--------------------------------------------------
thmName = "The Forest"
thmVersion = "1.0"
thmCreator = "Daniel Santos, Berion, HWC"
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
baseColorFull = Color.new(255, 255, 255, 128)
baseColorFaded = Color.new(255, 255, 255, 100)
infoColor = Color.new(15, 15, 15, 128)
timeColor = Color.new(255, 255, 255, 128)
textColorOverShadow = Color.new(255, 255, 255, 128)
lineColorOverShadow = Color.new(255, 255, 255, 128)
categoriesFade = 128
columnsFade = 128
backgroundFilter = true
backgroundValueX = 128
backgroundValueY = 256
discIconSize = 40
hideShadowOnFade = true --if true, the disc's shadow will not be displayed when moving
howMuchRedrawTransparencyLayer = 3
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
themeAssetUserTable[1] = "10_Sky.png";
themeAssetUserTable[2] = "09_Forest.png";
themeAssetUserTable[3] = "08_Forest.png";
themeAssetUserTable[4] = "07_Forest.png";
themeAssetUserTable[5] = "06_Forest.png";
themeAssetUserTable[6] = "05_Particles.png";
themeAssetUserTable[7] = "04_Forest.png";
themeAssetUserTable[8] = "03_Particles.png";
themeAssetUserTable[9] = "02_Bushes.png";
themeAssetUserTable[10] = "01_Mist.png";
themeAssetUserTable[11] = "AA_SpriteA.png";
themeAssetUserTable[12] = "AA_SpriteB.png";
themeAssetUserTable[13] = "AA_SpriteC.png";
themeAssetUserTable[14] = "AA_SpriteD.png";
themeAssetUserTable[15] = "AA_SpriteE.png";
themeAssetUserTable[16] = "AA_SpriteF.png";
themeAssetUserTable[17] = "AA_SpriteG.png";
themeAssetUserTable[18] = "AA_SpriteH.png";
themeAssetUserFilter[1] = true
themeAssetUserFilter[2] = true
themeAssetUserFilter[3] = true
themeAssetUserFilter[4] = true
themeAssetUserFilter[5] = true
themeAssetUserFilter[6] = true
themeAssetUserFilter[7] = true
themeAssetUserFilter[8] = true
themeAssetUserFilter[9] = true
themeAssetUserFilter[10] = true
themeAssetUserFilter[11] = false
themeAssetUserFilter[12] = false
themeAssetUserFilter[13] = false
themeAssetUserFilter[14] = false
themeAssetUserFilter[15] = false
themeAssetUserFilter[16] = false
themeAssetUserFilter[17] = false
themeAssetUserFilter[18] = false

--------------------------------------------------

--------------------------------------------------
--     BLANK SPACE FOR WHATEVER YOU WANNA DO    --
--             (You can edit this!)             --
--------------------------------------------------
sky_pos = 0
sky_pos2 = -703.5
sky_speed = 0.05
houses4_pos = 0
houses4_pos2 = -703.5
houses4_speed = 0.20
houses3_pos = 0
houses3_pos2 = -703.5
houses3_speed = 0.35
houses2_pos = 0
houses2_pos2 = -703.5
houses2_speed = 0.42
houses1_pos = 0
houses1_pos2 = -703.5
houses1_speed = 0.50
wall_pos = 0
wall_pos2 = -703.5
wall_speed = 0.60
road_pos = 0
road_pos2 = -703.5
road_speed = 0.65
function doSceneryLoop(sc_pos, sc_speed)
  sc_pos = sc_pos + sc_speed
  if (sc_pos >= 703.5) then 
    sc_pos = -703.5
  end
  return sc_pos, sc_speed
end
drawChar=1
function drawCharLoop(drawCharNow)
	if drawCharNow == 1 or drawCharNow == 2 then
		Graphics.drawImage(themeAssetUser[11], 475, plusYValue+272)
	elseif drawCharNow == 3 or drawCharNow == 4 then
		Graphics.drawImage(themeAssetUser[12], 475, plusYValue+272)
	elseif drawCharNow == 5 or drawCharNow == 6 then
		Graphics.drawImage(themeAssetUser[13], 475, plusYValue+272)
	elseif drawCharNow == 7 or drawCharNow == 8 then
		Graphics.drawImage(themeAssetUser[14], 475, plusYValue+272)
	elseif drawCharNow == 9 or drawCharNow == 10 then
		Graphics.drawImage(themeAssetUser[15], 475, plusYValue+272)
	elseif drawCharNow == 11 or drawCharNow == 12 then
		Graphics.drawImage(themeAssetUser[16], 475, plusYValue+272)
	elseif drawCharNow == 13 or drawCharNow == 14 then
		Graphics.drawImage(themeAssetUser[17], 475, plusYValue+272)
	elseif drawCharNow == 15 or drawCharNow == 16 then
		Graphics.drawImage(themeAssetUser[18], 475, plusYValue+272)
	end
	retdrawChar = drawCharNow+1
	if retdrawChar == 17 then
		retdrawChar = 1;
	end
	return retdrawChar;
end
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
	Graphics.drawImageExtended(themeAssetUser[1], sky_pos+352, plusYValue+240, 0, 0, 64, 64, 704, 484, 0, 255)
	sky_pos, sky_speed = doSceneryLoop(sky_pos, sky_speed)
	Graphics.drawImageExtended(themeAssetUser[1], sky_pos2+352, plusYValue+240, 0, 0, 64, 64, 704, 484, 0, 255)
	sky_pos2, sky_speed = doSceneryLoop(sky_pos2, sky_speed)
	Graphics.drawImageExtended(themeAssetUser[2], houses4_pos+352, plusYValue+240, 0, 0, 64, 64, 704, 484, 0, 255)
	houses4_pos, houses4_speed = doSceneryLoop(houses4_pos, houses4_speed)
	Graphics.drawImageExtended(themeAssetUser[2], houses4_pos2+352, plusYValue+240, 0, 0, 64, 64, 704, 484, 0, 255)
	houses4_pos2, houses4_speed = doSceneryLoop(houses4_pos2, houses4_speed)
	Graphics.drawImageExtended(themeAssetUser[3], houses3_pos+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
  	houses3_pos, houses3_speed = doSceneryLoop(houses3_pos, houses3_speed)
  	Graphics.drawImageExtended(themeAssetUser[3], houses3_pos2+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
  	houses3_pos2, houses3_speed = doSceneryLoop(houses3_pos2, houses3_speed)
  	Graphics.drawImageExtended(themeAssetUser[4], houses2_pos+352, plusYValue+240, 0, 0, 256, 128, 704, 484, 0, 255)
	houses2_pos, houses2_speed = doSceneryLoop(houses2_pos, houses2_speed)
	Graphics.drawImageExtended(themeAssetUser[4], houses2_pos2+352, plusYValue+240, 0, 0, 256, 128, 704, 484, 0, 255)
	houses2_pos2, houses2_speed = doSceneryLoop(houses2_pos2, houses2_speed)
	Graphics.drawImageExtended(themeAssetUser[5], houses1_pos+352, plusYValue+240, 0, 0, 256, 128, 704, 484, 0, 255)
	houses1_pos, houses1_speed = doSceneryLoop(houses1_pos, houses1_speed)
	Graphics.drawImageExtended(themeAssetUser[5], houses1_pos2+352, plusYValue+240, 0, 0, 256, 128, 704, 484, 0, 255)
	houses1_pos2, houses1_speed = doSceneryLoop(houses1_pos2, houses1_speed)
	drawChar = drawCharLoop(drawChar)
	Graphics.drawImageExtended(themeAssetUser[6], wall_pos+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
	wall_pos, wall_speed = doSceneryLoop(wall_pos, wall_speed)
	Graphics.drawImageExtended(themeAssetUser[6], wall_pos2+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
	wall_pos2, wall_speed = doSceneryLoop(wall_pos2, wall_speed)
	Graphics.drawImageExtended(themeAssetUser[7], road_pos+352, plusYValue+240, 0, 0, 256, 256, 704, 484, 0, 255)
	road_pos, road_speed = doSceneryLoop(road_pos, road_speed)
	Graphics.drawImageExtended(themeAssetUser[7], road_pos2+352, plusYValue+240, 0, 0, 256, 256, 704, 484, 0, 255)
	road_pos2, road_speed = doSceneryLoop(road_pos2, road_speed)
	Graphics.drawImageExtended(themeAssetUser[8], road_pos+352, plusYValue+240, 0, 0, 8, 8, 704, 484, 0, 255)
	road_pos, road_speed = doSceneryLoop(road_pos, road_speed)
	Graphics.drawImageExtended(themeAssetUser[8], road_pos2+352, plusYValue+240, 0, 0, 8, 8, 704, 484, 0, 255)
	road_pos2, road_speed = doSceneryLoop(road_pos2, road_speed)
	Graphics.drawImageExtended(themeAssetUser[9], road_pos+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
	road_pos, road_speed = doSceneryLoop(road_pos, road_speed)
	Graphics.drawImageExtended(themeAssetUser[9], road_pos2+352, plusYValue+240, 0, 0, 128, 128, 704, 484, 0, 255)
	road_pos2, road_speed = doSceneryLoop(road_pos2, road_speed)
	Graphics.drawImageExtended(themeInUse[-3], 352, plusYValue+240, 0, 0, 8, 8, 704, 484, 0, 255)
end

function thmDrawBKGOL()
	Graphics.drawImageExtended(themeAssetUser[10], 352, plusYValue+240, 0, 0, 256, 256, 708, 484, 0, 255)
	drawTime(17,17)
end
--------------------------------------------------

--------------------------------------------------
--    DON'T EDIT OR REMOVE THE LINES BELLOW:    --
--------------------------------------------------
thmPL=true;             -- DO NOT REMOVE THIS LINE
end                     -- DO NOT REMOVE THIS LINE
--------------------------------------------------