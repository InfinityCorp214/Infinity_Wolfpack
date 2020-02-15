
4 ELFS files can be placed in this folder (/INSTALL) :
BOOT.ELF (uLaunchELF, Press R1 at boot to launch it)
ESR.ELF (Press R2) 
HDLOADER.ELF (Press L1)
SMS.ELF (Press L2)
Press Start to run FMCB Configurator.

They will be copied to "mc0:/BOOT" folder by installer, and linked
in browser menu.
Additional elf files in INSTALL folder will be copied to "mc0:/BOOT"
APPS folder can be filled with files, they will be copied to "mc0:/APPS"


- Optional "DVDELF.BIN" must be placed in "INJECT" folder.
- Custom "EMBED.ELF" must be placed in "INJECT" folder.
- Custom FREEMCB.CNF must be placed in "FMCB_CFG" folder.
- Additional eXtended modules must be placed in "MODULES" folder.
- If you want to replace Free McBoot configurator ("FMCB_CFG.ELF"),
it must be placed in "FMCB_CFG" folder.