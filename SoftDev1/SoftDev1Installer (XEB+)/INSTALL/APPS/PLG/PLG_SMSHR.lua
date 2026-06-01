PluginData = {};
PluginData.Type = "LuaScript";
PluginData.Category = 6;
PluginData.Name = "Smasher";
PluginData.Description = xebLang[33];
PluginData.Icon = 112;
PluginData.Safe = true;
PluginData.ValueA = "mass:/PS2/APPS/Smasher/Smasher.lua";
PluginData.ValueB = "APPS/Smasher/Smasher.lua";
PluginData.ValueC = "NONE";
smasherLogo=xebPluginAssetsLatest+1
if System.doesFileExist("mass:/PS2/APPS/Smasher/png/logo.png") then
	xebPluginAssets[smasherLogo]=Graphics.loadImage("mass:/PS2/APPS/Smasher/png/logo.png")
elseif System.doesFileExist(System.currentDirectory().."APPS/Smasher/png/logo.png") then
	xebPluginAssets[smasherLogo]=Graphics.loadImage(System.currentDirectory().."APPS/Smasher/png/logo.png")
end
xebPluginAssetsLatest=smasherLogo;