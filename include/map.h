
struct Map
{
    /* 0x0000 */ u16 width;
    /* 0x0002 */ u16 height;
    /* 0x0004 */ u8 filler_04[0x0A22 - 0x0004];
    /* 0x0A22 */ u16 tile[(0x1432 - 0x0A22) / 2];
    /* 0x1432 */ u8 terrain[0x0A10];
    /* 0x1E42 */ u8 unk1E42[0x0508];
    /* 0x234A */ u8 unk234A[0x0508];
    /* 0x2852 */ u8 unk2852[0x1928];
    /* 0x417A */ u16 rowOffset[(0x4232 - 0x417A) / 2];
    /* 0x4232 */ u8 filler_4232[1];
    /* 0x4233 */ u8 unk4233;
};
extern struct Map * gUnknown_08499590; 


/* 
current errors 

In file included from src/decomp/c_0802A8DC.c:2:
include/map.h:16: conflicting types for `gUnknown_08499590'
include/unknown-globals.h:8695: previous declaration of `gUnknown_08499590'
src/decomp/c_0802A8DC.c: In function `sub_0802A8DC':
src/decomp/c_0802A8DC.c:31: structure has no member named `unk417A'
[ CC]   src/decomp/c_0806BD6C.c
[ CC]   src/decomp/c_08016E74.c
[ CC]   src/decomp/c_0803D788.c
[ CC]   src/decomp/c_08024378.c
[ CC]   src/decomp/c_08044534.c
[ CC]   src/decomp/c_08015DC8.c
In file included[ CC]   src/decomp/c_0806C218.c
[ CC]   src/decomp/c_0808606C.c
[ CC]   src/decomp/c_080765D8.c
[ CC]   src/decomp/c_080604BC.c
 from src/decomp/c_08010B34.c:2:
include/map.h:16: conflicting types for `gUnknown_08499590'
include/unknown-globals.h:8695: previous declaration of `gUnknown_08499590'
src/decomp/c_08010B34.c: In function `sub_08010B34':
src/decomp/c_08010B34.c:37: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:38: structure has no member named `unk417A'
src/decomp/c_08010B34.c:43: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:44: structure has no member named `unk417A'
[ CC]   src/decomp/c_08005154.c
In file includedmake: *** [Makefile:227: build/src/decomp/c_0802A8DC.o] Error 1
make: *** Waiting for unfinished jobs....
 from src/decomp/c_0802A1E4.c:2:
include/map.h:16: conflicting types for `gUnknown_08499590'
include/unknown-globals.h:8695: previous declaration of `gUnknown_08499590'
src/decomp/c_0802A1E4.c: In function `sub_0802A1E4':
src/decomp/c_0802A1E4.c:47: structure has no member named `unk0012'
src/decomp/c_0802A1E4.c:48: structure has no member named `unk417A'
src/decomp/c_0802A1E4.c: In file included from src/decomp/c_080587FC.c:2:
include/map.h:16: conflicting types for `gUnknown_08499590'
include/unknown-globals.h:8695: previous declaration of `gUnknown_08499590'
src/decomp/c_080587FC.c: In function `sub_080587FC':
src/decomp/c_080587FC.c:89: structure has no member named `unk02'
src/decomp/c_080587FC.c:91: structure has no member named `unk00'
src/decomp/c_080587FC.c:97: structure has no member named `unk417A'
src/decomp/c_080587FC.c:125: In function `sub_0802A258':
src/decomp/c_0802A1E4.c:68: structure has no member named `unk417A'
structure has no member named `unk00'src/decomp/c_080587FC.c:126: structure has no member named `unk0012'

src/decomp/c_0802A1E4.c:72: structure has no member named `unk02'
src/decomp/c_08010B34.c: In function `sub_08010DD4':
src/decomp/c_08010B34.c:183: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:184: structure has no member named `unk417A'
src/decomp/c_08010B34.c:189: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:190: structure has no member named `unk417A'
src/decomp/c_08010B34.c:194: structure has no member named `unk00'
src/decomp/c_08010B34.c:196: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:197: structure has no member named `unk417A'
src/decomp/c_08010B34.c:205: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:206: structure has no member named `unk417A'
src/decomp/c_08010B34.c:210: structure has no member named `unk02'
src/decomp/c_08010B34.c:212: structure has no member named `unk0A22'
src/decomp/c_08010B34.c:213: structure has no member named `unk417A'
In file included from src/decomp/c_0802B768.c:2:
include/map.h:16: conflicting types for `gUnknown_08499590'
include/unknown-globals.h:8695: previous declaration of `gUnknown_08499590'
src/decomp/c_0802B768.c: In function `sub_0802B868':
src/decomp/c_0802B768.c:118: structure has no member named `unk04'
src/decomp/c_0802B768.c:121: structure has no member named `unk06'
make: *** [Makefile:228: build/src/decomp/c_0802A1E4.o] Error 1
make: *** [Makefile:229: build/src/decomp/c_08010B34.o] Error 1
make: *** [Makefile:229: build/src/decomp/c_080587FC.o] Error 1
make: *** [Makefile:228: build/src/decomp/c_0802B768.o] Error 1
*/










