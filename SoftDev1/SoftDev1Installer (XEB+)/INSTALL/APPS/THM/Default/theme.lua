--------------------------------------------------
--                  THEME INFO                  --
--             (You can edit this!)             --
--------------------------------------------------
thmName = "Default"
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
categoriesFade = 100
columnsFade = 100
backgroundFilter = true
backgroundValueX = 256
backgroundValueY = 256
discIconSize = 40
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
themeAssetUserTable[1]="dash_overlay.png";
themeAssetUserFilter[1]=true;
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
end

function thmDrawBKGOL()
	Graphics.drawImageExtended(themeAssetUser[1], 352, plusYValue+240, 0, 0, backgroundValueX, backgroundValueY, 704, 480, 0, 255) -- Keep in mind that you should always use plusYValue+ in your Y value, since it is used to properly adjust the image in case of PAL
	drawTime(17,17)
end
--------------------------------------------------

--------------------------------------------------
--    DON'T EDIT OR REMOVE THE LINES BELLOW:    --
--------------------------------------------------
thmPL=true;             -- DO NOT REMOVE THIS LINE
end                     -- DO NOT REMOVE THIS LINE
--------------------------------------------------