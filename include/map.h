
struct Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ s16 unk04;
    /* 0x0006 */ s16 unk06;
    /* 0x0008 */ u16 unk08;
    /* 0x000A */ u16 unk0a;
    /* 0x000C */ u16 unk0c;
    /* 0x000E */ u16 unk0e;
    /* 0x0010 */ u16 unk10;
    /* 0x0012 */ u8 unk0012[0x0508];
    /* 0x051A */ u8 unk051A[0x0508];
    /* 0x0A22 */ u16 tile[0x508];
    /* 0x1432 */ u8 terrain[0x0A10];
    /* 0x1E42 */ u8 unk1E42[0x0508];
    /* 0x234A */ u8 unk234A[0x0508];
    /* 0x2852 */ u8 unk2852[0x0508];
    /* 0x2D5A */ u8 unk2D5A[0x0508];
    /* 0x3262 */ u8 unk3262[0x0508];
    /* 0x376A */ u8 unk376A[0x0508];
    /* 0x3C72 */ u8 unk3C72[0x0508];
    /* 0x417a */ u16 rowOffset[(0x421a - 0x417a) / 2];
    /* 0x421a */ u8 unk421a[0x4232 - 0x421a];

    /* 0x4232 */ u8 filler_4232[1];
    /* 0x4233 */ u8 unk4233;
};

// extern struct Map * gUnknown_08499590;











