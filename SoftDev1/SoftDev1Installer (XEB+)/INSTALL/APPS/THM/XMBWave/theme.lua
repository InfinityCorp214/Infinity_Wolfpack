--------------------------------------------------
--                  THEME INFO                  --
--             (You can edit this!)             --
--------------------------------------------------
thmName = "XMB Wave"
thmVersion = "1.0"
thmCreator = "Berion, Howling Wolf & Chelsea, Julia"
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
baseColorFaded = Color.new(255, 255, 255, 5)
infoColor = Color.new(255, 255, 255, 128)
timeColor = Color.new(255, 255, 255, 128)
textColorOverShadow = Color.new(255, 255, 255, 128)
lineColorOverShadow = Color.new(255, 255, 255, 128)
categoriesFade = 52
columnsFade = 15
backgroundFilter = true
backgroundValueX = 128
backgroundValueY = 128
discIconSize = 40
hideShadowOnFade = true --if true, the disc's shadow will not be displayed when moving
howMuchRedrawTransparencyLayer = 5
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
themeAssetUserTable[1]="ThemeWave.png";
themeAssetUserFilter[1]=true;
themeAssetUserTable[2]="ThemeSparkleA.png";
themeAssetUserFilter[2]=true;
themeAssetUserTable[3]="ThemeSparkleB.png";
themeAssetUserFilter[3]=true;
themeAssetUserTable[4]="ThemeSparkleC.png";
themeAssetUserFilter[4]=true;
themeAssetUserTable[5]="ThemeSparkleD.png";
themeAssetUserFilter[5]=true;
themeAssetUserTable[6]="ThemeRound.png";
themeAssetUserFilter[6]=true;
--------------------------------------------------

--------------------------------------------------
--     BLANK SPACE FOR WHATEVER YOU WANNA DO    --
--             (You can edit this!)             --
--------------------------------------------------
ThemeXMBWavePositionA=0
ThemeXMBWaveSpeedA=7.73
ThemeXMBWavePositionB=235
ThemeXMBWaveSpeedB=3.55
ThemeXMBWavePositionC=175
ThemeXMBWaveSpeedC=1.21
ThemeXMBSparklePositionA=0
ThemeXMBSparkleSpeedA=0.77
ThemeXMBSparklePositionB=0
ThemeXMBSparkleSpeedB=1.15
ThemeXMBSparklePositionC=0
ThemeXMBSparkleSpeedC=0.32
ThemeXMBSparklePositionD=0
ThemeXMBSparkleSpeedD=1.52
ThemeSparkleAlphaA_Value=25
ThemeSparkleAlphaB_Value=175
ThemeSparkleAlphaC_Value=155
ThemeSparkleAlphaD_Value=205
ThemeSparkleAlphaA_Dir=1
ThemeSparkleAlphaB_Dir=0
ThemeSparkleAlphaC_Dir=1
ThemeSparkleAlphaD_Dir=0
ThemeBallRotation=0
ThemeBallRotationSpeed=0.015
ThemeBallAlphaValue=0
ThemeBallAlphaDir=1
ThemeBallAlphaSpeed=1
ThemeBallAlphaMax=152
ThemeXMBWaveDirC=0
ThemeXMBWaveDirB=0
ThemeXMBWaveDirA=0
ThemeXMBWaveChangerC=0.37
ThemeXMBWaveChangerB=1.27
ThemeXMBWaveChangerA=1.75
ThemeXMBWaveValueC=35
ThemeXMBWaveValueB=125
ThemeXMBWaveValueA=175
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
	Graphics.drawImageExtended(themeAssetUser[6], 352, plusYValue+240, 0, 0, 128, 128, 870, 870, ThemeBallRotation, ThemeBallAlphaValue)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionC-352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueC)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionC+352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueC)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionB-352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueB)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionB+352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueB)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionA-352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueA)
	Graphics.drawImageExtended(themeAssetUser[1], ThemeXMBWavePositionA+352, plusYValue+227, 0, 0, 512, 256, 704, 256, 0, ThemeXMBWaveValueA)
	Graphics.drawImageExtended(themeAssetUser[2], ThemeXMBSparklePositionA-352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaA_Value)
	Graphics.drawImageExtended(themeAssetUser[2], ThemeXMBSparklePositionA+352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaA_Value)
	Graphics.drawImageExtended(themeAssetUser[3], ThemeXMBSparklePositionB-352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaB_Value)
	Graphics.drawImageExtended(themeAssetUser[3], ThemeXMBSparklePositionB+352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaB_Value)
	Graphics.drawImageExtended(themeAssetUser[4], ThemeXMBSparklePositionC-352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaC_Value)
	Graphics.drawImageExtended(themeAssetUser[4], ThemeXMBSparklePositionC+352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaC_Value)
	Graphics.drawImageExtended(themeAssetUser[5], ThemeXMBSparklePositionD-352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaD_Value)
	Graphics.drawImageExtended(themeAssetUser[5], ThemeXMBSparklePositionD+352, plusYValue+240, 0, 0, 128, 128, 704, 480, 0, ThemeSparkleAlphaD_Value)
	
	if ThemeXMBWaveValueC >= 35 then
		ThemeXMBWaveDirC = 0
		ThemeXMBWaveValueC = 35
	elseif ThemeXMBWaveValueC <= 15 then
		ThemeXMBWaveDirC = 1
		ThemeXMBWaveValueC = 15
	end
	if ThemeXMBWaveDirC == 1 then
		ThemeXMBWaveValueC=ThemeXMBWaveValueC+ThemeXMBWaveChangerC
	else
		ThemeXMBWaveValueC=ThemeXMBWaveValueC-ThemeXMBWaveChangerC
	end
	
	if ThemeXMBWaveValueB >= 125 then
		ThemeXMBWaveDirB = 0
		ThemeXMBWaveValueB = 125
	elseif ThemeXMBWaveValueB <= 75 then
		ThemeXMBWaveDirB = 1
		ThemeXMBWaveValueB = 75
	end
	if ThemeXMBWaveDirB == 1 then
		ThemeXMBWaveValueB=ThemeXMBWaveValueB+ThemeXMBWaveChangerB
	else
		ThemeXMBWaveValueB=ThemeXMBWaveValueB-ThemeXMBWaveChangerB
	end
	
	if ThemeXMBWaveValueA >= 175 then
		ThemeXMBWaveDirA = 0
		ThemeXMBWaveValueA = 175
	elseif ThemeXMBWaveValueA <= 125 then
		ThemeXMBWaveDirA = 1
		ThemeXMBWaveValueA = 125
	end
	if ThemeXMBWaveDirA == 1 then
		ThemeXMBWaveValueA=ThemeXMBWaveValueA+ThemeXMBWaveChangerA
	else
		ThemeXMBWaveValueA=ThemeXMBWaveValueA-ThemeXMBWaveChangerA
	end
	
	ThemeXMBWavePositionA=ThemeXMBWavePositionA+ThemeXMBWaveSpeedA
	if ThemeXMBWavePositionA >= 704 then
		ThemeXMBWavePositionA = ThemeXMBWavePositionA - 704
	end
	ThemeXMBWavePositionB=ThemeXMBWavePositionB+ThemeXMBWaveSpeedB
	if ThemeXMBWavePositionB >= 704 then
		ThemeXMBWavePositionB = ThemeXMBWavePositionB - 704
	end
	ThemeXMBWavePositionC=ThemeXMBWavePositionC+ThemeXMBWaveSpeedC
	if ThemeXMBWavePositionC >= 704 then
		ThemeXMBWavePositionC = ThemeXMBWavePositionC - 704
	end
	ThemeXMBSparklePositionA=ThemeXMBSparklePositionA+ThemeXMBSparkleSpeedA
	if ThemeXMBSparklePositionA >= 704 then
		ThemeXMBSparklePositionA = ThemeXMBSparklePositionA - 704
	end
	ThemeXMBSparklePositionB=ThemeXMBSparklePositionB+ThemeXMBSparkleSpeedB
	if ThemeXMBSparklePositionB >= 704 then
		ThemeXMBSparklePositionB = ThemeXMBSparklePositionB - 704
	end
	ThemeXMBSparklePositionC=ThemeXMBSparklePositionC+ThemeXMBSparkleSpeedC
	if ThemeXMBSparklePositionC >= 704 then
		ThemeXMBSparklePositionC = ThemeXMBSparklePositionC - 704
	end
	ThemeXMBSparklePositionD=ThemeXMBSparklePositionD+ThemeXMBSparkleSpeedD
	if ThemeXMBSparklePositionD >= 704 then
		ThemeXMBSparklePositionD = ThemeXMBSparklePositionD - 704
	end
	
	if ThemeSparkleAlphaA_Dir == 1 then
		ThemeSparkleAlphaA_Value=ThemeSparkleAlphaA_Value+5
	else
		ThemeSparkleAlphaA_Value=ThemeSparkleAlphaA_Value-5
	end
	if ThemeSparkleAlphaA_Value >= 255 then
		ThemeSparkleAlphaA_Dir = 0
		ThemeSparkleAlphaA_Value = 255
	elseif ThemeSparkleAlphaA_Value <= 25 then
		ThemeSparkleAlphaA_Dir = 1
		ThemeSparkleAlphaA_Value = 25
	end
	if ThemeSparkleAlphaB_Dir == 1 then
		ThemeSparkleAlphaB_Value=ThemeSparkleAlphaB_Value+3
	else
		ThemeSparkleAlphaB_Value=ThemeSparkleAlphaB_Value-3
	end
	if ThemeSparkleAlphaB_Value >= 255 then
		ThemeSparkleAlphaB_Dir = 0
		ThemeSparkleAlphaB_Value = 255
	elseif ThemeSparkleAlphaB_Value <= 25 then
		ThemeSparkleAlphaB_Dir = 1
		ThemeSparkleAlphaB_Value = 25
	end
	if ThemeSparkleAlphaC_Dir == 1 then
		ThemeSparkleAlphaC_Value=ThemeSparkleAlphaC_Value+2
	else
		ThemeSparkleAlphaC_Value=ThemeSparkleAlphaC_Value-2
	end
	if ThemeSparkleAlphaC_Value >= 255 then
		ThemeSparkleAlphaC_Dir = 0
		ThemeSparkleAlphaC_Value = 255
	elseif ThemeSparkleAlphaC_Value <= 25 then
		ThemeSparkleAlphaC_Dir = 1
		ThemeSparkleAlphaC_Value = 25
	end
	if ThemeSparkleAlphaD_Dir == 1 then
		ThemeSparkleAlphaD_Value=ThemeSparkleAlphaD_Value+7
	else
		ThemeSparkleAlphaD_Value=ThemeSparkleAlphaD_Value-7
	end
	if ThemeSparkleAlphaD_Value >= 255 then
		ThemeSparkleAlphaD_Dir = 0
		ThemeSparkleAlphaD_Value = 255
	elseif ThemeSparkleAlphaD_Value <= 25 then
		ThemeSparkleAlphaD_Dir = 1
		ThemeSparkleAlphaD_Value = 25
	end
	if ThemeBallAlphaDir == 1 then
		ThemeBallAlphaValue=ThemeBallAlphaValue+ThemeBallAlphaSpeed
	else
		ThemeBallAlphaValue=ThemeBallAlphaValue-ThemeBallAlphaSpeed
	end
	if ThemeBallAlphaValue >= ThemeBallAlphaMax then
		ThemeBallAlphaDir = 0
		ThemeBallAlphaValue = ThemeBallAlphaMax
	elseif ThemeBallAlphaValue <= 0 then
		ThemeBallAlphaDir = 1
		ThemeBallAlphaValue = 0
	end
	ThemeBallRotation = ThemeBallRotation+ThemeBallRotationSpeed
	if ThemeBallRotation >= 360 then
		ThemeBallRotation = ThemeBallRotation - 360
	end
	drawTime(17,17)
end

function thmDrawBKGOL()
	-- Nothing to do here
end
--------------------------------------------------

--------------------------------------------------
--    DON'T EDIT OR REMOVE THE LINES BELLOW:    --
--------------------------------------------------
thmPL=true;             -- DO NOT REMOVE THIS LINE
end                     -- DO NOT REMOVE THIS LINE
--------------------------------------------------