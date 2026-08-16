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

extern void EnsureValidTile(int x, int y);
extern int sub_080094EC(int x, int y);
extern int sub_08008C34(int x, int y);
int GetTileWithShadow(int x, int y, int tile); 

// clang-format off
struct playSt { 
    u8 unk3FC0; 
    u8 gameMode; // Game Mode (1 = Campaign, 2 = War Room, 3 = Versus)
    u16 mapID; //- Map ID
    u8 event20; //- Set by Event 0x20, Trigger condition for certain Events
	
	u8 dispMiniPanel; //		- Whether the Terrain/Unit Info Minipanel is displayed (0 = Off, 1 = On)
	u8 campaignRelated; //		- Campaign Setting - Set by Events
	u8 eventRelated; //		- Set by some Events?
	u8 coAbilities; //		- CO Abilities On/Off
	u8 animOpts; //		- Animation Mode Options (1-3 = A-C, 0 = Off)
	u8 unk3FCA; //		-
	u8 unk3FCB; //		-
	u8 bgmOn; //3FCC		- Music On/Off
	u8 fog; //		- Fog of War
	u8 unk3FCE;//		-
	u8 unk3FCF;	//	-
    u32 unk3FD0; //	(w)	- Appears to be unused
	u32 unk3FD4;// (w)	- Has the value "100,000" stored for Vs. Menu Map Selection
	u32 unk3FD8;// (w)	- Has the value "100,000" stored for Vs. Menu Map Selection
	u32 unk3FDC;// (w)	- Has the value "100,000" stored for Vs. Menu Map Selection

	u32 unk3FE0;// (w)	- Has the value "100,000" stored for Vs. Menu Map Selection
	u8 unk3FE4;//		-
	u8 unk3FE5;//		-
	u8 unk3FE6;//		-
	u8 unk3FE7;//		-
	u16 propertyFunds; //	(hw)	- Funds per property
	u8 unk3FEA;//		-
	u8 unk3FEB;//		-
	u8 weather;//		- Currently Active Weather
	u8 randomWeatherOn;//		- Random Weather on/off
	u8 unk3FEE; //		- 
	u8 defaultWeather; //		- Default Weather

	u8 turnLimit;//		- Turn Limit
	u8 captureLimit; //3FF1		- Capture Limit
	u8 savingEnabled; //3FF2		- Toggle to Enable/Disable Saving
	u8 unk3FF3;//		-
	u8 p1Color; //3FF4		- Army 1 Colour (Only used during setup)
	u8 p2Color; //3FF5		- Army 2 Colour (Only used during setup)
	u8 p3Color; //3FF6		- Army 3 Colour (Only used during setup)
	u8 p4Color; //3FF7		- Army 4 Colour (Only used during setup)
	u8 unk3FF8; //		-
	u8 p1AiControlled; //3FF9		- Army 1 AI/Player (Setup)
	u8 p2AiControlled; //3FFA		- Army 2 AI/Player (Setup)
	u8 p3AiControlled; //3FFB		- Army 3 AI/Player (Setup)
	u8 p4AiControlled; //3FFC		- Army 4 AI/Player (Setup
	u8 unk3FFD; //		-
	u8 p1CO; //3FFE		- Army 1 CO (Setup)
	u8 p2CO; //3FFF		- Army 2 CO (Setup)
	u8 p3CO; //4000		- Army 3 CO (Setup)
	u8 p4CO; //4001		- Army 4 CO (Setup)


}; 


struct activeMap {
  u8 unk1[0x8-0]; 
  u16 SelectedTileX;
  u16 SelectedTileY;
  u8 unk2[0x12-0xC]; 
  u8 Surplus; // +0x12
  u8 unk3[0x28-0x13]; 
  u16 unk4; 
  u16 SelectedTile; // press B in design room on tile 
  u16 unk2C;
  u8 unk5[0x36-0x2E];
  u16 unk36; 
  u16 unk38; 
  u16 unk3a;
  u16 previousTile; 
  u8 unk6[0x4c-0x3e];
  u16 unk4c; 
};

// clang-format on

extern s16 gUnknown_0200B224[];
extern struct activeMap *gUnknown_0200B0B0; // gActiveMap
extern struct playSt gPlaySt;
extern u8 gUnknown_084859E0[];

// Xenesis's docs list these two at 0x0200B02E/0x0200B02F, which is inside
// gUnknown_0200B000 (0x0200B000-0x0200B0AF), not an offset into activeMap
// (gUnknown_0200B0B0) -- a past pass at this struct mislabeled them at
// offset 0x2E/0x2F of activeMap by reusing the raw doc offset against the
// wrong base. Not yet used by any matched code.
struct Unk_0200B000 {
  u8 unk[0x2E];
  u8 factionProperties; // Army for properties
  u8 factionUnits;      // Which army the menu units belong to
};
extern struct Unk_0200B000 gUnknown_0200B000;














#endif 