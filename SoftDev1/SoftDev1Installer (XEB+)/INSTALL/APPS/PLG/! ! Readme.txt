Paste the plugin files here in this folder.

- How to make plugins?

There are multiple types of plugins, but in this Xmas Showcase, only "LuaScript" and "SingleELF" will work. I provided some examples in this folder, enjoy taking a look at them for more intricate details then what you will see next.
Plugins are simple lua script files, which you can make in Notepad++ or Windows' Notepad.

First, they all start with:
PluginData = {};

Followed by the type, which could be (in this preview) "SingleELF" and "LuaScript". There are more types, which will be explained later when we release a complete and stable XEB+. Here's an example on how to state the type:
PluginData.Type = "SingleELF";

Then, the category, which could be 3 for PS2 Games, 4 for Retro, 5 for Multimedia and 6 for General Apps:
PluginData.Category = 5;

Then comes the Name and Description. You can use your own strings here, like:
PluginData.Name = "Simple Media System";
or use a string from the language file, like:
PluginData.Description = xebLang[26];
For a list of the available strings for plugin file, look at "! Language Strings for Plugins.txt".
It is advised to use them if possible, since they will grab the proper string from every translation, meaning your plugin will be always translated.
Also, if there's no description that fits your needs, you can always provide translations by yourself for your own apps. Please, look at "PLG_GSM023.lua" for a proper example.

Next, the icon. There are 144 icons available at this time, but there will be at least 5 more when XEB+ releases. A full list of icons is available at "! Icon Numbers for Plugins.txt". The files are located inside each theme.
PluginData.Icon = 111;

Now... is the plugin safe or not? If it is safe, set it to true, if not, set it to false and it will ask for a keycode if Childproof mode is enabled.
PluginData.Safe = true;

Then, the files' location. There are 3 values (ValueA, ValueB and ValueC). If you wish to not use the 3 of them, write "NONE". You can use paths such as "mc0:", "mc1:", "mc?:", "mass:", "cdfs:" or any other open device. Also, relative paths are an option (which means the file is located in a subfolder inside XEB+'s folder). In that case, just skip the device and write directly the path relative to XEB+'s folder.
In case of "LuaScript" you can write paths to ".lua" files, in case of "SingleELF", you can write paths to the ELF files. Here's an example:
PluginData.ValueA = "mc?:/APPS/SMS.ELF";
PluginData.ValueB = "APPS/SMS/SMS.ELF";
PluginData.ValueC = "NONE";

------------
NOTICE:
------------
The next values are NOT required. You can use them or not depending on your plugin needs. They are only used in case of "SingleELF" (in this release) or every ELF related mode (in future releases).
------------

In case your plugin needs specific drivers, you can reset the IOP and then load a certain set of drivers, which can be: "Default", "Default-ROM0", "Default-HB", "NoIOPReset", "NoUSB-ROM0", "NoUSB-HB", "BDMUSB-ROM0", "BDMUSB-HB", "2019USB-ROM0", "2019USB-HB", "LegacyUSB-ROM0", "LegacyUSB-HB" or also "ExternalUSB-ROM0" or "ExternalUSB-HB" (which loads the driverset from SYS-CONF at mc0)
Default... loads the default drivers in the bootloader configuration (which is forced to "BDMUSB-HB" in this special Xmas build). Everything else goes by this: [USB Drivers ]-[Every other driver]. Meaning "BDMUSB-ROM0" will load BDM drivers and the rest of the drivers from ROM0, while "LegacyUSB-HB" will load the 2012 legacy USB drivers and the rest of the drivers from the XEB+'s build-in homebrew drivers package.
Here's a quite simple example for that long wall of text from before:
PluginData.IOPReset = "Default-ROM0"

Also, you can decide of load a CDVD driver after the IOP resets:
PluginData.IOPDisc = true

Some homebrews like the old GSM 0.23x requires specific modules, since it does not resets the IOP on boot and expect ROM0 drivers to be already loaded. By having a way to decide how to behave, we can ensure compatibility with every homebrew ever made.