/* Typed views of the save-system globals. include/unknown-globals.h declares
 * these symbols with the untyped widths their first users measured, so the
 * draft renames those declarations away and redeclares the same symbols with
 * their real types. On promotion this becomes gMap-style header declarations
 * plus aw2bhr.lds aliases. gUnknown_0200CC88 is already a struct in the header. */
#define gUnknown_0200CC24 gUnknown_0200CC24_untyped
#define gUnknown_0200CC2C gUnknown_0200CC2C_untyped
#include "global.h"
#undef gUnknown_0200CC24
#undef gUnknown_0200CC2C

/* One 4 KiB flash sector, assembled in the gUnknown_02002000 staging buffer
 * before each write attempt. The buffer must stay a cast view: declaring the
 * symbol itself as this struct costs +20 bytes (measured). */
struct SaveSector
{
    /* 0x000 */ u32 signature;
    /* 0x004 */ u8 marker;
    /* 0x005 */ u8 version;
    /* 0x006 */ u8 checksum;
    /* 0x007 */ u8 checksumInverse;
    /* 0x008 */ u32 generation;
    /* 0x00c */ u8 segmentTag;
    /* 0x00d */ u8 saveId;
    /* 0x00e */ u16 dataOffset;
    /* 0x010 */ u32 slotGenerations[16];
    /* 0x050 */ u16 dataLength;
    /* 0x052 */ u8 data[0xf9d];
    /* 0xfef */ u8 slotOwners[16];
    /* 0xfff */ u8 endMarker;
};
#define gSaveSector (*(struct SaveSector *)gUnknown_02002000)

/* How the save data is split across sectors. */
struct SaveSegments
{
    /* 0x00 */ int length[16];
    /* 0x40 */ int offset[16];
};

extern u8 *gUnknown_0200CC2C;           /* the save data being written */
extern int (*gUnknown_0200CC24)(u8 *);  /* returns the size of gSaveData */
#define gSaveData gUnknown_0200CC2C
#define gSaveDataSize gUnknown_0200CC24

/* Write a save to flash, using spare slots and retrying failed sectors. */
int WriteSaveSlotsToFlash(u8 saveId, void *unused, int byteCount) asm("sub_0801A7D8");
int WriteSaveSlotsToFlash(u8 saveId, void *unused, int byteCount)
{
    struct SaveSegments segments;
    int *offsets;  /* measured: a register alias for segments.offset */
    u8 freeSlots[16];
    u8 writtenSlots[16];
    int segmentCount;
    int lastByte;  /* measured: the retry path re-reads the end marker by index */
    u8 id;         /* the working save id; saveId itself is only live early */
    u8 freeCount;
    u8 retryCount;
    int segment;
    int slot;
    int i, j;
    int length;
    int total;
    u8 checksum;
    u8 updatedFlags;
    int preservedFlags; /* int, not u8: keeps the ROM's zero-register OR */

    sub_0801B598(gUnknown_0200CC30, (void (**)(void))gUnknown_0200CC34);
    id = saveId;

    slot = 0;
    freeCount = 0;
    for (i = 0; i < 16; i++)
    {
        if (gUnknown_0200CC38.unk00[i] == saveId || gUnknown_0200CC38.unk00[i] == 0)
            gUnknown_0200CC38.unk10[i] = 0xff;
        else if (gUnknown_0200CC38.unk00[i] == 0xff)
        {
            freeSlots[freeCount] = i;
            freeCount++;
        }
        writtenSlots[i] = 0;
    }

    for (i = 0; i < freeCount - 1; i++)
    {
        for (j = i + 1; j < freeCount; j++)
        {
            if (gUnknown_0200CC88.slotGeneration[freeSlots[i]] < gUnknown_0200CC88.slotGeneration[freeSlots[j]])
            {
                u8 oldSlot = freeSlots[j];
                freeSlots[j] = freeSlots[i];
                freeSlots[i] = oldSlot;
            }
        }
    }

    for (;;)
    {
        total = 0;
        segmentCount = 0;
        while (byteCount != 0)
        {
            length = 0xfad;
            if (segmentCount == 0 && id == 0)
                length -= 0x10;
            if (length > byteCount)
                length = byteCount;
            byteCount -= length;
            segments.length[segmentCount] = length;
            segments.offset[segmentCount] = total;
            total += length;
            segmentCount++;
        }

        retryCount = 0;
        for (segment = segmentCount - 1; segment >= 0; )
        {
            switch (retryCount)
            {
            case 4:
                gUnknown_0200CC38.unk20[slot] |= 2;
                retryCount = 0;
                /* fallthrough */
            case 0:
                if (freeCount == 0)
                {
                    for (i = 0; i < 16; i++)
                        gUnknown_0200CC38.unk10[i] = gUnknown_0200CC38.unk00[i];
                    return 1;
                }
                freeCount--;
                slot = freeSlots[freeCount];
                break;
            }
            retryCount++;
            /* Bump this slot's write generation unless it is saturated. */
            if (gUnknown_0200CC88.slotGeneration[slot] != -1)
                gUnknown_0200CC88.slotGeneration[slot]++;
            gUnknown_0200CC38.unk10[slot] = id;
            offsets = segments.offset;

            for (i = 0; i <= 0xfff; i++)
                gUnknown_02002000[i] |= 0xff;
            lastByte = 0xfff;
            gSaveSector.signature = 0x73726132;
            if (gUnknown_0200CC38.unk40[slot] == 0x55)
            {
                gSaveSector.marker = 0x55;
                gSaveSector.endMarker = 0xaa;
            }
            else
            {
                gSaveSector.marker = 0xaa;
                gSaveSector.endMarker = 0x55;
            }
            i = 0xf; /* measured: the version goes through a register local */
            gSaveSector.version = i;
            gSaveSector.checksum = 0;
            gSaveSector.checksumInverse = 0xff;
            gSaveSector.generation = gUnknown_0200CD08;
            gSaveSector.segmentTag = segment * 16 + segmentCount - 1;
            gSaveSector.saveId = id;
            gSaveSector.dataOffset = offsets[segment];
            for (i = 0; i < 16; i++)
                gSaveSector.slotGenerations[i] = gUnknown_0200CC88.slotGeneration[i];
            gSaveSector.dataLength = segments.length[segment];
            for (i = 0; i < segments.length[segment]; i++)
                gSaveSector.data[i] = gSaveData[segments.offset[segment] + i];

            if (segment == 0 && id == 0)
            {
                for (i = 0; i < 16; i++)
                    gUnknown_0200CC38.unk00[i] = gUnknown_0200CC38.unk10[i];
                if (gUnknown_0200CD08 == 0)
                {
                    for (i = 0; i < 16; i++)
                    {
                        if (writtenSlots[i] == 0 && i != slot)
                            gSaveSector.slotOwners[i] |= 0xff;
                        else
                            gSaveSector.slotOwners[i] = gUnknown_0200CC38.unk00[i];
                    }
                }
                else
                {
                    for (i = 0; i < 16; i++)
                        gSaveSector.slotOwners[i] = gUnknown_0200CC38.unk00[i];
                }
            }
            checksum = 0;
            for (i = 0; i <= 0xfff; i++)
                checksum += gUnknown_02002000[i];
            gSaveSector.checksum = checksum;
            gSaveSector.checksumInverse = ~checksum;

            preservedFlags = 0;
            /* Program the sector, then verify it. */
            sub_0801B618(slot, (int)&gSaveSector);
            if (sub_0801B648(slot, (int)&gSaveSector) == 0)
            {
                j = slot; /* measured: the flag read goes through j */
                updatedFlags = gUnknown_0200CC38.unk20[j] | 8 | preservedFlags;
                gUnknown_0200CC38.unk20[slot] = updatedFlags & 0xfb;
                gUnknown_0200CC38.unk30[slot] = gSaveSector.segmentTag;
                gUnknown_0200CC38.unk40[slot] = gSaveSector.endMarker;
                gUnknown_0200CC88.slotGeneration[slot] = gSaveSector.generation;
                retryCount = 0;
                writtenSlots[slot] = 1;
                segment--;
            }
            else
            {
                gUnknown_0200CC38.unk10[slot] = 0xff;
                gUnknown_0200CC38.unk40[slot] = gUnknown_02002000[lastByte];
                retryCount++;
            }
        }

        if (gUnknown_0200CD08 <= (u32)-2)
            gUnknown_0200CD08++;
        if (id == 0)
            return 0;
        id = 0;
        /* After the requested save, rewrite save 0 (the slot directory). */
        byteCount = gSaveDataSize(gSaveData);
    }
}
