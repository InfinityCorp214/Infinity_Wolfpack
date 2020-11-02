#include <loadcore.h>
#include <ioman.h>
#include <modload.h>
#include <stdio.h>
#include <sysclib.h>
#include <irx.h>
#include <sio2man.h>

#include "secrman.h"

#include "main.h"
#include "MechaAuth.h"
#include "CardAuth.h"
#include "keyman.h"

#define MODNAME "secrman_special"
IRX_ID(MODNAME, 1, 4);

#ifdef DEX_SUPPORT
int IsDEX;
#endif

extern struct irx_export_table _exp_secrman;

/* static void _printf(const char *format, ...); */

struct arg2struct{	//sp+0x48 to 0x98 in LOADFILE of boot ROM v1.01J.
	int fd;		//0x00
	int unknown_04;	//0x04
	int unknown_08;	//0x08
	int unknown_0C;	//0x0C
	int unknown_10;	//0x10
	int unknown_14;	//0x14
	int unknown_18;	//0x18
	int unknown_1C;	//0x1C
	int unknown_20;	//0x20
	int unknown_24;	//0x24
	int unknown_28;	//0x28
	int unknown_2C;	//0x2C
};

struct ModloadUnk2_entry{
	void *buffer;			//0x00
	unsigned int length;		//0x04
	unsigned int unknown_08;	//0x08
	unsigned int unknown_0C;	//0x0C
};

struct ModloadUnk2{
	unsigned int ReadBufferLength;	//0x00	- Read buffer.
	unsigned int ReadBufferOffset;	//0x04	- Read buffer offset into the file.
	struct ModloadUnk2_entry entries[2];
	unsigned int unknown_28;	//0x28
	unsigned int unknown_2C;	//0x2C
};

struct ModloadBitTableDescriptor{
	SecrBitTableHeader_t header;
	SecrBitBlockData_t *blocks;
	unsigned int padding;	//Doesn't seem to be used.
};

typedef int (*ProgramDecryptionFunction)(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor);
typedef int (*ModloadCb_d20)(const struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor, ProgramDecryptionFunction DecryptFunction);
typedef int (*ModloadCb_d24)(const struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2);
typedef int (*ModloadCb_d28)(const struct ModloadUnk2 *ModloadUnk2);
typedef void *(*ModloadCb_d2c)(unsigned int size);
typedef void (*ModloadCb_d30)(void *buffer);

static ModloadCb_d20 var_00003d20;	//0x00003d20
static ModloadCb_d24 var_00003d24;	//0x00003d24
static ModloadCb_d28 var_00003d28;	//0x00003d28
static ModloadCb_d2c var_00003d2c;	//0x00003d2c
static ModloadCb_d30 var_00003d30;	//0x00003d30

struct ModloadUnknown{
	ModloadCb_d20 unknown_00;
	ModloadCb_d24 unknown_04;
	ModloadCb_d28 unknown_08;
	ModloadCb_d2c unknown_0C;
	ModloadCb_d30 unknown_10;
	void *unknown_14;
	void *unknown_18;
};

//Function prototypes.
static int func_0000077c(int port, int slot, void *buffer);
static int func_00000bfc(void *dest, unsigned int size);
static int func_00002eb0(struct ModloadBitTableDescriptor *ModloadBitTableDescriptor, int fd, int port, int slot, int device);
static int func_0000306c(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor, int (*DecryptBlockFunction)(void *src, void *dest, unsigned int size));
static int func_00003364(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor);
static int func_00003230(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int port, int slot, int *arg5, int *arg6, int device, ProgramDecryptionFunction decrypt);
static int func_0000338c(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int port, int slot, int *arg5, int *arg6);
static int func_000033c8(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor);
static int func_000033f0(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int *arg3, int *arg4);
static void func_00003430(struct ModloadUnknown *unknown);
static void RegisterSecrCallbackHandlers(void);
static int card_encrypt(int port, int slot, void *buffer);
static unsigned short int GetHeaderLength(const void *buffer);
static int secr_set_header(int mode, int cnum, int arg2, void *buffer);
static int Read_BIT(SecrBitTable_t *BitTable);
static unsigned int get_BitTableOffset(const void *buffer);
static int func_00000b5c(const void *block, unsigned int size);
static int func_00000c94(void *kbit);
static int func_00000cd4(void *kc);
static int func_00000d14(void *icvps2);
static int Uses_ICVPS2(const void *buffer);

//0x00000000
/* static void _printf(const char *format, ...){

} */

//0x0000077c
static int func_0000077c(int port, int slot, void *buffer){
	int result;

	if(GetMcCommandHandler()!=NULL){
		_printf("card decrypt start\n");

		if(card_auth(port, slot, 0xF1, 0x40)){
			_printf("card decrypt 0x40\n");

			if(card_auth_write(port, slot, buffer, 0xF1, 0x41)){
				_printf("card decrypt 0x41\n");

				if(card_auth(port, slot, 0xF1, 0x42)){
					_printf("card decrypt 0x42\n");

					if(card_auth_read(port, slot, buffer, 0xF1, 0x43)){
						_printf("card decrypt 0x43\n");
						result=1;
					}
					else result=0;
				}
				else result=0;
			}
			else result=0;
		}
		else result=0;
	}
	else result=0;

	return result;
}

//0x00000d34 - export #08
int SecrCardBootHeader(int port, int slot, void *buffer, SecrBitTable_t *BitTable, s32 *pSize){
	int result, cnum, BitTableSize;
	unsigned char Kbit[16], Kc[16];

	if(GetMcCommandHandler()!=NULL){
		get_Kbit(buffer, Kbit);
		get_Kc(buffer, Kc);

		if(func_0000077c(port, slot, Kbit)){
			if(func_0000077c(port, slot, &Kbit[8])){
				if(func_0000077c(port, slot, Kc)){
					if(func_0000077c(port, slot, &Kc[8])){
						store_kc(buffer, Kc);
						store_kbit(buffer, Kbit);

						if((cnum=McDeviceIDToCNum(port, slot))>=0){
							if(secr_set_header(1, cnum, 0, buffer)){
								if((BitTableSize=Read_BIT(BitTable))!=0){
									if(pSize!=NULL) *pSize=BitTableSize;
									result=1;
								}
								else{
									_printf("Cannot read BIT\n");
									result=0;
								}
							}
							else{
								_printf("Set Header failed\n");
								result=0;
							}
						}
						else result=0;
					}
					else result=0;
				}
				else result=0;
			}
			else result=0;
		}
		else result=0;
	}
	else{
		_printf("mcCommand isn't assigned\n");
		result=0;
	}

	return result;
}



//0x00000bfc
static int func_00000bfc(void *dest, unsigned int size){
	int result;

	if(func_00001c98(size)){
		result=1;	
		/*
			There was something like this here that doesn't make sense (instead of just the simple loop below):
			if(size>0){
				if(size<0) size+=0xF

				while(size>0){
					...
				}
			}
		*/
		while(size>0){
			if(size>=16){	//if(size>>4!=0)
				result=func_00001b00(dest, 0x10);
				size-=0x10;
				(unsigned int)dest+=0x10;
			}
			else{
				result=func_00001b00(dest, size);
				size=0;
			}

			if(result==0){
				return 0;
			}
		}

		result=1;
	}
	else result=0;

	return result;
}

//0x00000e90 - export #09
int SecrCardBootBlock(void *src, void *dest, unsigned int size){
	int result;

	if(func_00000b5c(src, size)){
		result=func_00000bfc(dest, size)==0?0:1;
	}
	else result=0;

	return result;
}

//0x000011b4 - export #10
void *SecrCardBootFile(int port, int slot, void *buffer){
	unsigned int offset, i;
	void *result;
	SecrBitTable_t *BitTableData;

	BitTableData=(SecrBitTable_t *)((unsigned int)buffer+get_BitTableOffset(buffer));
	if(SecrCardBootHeader(port, slot, buffer, BitTableData, NULL)){
		if(BitTableData->header.block_count>0){
			offset=BitTableData->header.headersize;
			for(i=0; i<BitTableData->header.block_count; i++){
				if(BitTableData->blocks[i].flags&3){
					if(!SecrCardBootBlock((void*)((unsigned int)buffer+offset), (void*)((unsigned int)buffer+offset), BitTableData->blocks[i].size)) {
						_printf("SecrCardBootFile: failed\n");
						return NULL;
					}
				}
				offset+=BitTableData->blocks[i].size;
			}
		}

		result=(void*)((unsigned int)buffer+GetHeaderLength(buffer));
	}
	else{
		_printf("SecrCardBootFile: Cannot decrypt header\n");
		result=NULL;
	}

	return result;
}

//0x000010dc - export #11
int SecrDiskBootHeader(void *buffer, SecrBitTable_t *BitTable, s32 *pSize){
	int result, BitTableSize;

	if(secr_set_header(0, 0, 0, buffer)){
		if((BitTableSize=Read_BIT(BitTable))!=0){
			if(pSize!=NULL) *pSize=BitTableSize;
			result=1;
		}
		else{
			_printf("Cannot read BIT\n");
			result=0;
		}
	}
	else{
		_printf("Set Header failed\n");
		result=0;
	}

	return result;
}

//0x00001164 - export #12
int SecrDiskBootBlock(void *src, void *dest, unsigned int size){
	int result;

	if(func_00000b5c(src, size)){
		result=func_00000bfc(dest, size)==0?0:1;
	}
	else result=0;

	return result;
}

//0x00001474 - export #13
void *SecrDiskBootFile(void *buffer){
	void *result;
	SecrBitTable_t *BitTableData;
	unsigned int offset, i;

	BitTableData=(SecrBitTable_t *)((unsigned int)buffer+get_BitTableOffset(buffer));
	if(SecrDiskBootHeader(buffer, BitTableData, NULL)){
		if(BitTableData->header.block_count>0){
			offset=BitTableData->header.headersize;
			for(i=0; i<BitTableData->header.block_count; i++){
				if(BitTableData->blocks[i].flags&3){
					if(!SecrDiskBootBlock((void*)((unsigned int)buffer+offset), (void*)((unsigned int)buffer+offset), BitTableData->blocks[i].size)) {
						_printf("SecrDiskBootFile: failed\n");
						return NULL;
					}
				}
				offset+=BitTableData->blocks[i].size;
			}
		}

		result=(void*)((unsigned int)buffer+GetHeaderLength(buffer));
	}
	else{
		_printf("SecrDiskBootFile: Cannot decrypt header\n");
		result=NULL;
	}

	return result;
}

//0x00002eb0
static int func_00002eb0(struct ModloadBitTableDescriptor *ModloadBitTableDescriptor, int fd, int port, int slot, int device){
	int result;
	unsigned short int HeaderLength;
	SecrKELFHeader_t header;
	SecrBitTable_t *BitTableData;
	void *HeaderBuffer;

	if(lseek(fd, 0, SEEK_SET)==0){
		if(read(fd, &header, sizeof(SecrKELFHeader_t))==sizeof(SecrKELFHeader_t)){
			HeaderLength=GetHeaderLength(&header);
			if((HeaderBuffer=var_00003d2c(HeaderLength))!=NULL){
				if(lseek(fd, 0, SEEK_SET)==0){
					if(read(fd, HeaderBuffer, HeaderLength)==HeaderLength){
						BitTableData=(SecrBitTable_t *)((unsigned int)HeaderBuffer+get_BitTableOffset(HeaderBuffer));

						if(device==0){
							result=SecrCardBootHeader(port, slot, HeaderBuffer, BitTableData, NULL);
						}
						else if(device==1){
							result=SecrDiskBootHeader(HeaderBuffer, BitTableData, NULL);
						}
						else{
							return -1;
						}

						if(result==1){
							result=0;
							memcpy(&ModloadBitTableDescriptor->header, &BitTableData->header, sizeof(ModloadBitTableDescriptor->header));
							ModloadBitTableDescriptor->blocks=BitTableData->blocks;
						}
						else{
							var_00003d30(HeaderBuffer);
							result=-201;
						}
					}
					else{
						var_00003d30(HeaderBuffer);
						result=-204;
					}
				}
				else{
					var_00003d30(HeaderBuffer);
					result=-201;
				}
			}
			else{
				result=-400;
			}
		}
		else result=-204;
	}
	else result=-204;

	return result;
}

/* 0x0000306c	- Reads a block of encrypted data and decrypts it.
	This is one really irritating function. Since nobody has ever completed and released a disassembly of MODLOAD, there were a whole load of structures that I had to figure out by cross-referencing LOADFILE, MODLOAD and SECRMAN. */
static int func_0000306c(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor, int (*DecryptBlockFunction)(void *src, void *dest, unsigned int size)){
	unsigned int i, PayloadLength, excess, ExcessBlockNum;
	struct ModloadUnk2_entry *entry;
	int result;
	void *BlockExcessRegionPtr;

/*	printf(	"func_0000306c:\n"
		"\tModloadUnk2->unknown_28:\t%d\n"
		"\tModloadUnk2->ReadBufferOffset:\t%d\n"
		"\tModloadUnk2->ReadBufferLength:\t%d\n", ModloadUnk2->unknown_28, ModloadUnk2->ReadBufferOffset, ModloadUnk2->ReadBufferLength); */

	entry=&ModloadUnk2->entries[ModloadUnk2->unknown_28];
	entry->length=ModloadUnk2->ReadBufferOffset;
	for(i=0,PayloadLength=0; i<ModloadBitTableDescriptor->header.block_count; PayloadLength+=ModloadBitTableDescriptor->blocks[i].size,i++){
		if(ModloadUnk2->ReadBufferOffset<PayloadLength+ModloadBitTableDescriptor->blocks[i].size){
			break;
		}
	}

	//0x000030fc - Partially decrypting blocks is not possible.
	if(((excess=PayloadLength-entry->length)!=0) && (ModloadBitTableDescriptor->blocks[i].flags&3)){
	//	printf("WIP function 0x0000306c: can't partially decrypt block.\n");
		result=-201;
	}
	else{
		ExcessBlockNum=i;
		BlockExcessRegionPtr=(void*)((unsigned int)entry->buffer+excess);

		for(; i<ModloadBitTableDescriptor->header.block_count; excess+=ModloadBitTableDescriptor->blocks[i].size,i++){
			//0x00003140
			if(ModloadBitTableDescriptor->blocks[i].size+excess>=ModloadUnk2->ReadBufferLength){
				if(!(ModloadBitTableDescriptor->blocks[i].flags&3)){
					excess=ModloadUnk2->ReadBufferLength;
				}

				break;
			}
		}

		if(read(fd, entry->buffer, excess)==excess){
			ModloadUnk2->ReadBufferOffset+=excess;

			for(; ExcessBlockNum<i; (unsigned int)BlockExcessRegionPtr+=ModloadBitTableDescriptor->blocks[ExcessBlockNum].size,ExcessBlockNum++){
				if(ModloadBitTableDescriptor->blocks[ExcessBlockNum].flags&3){
					//0x000031d8
					if(DecryptBlockFunction(BlockExcessRegionPtr, BlockExcessRegionPtr, ModloadBitTableDescriptor->blocks[ExcessBlockNum].size)!=1){
						return -201;
					}
				}
			}

			result=0;
		}
		else{
			result=-204;
		}
	}

	return result;
}

//0x00003364
static int func_00003364(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor){
	return func_0000306c(fd, ModloadUnk2, ModloadBitTableDescriptor, &SecrCardBootBlock);
}

//0x00003230
static int func_00003230(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int port, int slot, int *arg5, int *arg6, int device, ProgramDecryptionFunction decrypt){
	int result;
	struct ModloadBitTableDescriptor ModloadBitTableDescriptor;

	if(func_00002eb0(&ModloadBitTableDescriptor, arg2->fd, port, slot, device)==0){
		if(lseek(arg2->fd, ModloadBitTableDescriptor.header.headersize, SEEK_SET)==ModloadBitTableDescriptor.header.headersize){
			if(decrypt(arg2->fd, ModloadUnk2, &ModloadBitTableDescriptor)==0){
				if(var_00003d24(ModloadUnk2, arg2)==0){
					if(var_00003d28(ModloadUnk2)==0){
						if(var_00003d20(ModloadUnk2, arg2, &ModloadBitTableDescriptor, decrypt)==0){
							result=0;

							//0x00003318
							*arg5=arg2->unknown_28;
							*arg6=0;
						}
						else{
							printf("load elf error\n");
							result=-201;
						}
					}
					else{
						printf("don't get program header\n");
						result=-201;
					}
				}
				else{
					printf("don't get elf header\n");
					result=-201;
				}
			}
			else result=-204;
		}
		else result=-204;
	}
	else result=-201;

	return result;
}

//0x0000338c
static int func_0000338c(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int port, int slot, int *arg5, int *arg6){
	return func_00003230(ModloadUnk2, arg2, port, slot, arg5, arg6, 0, &func_00003364);
}

//0x000033c8
static int func_000033c8(int fd, struct ModloadUnk2 *ModloadUnk2, const struct ModloadBitTableDescriptor *ModloadBitTableDescriptor){
	return func_0000306c(fd, ModloadUnk2, ModloadBitTableDescriptor, &SecrDiskBootBlock);
}

//0x000033f0
static int func_000033f0(struct ModloadUnk2 *ModloadUnk2, struct arg2struct *arg2, int *arg3, int *arg4){
	return func_00003230(ModloadUnk2, arg2, 0, 0, arg3, arg4, 1, &func_000033c8);
}

//0x00003430
static void func_00003430(struct ModloadUnknown *unknown){
	var_00003d20=unknown->unknown_00;
	var_00003d24=unknown->unknown_04;
	var_00003d28=unknown->unknown_08;
	var_00003d2c=unknown->unknown_0C;
	var_00003d30=unknown->unknown_10;

	unknown->unknown_14=&func_0000338c;
	unknown->unknown_18=&func_000033f0;
}

//0x0000348c
static void RegisterSecrCallbackHandlers(void){
	SetSecrmanCallbacks(&SecrCardBootFile, &SecrDiskBootFile, &func_00003430);
}

//0x00000018
int _start(int argc, char *argv[]){
	int result;

#ifdef DEX_SUPPORT
	int fd;
	char type;

	fd = open("rom0:ROMVER", O_RDONLY);
	lseek(fd, 5, SEEK_SET);
	read(fd, &type, 1);
	close(fd);

	IsDEX = type == 'D';
#endif

	if(RegisterLibraryEntries(&_exp_secrman)==0){
		ResetMcHandlers();
		RegisterSecrCallbackHandlers();
		result=MODULE_RESIDENT_END;
	}
	else result=MODULE_NO_RESIDENT_END;

	return result;
}

//0x0000005c
int _exit(int argc, char *argv[]){
	return MODULE_NO_RESIDENT_END;
}

//0x00000064 - export #04
void SecrSetMcCommandHandler(McCommandHandler_t handler){
	SetMcCommandHandler(handler);
}

//0x00000084 - export #05
void SecrSetMcDevIDHandler(McDevIDHandler_t handler){
	SetMcDevIDHandler(handler);
}

//0x000000a4 - export #06
//This is the most badass function in the whole file. Not only was it difficult to see whether I got all the pointers right, it invokes many functions, making it a difficult one to debug. I tried to make the buffer names the same as within the FMCB PS3MCA bundle's Card_Authentificate() function.
int SecrAuthCard(int port, int slot, int cnum){
	int result;
	unsigned char MechaChallenge2[8], CardIV[8], CardMaterial[8], CardNonce[8], MechaChallenge1[8], MechaChallenge3[8], CardResponse1[8], CardResponse2[8], CardResponse3[8];

	if(GetMcCommandHandler()!=NULL){
		_printf("SecrAuthCard start\n");

		memset(MechaChallenge1, 0, sizeof(MechaChallenge1));

		if(card_auth_60(port, slot)){
			_printf("card auth 0x60\n");

			if(mechacon_auth_80(cnum)){
				_printf("mechacon auth 0x80\n");

		/*	The normal secrman_for_dex module does not have this step. With this step, card authentication does not work on a DEX.
			On a CEX, it appears that card authentication still works without this step, but I don't know whether there are any side-effects.	*/
				if(
#ifdef DEX_SUPPORT
				IsDEX ||
#endif
				card_auth_key_change(port, slot, 1)){
					_printf("card auth key change\n");

					if(card_auth(port, slot, 0xF0, 0x00)){
						_printf("card auth 0x00\n");

						if(mechacon_auth_81(cnum)){
							_printf("mechacon auth 0x81\n");

							if(card_auth_read(port, slot, CardIV, 0xF0, 0x01)){
								_printf("card auth 0x01\n");

								if(card_auth_read(port, slot, CardMaterial, 0xF0, 0x02)){
									_printf("card auth 0x02\n");

									if(mechacon_auth_82(CardIV, CardMaterial)){
										_printf("mechacon auth 0x82\n");

										if(card_auth(port, slot, 0xF0, 0x03)){
											_printf("card auth 0x03\n");

											if(card_auth_read(port, slot, CardNonce, 0xF0, 0x04)){
												_printf("card auth 0x04\n");

												if(mechacon_auth_83(CardNonce)){
													_printf("mechacon auth 0x83\n");

													if(card_auth(port, slot, 0xF0, 0x05)){
														_printf("card auth 0x05\n");

														if(pol_cal_cmplt()){
															_printf("mechacon auth 0x8f\n");

															if(mechacon_auth_84(MechaChallenge1, MechaChallenge2)){
																_printf("mechacon auth 0x84\n");

																if(mechacon_auth_85(&MechaChallenge2[4], MechaChallenge3)){
																	_printf("mechacon auth 0x85\n");

																	if(card_auth_write(port, slot, MechaChallenge3, 0xF0, 0x06)){
																		_printf("card auth 0x06\n");

																		if(card_auth_write(port, slot, MechaChallenge2, 0xF0, 0x07)){
																			_printf("card auth 0x07\n");

																			if(card_auth(port, slot, 0xF0, 0x08)){
																				_printf("card auth 0x08\n");

																				if(card_auth2(port, slot, 0xF0, 0x09)){
																					_printf("card auth 0x09\n");

																					if(card_auth(port, slot, 0xF0, 0x0A)){
																						_printf("card auth 0x0a\n");

																						if(card_auth_write(port, slot, MechaChallenge1, 0xF0, 0x0B)){
																							_printf("card auth 0x0b\n");

																							if(card_auth(port, slot, 0xF0, 0x0C)){
																								_printf("card auth 0x0c\n");

																								if(card_auth2(port, slot, 0xF0, 0x0D)){
																									_printf("card auth 0x0d\n");

																									if(card_auth(port, slot, 0xF0, 0x0E)){
																										_printf("card auth 0x0e\n");

																										if(card_auth_read(port, slot, CardResponse1, 0xF0, 0x0F)){	//Originally, it used the same region as CardNonce. But that might have just been a result of compiler code optimization.
																											_printf("card auth 0x0f\n");

																											if(card_auth(port, slot, 0xF0, 0x10)){
																												_printf("card auth 0x10\n");

																												if(card_auth_read(port, slot, CardResponse2, 0xF0, 0x11)){
																													_printf("card auth 0x11\n");

																													if(mechacon_auth_86(CardResponse1, CardResponse2)){
																														_printf("mechacon auth 0x86\n");

																														if(card_auth(port, slot, 0xF0, 0x12)){
																															_printf("card auth 0x12\n");

																															if(card_auth_read(port, slot, CardResponse3, 0xF0, 0x13)){
																																_printf("card auth 0x13\n");

																																if(mechacon_auth_87(CardResponse3)){
																																	_printf("mechacon auth 0x87\n");

																																	if(pol_cal_cmplt()){
																																		_printf("mechacon auth 0x8f\n");

																																		if(card_auth(port, slot, 0xF0, 0x14)){
																																			_printf("card auth 0x14\n");

																																			if(mechacon_auth_88()){
																																				_printf("mechacon auth 0x88\n");
																																				result=1;
																																			}
																																			else{
																																				goto Error2_end;
																																			}
																																		}
																																		else{
																																			goto Error2_end;
																																		}
																																	}
																																	else{
																																		goto Error2_end;
																																	}
																																}
																																else{
																																	goto Error2_end;
																																}
																															}
																															else{
																																goto Error2_end;
																															}
																														}
																														else{
																															goto Error2_end;
																														}
																													}
																													else{
																														goto Error2_end;
																													}
																												}
																												else{
																													goto Error2_end;
																												}
																											}
																											else{
																												goto Error2_end;
																											}
																										}
																										else{
																											goto Error2_end;
																										}

																									}
																									else{
																										goto Error2_end;
																									}
																								}
																								else{
																									goto Error2_end;
																								}
																							}
																							else{
																								goto Error2_end;
																							}
																						}
																						else{
																							goto Error2_end;
																						}
																					}
																					else{
																						goto Error2_end;
																					}
																				}
																				else{
																					goto Error2_end;
																				}
																			}
																			else{
																				goto Error2_end;
																			}
																		}
																		else{
																			goto Error2_end;
																		}
																	}
																	else{
																		goto Error2_end;
																	}
																}
																else{
																	goto Error2_end;
																}
															}
															else{
																goto Error2_end;
															}
														}
														else{
															goto Error2_end;
														}
													}
													else{
														goto Error2_end;
													}
												}
												else{
													goto Error2_end;
												}
											}
											else{
												goto Error2_end;
											}
										}
										else{
											goto Error2_end;
										}
									}
									else{
										goto Error2_end;
									}
								}
								else{
									goto Error2_end;
								}
							}
							else{
								goto Error2_end;
							}
						}
						else{
							card_auth_60(port, slot);
							result=0;
						}
					}
					else{
						card_auth_60(port, slot);
						result=0;
					}
				}
				else{
					card_auth_60(port, slot);
					result=0;
				}
			}
			else result=0;
		}
		else result=0;
	}
	else{
		_printf("mcCommand isn't assigned\n");
		result=0;
	}

	return result;

Error2_end:
	card_auth_60(port, slot);
	mechacon_auth_80(cnum);

	return 0;
}

//0x00000750 - export #07
void SecrResetAuthCard(int port, int slot, int cnum){
	card_auth_60(port, slot);
	mechacon_auth_80(cnum);
}

//0x00002a98
static unsigned short int GetHeaderLength(const void *buffer){
	return ((const SecrKELFHeader_t*)buffer)->KELF_header_size;
}

//0x000009ac
static int secr_set_header(int mode, int cnum, int arg2, void *buffer){
	unsigned short int HeaderLength;
	int result;

	HeaderLength=GetHeaderLength(buffer);
	_printf("header length %d\n", HeaderLength);
	if(write_HD_start(mode, cnum, arg2, HeaderLength)!=0){
		while(HeaderLength>0){
			if(HeaderLength>=0x10){	//if(HeaderLength>>4!=0)
				result=write_data(buffer, 0x10);
				(unsigned int)buffer+=0x10;
				HeaderLength-=0x10;
			}
			else{
				result=write_data(buffer, HeaderLength);
				HeaderLength=0;
			}

			if(result==0){
				_printf("secr_set_header: fail write_data\n");
				goto err_end;
			}
		}

		if(pol_cal_cmplt()==0){
			_printf("secr_set_header: fail pol_cal_cmplt\n");
			goto err_end;
		}
	}
	else{
		_printf("secr_set_header: fail write_HD_start\n");
		goto err_end;
	}

	return 1;

err_end:
	return 0;
}

//0x00000acc
static int Read_BIT(SecrBitTable_t *BitTable){
	unsigned short int BitLength, DataToCopy;
	int result;

	if(get_BIT_length(&BitLength)!=0){
		DataToCopy=BitLength;

		while(DataToCopy!=0){
	 		if(DataToCopy>=0x10){
				result=func_00001b00(BitTable, 0x10);
		 		(unsigned int)BitTable+=0x10;
		 		DataToCopy-=0x10;
 			}
 			else {
				result=func_00001b00(BitTable, DataToCopy);
				DataToCopy=0;
 			}

			if(result==0){
				return 0;
			}
		}
	}
	else{
		return 0;
	}

	return BitLength;
}

//0x00000ee0 - export #14
int SecrDownloadHeader(int port, int slot, void *buffer, SecrBitTable_t *BitTable, s32 *pSize){
	int cnum, size, result;

	if(GetMcCommandHandler()==NULL){
		_printf("mcCommand isn't assigned\n");
		return 0;
	}

	if((cnum=McDeviceIDToCNum(port, slot))>=0){
		if(secr_set_header(2, cnum, 0, buffer)!=0){
			if((size=Read_BIT(BitTable))!=0){
				if(pSize!=NULL) *pSize=size;
				result=1;
			}
			else result=0;
		}
		else result=0;
	}
	else{
		_printf("invalid cnum '%d'\n", cnum);
		result=0;
	}

	return result;
}

//0x00002aa4
static unsigned int get_BitTableOffset(const void *buffer){
	const SecrKELFHeader_t *header=buffer;
	int offset=sizeof(SecrKELFHeader_t);

	if(header->BIT_count>0) offset+=header->BIT_count*sizeof(SecrBitBlockData_t);	//They used a loop for this. D:
	if((*(unsigned int*)&header->flags)&1) offset+=((const unsigned char*)buffer)[offset] + 1;
	if(((*(unsigned int *)&header->flags)&0xF000)==0) offset+=8;
	return(offset+0x20);	//Goes after Kbit and Kc.
}

//0x00000b5c
static int func_00000b5c(const void *block, unsigned int size){
	int result;

	if(mechacon_set_block_size(size)){
		while(size>0){
			if((size+0xF)>=0x10){	//if((size+0xF)>>4!=0)
				result=write_data(block, 0x10);
				(unsigned int)block+=0x10;
				size-=0x10;
			}
			else{
				result=write_data(block, size);
				size=0;
			}

			if(result==0){
				goto err_end;
			}
		}

		result=(pol_cal_cmplt()==0)?0:1;
	}
	else result=0;

	return result;
err_end:
	return 0;
}

//0x00000fb4 - export #15
int SecrDownloadBlock(void *block, unsigned int size) {
	return(func_00000b5c(block, size)==1?1:0);
}

//0x00000c94
static int func_00000c94(void *kbit){
	int result;

	if((result=func_00001ce8(kbit))!=0){
		result=func_00001d64((void*)((unsigned int)kbit+8))==1?1:0;
	}

	return result;
}


//0x00000cd4
static int func_00000cd4(void *kc){
	int result;

	if((result=func_00001de0(kc))!=0){
		result=func_00001e5c((void*)((unsigned int)kc+8))==1?1:0;
	}

	return result;
}

//0x00000894
static int card_encrypt(int port, int slot, void *buffer){
	int result;

	if(GetMcCommandHandler()!=NULL){
		_printf("card encrypt start\n");

		if(card_auth(port, slot, 0xF2, 0x50)){
			_printf("card encrypt 0x50\n");
			if(card_auth_write(port, slot, buffer, 0xF2, 0x51)){
				_printf("card encrypt 0x51\n");
				if(card_auth(port, slot, 0xF2, 0x52)){
					_printf("card encrypt 0x52\n");
					if(card_auth_read(port, slot, buffer, 0xF2, 0x53)){
						_printf("card encrypt 0x53\n");
						result=1;
					}
					else result=0;
				}
				else result=0;
			}
			else result=0;
		}
		else result=0;
	}
	else result=0;

	return result;
}

//0x00000fd4 - export #17
int SecrDownloadGetKbit(int port, int slot, void *kbit){
	return((func_00000c94(kbit)&&card_encrypt(port, slot, kbit)&&card_encrypt(port, slot, (void*)(unsigned int)kbit+8))?1:0);
}

//0x00001048 - export #18
int SecrDownloadGetKc(int port, int slot, void *kc){
	return((func_00000cd4(kc)&&card_encrypt(port, slot, kc)&&card_encrypt(port, slot, (void*)(unsigned int)kc+8))?1:0);
}

//0x00000d14
static int func_00000d14(void *icvps2){
	return(func_00001ed8(icvps2)==0?0:1);
}

//0x000010bc - export #19
int SecrDownloadGetICVPS2(void *icvps2){
	return(func_00000d14(icvps2)==0?0:1);
}

//0x00002b0c
static int Uses_ICVPS2(const void *buffer){
	return(((const SecrKELFHeader_t*)buffer)->flags>>1&1);
}

//0x000012c0 - export #16
void *SecrDownloadFile(int port, int slot, void *buffer){
	SecrBitTable_t BitTableData;
	unsigned int offset, i;
	void *result;
	unsigned char kbit[16], kcontent[16], icvps2[8];

	_printf("SecrDownloadFile start\n");
	get_BitTableOffset(buffer);	//Doesn't use its return value?
	if(SecrDownloadHeader(port, slot, buffer, &BitTableData, NULL)!=0){
		if(BitTableData.header.block_count>0) {
			offset=BitTableData.header.headersize;
			for(i=0; i<BitTableData.header.block_count; i++){
				if(BitTableData.blocks[i].flags&2){
					if(!SecrDownloadBlock((void*)((unsigned int)buffer+offset), BitTableData.blocks[i].size)) {
						_printf("SecrDownloadFile: failed\n");
						return NULL;
					}
				}
				offset+=BitTableData.blocks[i].size;
			}
		}

		if(SecrDownloadGetKbit(port, slot, kbit)==0){
			_printf("SecrDownloadFile: Cannot get kbit\n");
			return NULL;
		}
		if(SecrDownloadGetKc(port, slot, kcontent)==0){
			_printf("SecrDownloadFile: Cannot get kc\n");
			return NULL;
		}

		store_kbit(buffer, kbit);
		store_kc(buffer, kcontent);

		if(Uses_ICVPS2(buffer)==1){
			if(SecrDownloadGetICVPS2(icvps2)==0) {
				_printf("SecrDownloadFile: Cannot get icvps2\n");
				return NULL;
			}

			store_icvps2(buffer, icvps2);
		}

		result=buffer;
	}
	else{
		_printf("SecrDownloadFile: Cannot encrypt header\n");
		return NULL;
	}

	_printf("SecrDownloadFile complete\n");

	return result;
}
