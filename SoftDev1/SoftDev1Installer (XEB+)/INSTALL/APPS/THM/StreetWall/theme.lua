--------------------------------------------------
--                  THEME INFO                  --
--             (You can edit this!)             --
--------------------------------------------------
thmName = "Street Wall"
thmVersion = "1.0"
thmCreator = "Berion, Howling Wolf & Chelsea"
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
baseColorFaded = Color.new(255, 255, 255, 64)
infoColor = Color.new(255, 255, 255, 128)
timeColor = Color.new(255, 255, 255, 128)
textColorOverShadow = Color.new(255, 255, 255, 128)
lineColorOverShadow = Color.new(255, 255, 255, 128)
categoriesFade = 77
columnsFade = 77
backgroundFilter = true
backgroundValueX = 256
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
themeAssetUserTable[1]="TEX01.png";
themeAssetUserFilter[1]=true;
themeAssetUserTable[2]="TEX02.png";
themeAssetUserFilter[2]=true;
themeAssetUserTable[3]="TEX03.png";
themeAssetUserFilter[3]=true;
themeAssetUserTable[4]="TEX04.png";
themeAssetUserFilter[4]=false;
themeAssetUserTable[5]="TEX05.png";
themeAssetUserFilter[5]=false;
--------------------------------------------------

--------------------------------------------------
--     BLANK SPACE FOR WHATEVER YOU WANNA DO    --
--             (You can edit this!)             --
--------------------------------------------------
thm_positionCorner=330--445
thm_widthCorner=77--200
imanoMode="Z"
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
	if imanoMode=="MainInterface" and actualCat == 1 then
		thm_positionCorner=330+25+25
		thm_widthCorner=77+23+23
	elseif imanoMode=="MainInterface" and actualCat == 2 then
		thm_positionCorner=330+25
		thm_widthCorner=77+23
	elseif imanoMode=="MainInterface" and actualCat == 3 then
		thm_positionCorner=330
		thm_widthCorner=77
	elseif imanoMode=="MainInterface" and actualCat == 4 then
		thm_positionCorner=330-25
		thm_widthCorner=77-23
	elseif imanoMode=="MainInterface" and actualCat == 5 then
		thm_positionCorner=330-25-25
		thm_widthCorner=77-23-23
	elseif imanoMode=="MainInterface" and actualCat == 6 then
		thm_positionCorner=330-25-25-25
		thm_widthCorner=77-23-23-23
	elseif imanoMode=="MainInterfaceLeft" then
		thm_positionCorner=thm_positionCornerPrev+8;
		thm_widthCorner=thm_widthCornerPrev+7;
	elseif imanoMode=="MainInterfaceRight" then
		thm_positionCorner=thm_positionCornerPrev-8;
		thm_widthCorner=thm_widthCornerPrev-7;
	end
	
	thm_imanoSanPos = thm_widthCorner/2;
	thm_imanoSanPos = thm_positionCorner - thm_imanoSanPos;
	thm_imanoSanPos = thm_imanoSanPos - 196;
	thm_imanoIchiPos = thm_widthCorner/2;
	thm_imanoIchiPos = thm_positionCorner + thm_imanoIchiPos;
	thm_imanoIchiPos = thm_imanoIchiPos + 210;
	Graphics.drawImageExtended(themeAssetUser[3], thm_imanoSanPos+64, plusYValue+240, 0, 0, 256, 256, 400, 480, 0, 255)
	Graphics.drawImageExtended(themeAssetUser[2], thm_positionCorner+64, plusYValue+240, 0, 0, 128, 256, thm_widthCorner, 480, 0, 255)
	Graphics.drawImageExtended(themeAssetUser[1], thm_imanoIchiPos+64, plusYValue+240, 0, 0, 256, 256, 420, 480, 0, 255)
	thm_positionCornerPrev=thm_positionCorner;
	thm_widthCornerPrev=thm_widthCorner;
end

function thmDrawBKGOL()
	Graphics.drawImageExtended(themeAssetUser[4], 352, plusYValue+393, 0, 0, 1, 173, 704, 173, 0, 255)
	Graphics.drawImageExtended(themeAssetUser[5], 352, plusYValue+52, 0, 0, 1, 123, 704, 123, 0, 255)
	drawTime(17,17)
end
--------------------------------------------------

--------------------------------------------------
--    DON'T EDIT OR REMOVE THE LINES BELLOW:    --
--------------------------------------------------
thmPL=true;             -- DO NOT REMOVE THIS LINE
end                     -- DO NOT REMOVE THIS LINE
--------------------------------------------------