#ifndef DESIGN_H
#define DESIGN_H




// Design room definitions
// 0
#define _Plain 1
#define _River 2
#define _Mtn 3
#define _Wood 4
#define _Road 5
#define _City 6
#define _Sea 7
#define _HQ 8
// 9
#define _Arprt 0xA
#define _Port 0xB
#define _Brdg 0xC
#define _Shoal 0xD
#define _Base 0xE
#define _Pipe 0xF
#define _Seam 0x10
#define _Silo 0x11
// 0x12
#define _Reef 0x13
// 0x1432 - 0xa22 = 0xA10 / 2 = 0x508 aka #1288 size 
// this approximately lines up with 33x38 as the biggest map at #1254 tiles
// 
struct Unk_0201E450 {
    u16 sizeX; // map size 
    u16 sizeY; 
    STRUCT_PAD(0x0004, 0x0A22);
    u16 unkMap_0A22[0x508]; // length 0x508? 
    u8 terrainMap_1432[0x508]; // offset 0x1432 - length unknown 
    STRUCT_PAD(0x193a, 0x417A);
    u16 tileMap_417A[0x508]; // length unknown
};

extern struct Unk_0201E450 * gUnknown_08499590;

extern void sub_08008BB8(int x, int y);
extern int sub_080094EC(int x, int y);
extern int sub_08008C34(int x, int y);
extern int GetMostFittingTile(int x, int y, u16 tile); 















#endif 