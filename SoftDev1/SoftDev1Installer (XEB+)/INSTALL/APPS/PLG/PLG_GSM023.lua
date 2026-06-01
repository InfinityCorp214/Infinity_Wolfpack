PluginData = {};
PluginData.Type = "SingleELF";
PluginData.Category = 6;
PluginData.Name = "GSM";
PluginData.Version = "0.23x";
if XEBPlusLanguage=="es-419" or XEBPlusLanguage=="es-CU" then
	PluginData.Description = "Ajusta la salida de video";
elseif XEBPlusLanguage=="es-ES" then
	PluginData.Description = "Ajusta la salida de vídeo";
elseif XEBPlusLanguage=="es-AR" then
	PluginData.Description = "Ajustá la salida de video";
elseif string.sub(XEBPlusLanguage,1,3) == "pt-" then
	PluginData.Description = "Ajustar a saída de vídeo";
else
	PluginData.Description = "Adjust video output settings";
end
PluginData.Icon = 86;
PluginData.Safe = true;
PluginData.ValueA = "APPS/GSM v0.23x/GSM.ELF";
PluginData.ValueB = "NONE";
PluginData.ValueC = "NONE";
PluginData.IOPReset = "Default-ROM0"
PluginData.IOPDisc = true