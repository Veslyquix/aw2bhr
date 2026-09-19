#include "global.h"
#include "map.h"


void MakeTileSimple(int x, int y, int val)
{
    if (val < 0)
        return;

    gMap->tile[
        gMap->rowOffset[y] + x] = val & 0x1FF;
}

asm(".global sub_08001158\n.thumb_set sub_08001158, MakeTileSimple\n");

int IsTerrainAtCoordsType(int x, int y, int k)
{
    if (x < 0 || y < 0 || y > gMap->height - 1 ||
        x > gMap->width - 1)
        return 0;

    return gMap->terrain[
        gMap->rowOffset[y] + x] == k;
}

asm(".global sub_0800119C\n.thumb_set sub_0800119C, IsTerrainAtCoordsType\n");

void SetTerrainAt(int x, int y, int val)
{
    gMap->terrain[
        gMap->rowOffset[y] + x] = val;

    if (val == TERRAIN_SEA)
        EnsureValidTile(x, y);
}

asm(".global sub_080011F4\n.thumb_set sub_080011F4, SetTerrainAt\n");

int GetDesignRoomOption(int a)
{
    switch (a & 0x1f) {
    case TERRAIN_PLAIN:
        return TERRAIN_PLAIN;
    case TERRAIN_RIVER:
        return TERRAIN_RIVER;
    case TERRAIN_MOUNTAIN:
        return TERRAIN_MOUNTAIN;
    case TERRAIN_WOOD:
        return TERRAIN_WOOD;
    case TERRAIN_ROAD:
        return TERRAIN_ROAD;
    case TERRAIN_CITY:
        return TERRAIN_CITY;
    case TERRAIN_SEA:
        return TERRAIN_SEA;
    case TERRAIN_HQ:
        return TERRAIN_HQ;
    case TERRAIN_AIRPORT:
        return TERRAIN_AIRPORT;
    case TERRAIN_PORT:
        return TERRAIN_PORT;
    case TERRAIN_BRIDGE:
        return TERRAIN_BRIDGE;
    case TERRAIN_SHOAL:
        return TERRAIN_SHOAL;
    case TERRAIN_BASE:
        return TERRAIN_BASE;
    case TERRAIN_REEF:
        return TERRAIN_REEF;
    case TERRAIN_PIPE:
        return TERRAIN_PIPE;
    case TERRAIN_PIPE_SEAM:
        return TERRAIN_PIPE_SEAM;
    case TERRAIN_SILO:
        return TERRAIN_SILO;
    }

    return 0;
}

asm(".global sub_08001230\n.thumb_set sub_08001230, GetDesignRoomOption\n");



int sub_080012DC(int a)
{
    int r;

    r = 0;

    switch (a) {
    case 6:
        r = 0x1c2;
        break;
    case 38:
        r = 0x1c7;
        break;
    case 70:
        r = 0x1cc;
        break;
    case 102:
        r = 0x1d1;
        break;
    case 134:
        r = 0x1d6;
        break;

    case 8:
        r = 0x1c0;
        break;
    case 40:
        r = 0x1c5;
        break;
    case 72:
        r = 0x1ca;
        break;
    case 104:
        r = 0x1cf;
        break;
    case 136:
        r = 0x1d4;
        break;

    case 10:
        r = 0x1c3;
        break;
    case 42:
        r = 0x1c8;
        break;
    case 74:
        r = 0x1cd;
        break;
    case 106:
        r = 0x1d2;
        break;
    case 138:
        r = 0x1d7;
        break;

    case 11:
        r = 0x1c4;
        break;
    case 43:
        r = 0x1c9;
        break;
    case 75:
        r = 0x1ce;
        break;
    case 107:
        r = 0x1d3;
        break;
    case 139:
        r = 0x1d8;
        break;

    case 14:
        r = 0x1c1;
        break;
    case 46:
        r = 0x1c6;
        break;
    case 78:
        r = 0x1cb;
        break;
    case 110:
        r = 0x1d0;
        break;
    case 142:
        r = 0x1d5;
        break;

    case 17:
        r = 0x180;
        break;
    }

    return r;
}

int IsTerrainLand(int x, int y)
{
    struct Map *map = gMap;
    int v;
    int w;
    int s;
    int r;

    v = map->terrain[map->rowOffset[y] + x];

    if (v == TERRAIN_RIVER)
        s = sub_080094EC(x, y);
    else
        s = 0;

    w = sub_08008C34(x, y);

    r = 0;
    if (v != TERRAIN_SEA && v != TERRAIN_SHOAL && v != TERRAIN_REEF && w == 0 &&
        s == 0)
        r = 1;

    return r;
}

asm(".global sub_080015E4\n.thumb_set sub_080015E4, IsTerrainLand\n");

int IsTerrainWater(int x, int y)
{
    struct Map *map = gMap;
    int v;
    int r;

    v = map->terrain[map->rowOffset[y] + x];

    r = 0;

    if (v != TERRAIN_SEA && v != TERRAIN_SHOAL)
        r = (v != TERRAIN_REEF);

    return r;
}

asm(".global sub_0800164C\n.thumb_set sub_0800164C, IsTerrainWater\n");

int IsTerrainWaterOrRiver(int x, int y)
{
    struct Map *map = gMap;
    int v;
    int r;

    v = map->terrain[map->rowOffset[y] + x];

    r = 0;

    if (v != TERRAIN_SEA && v != TERRAIN_SHOAL && v != TERRAIN_REEF)
        r = (v != TERRAIN_RIVER);

    return r;
}

asm(".global sub_0800168C\n.thumb_set sub_0800168C, IsTerrainWaterOrRiver\n");

int GetTileWithShadow_unkMapA22(int x, int y)
{
    struct Map *map = gMap;

    return GetTileWithShadow(x, y, map->tile[map->rowOffset[y] + x]);
}

asm(".global sub_080016D0\n.thumb_set sub_080016D0, "
    "GetTileWithShadow_unkMapA22\n");


int GetTileWithShadow(int x, int y, int v)
{
    const s16 *pa;
    const s16 *pb;
    int off;
    int i;

    pa = gUnknown_0848591C[0];
    pb = gUnknown_0848591C[1];

    if (x <= 0) {
        for (i = 0; i <= 0x30; i++) {
            if (v == *pb)
                return *pa;
            pa++;
            pb++;
        }
    } else {
        off = gMap->rowOffset[y] - 1;
        off += x;

        switch (gMap->terrain[off]) {
        case 3:
        case 4:
        case 6:
        case 8:
        case 10:
        case 11:
        case 14:
        case 38:
        case 40:
        case 42:
        case 43:
        case 46:
        case 70:
        case 72:
        case 74:
        case 75:
        case 78:
        case 102:
        case 104:
        case 106:
        case 107:
        case 110:
        case 134:
        case 136:
        case 138:
        case 139:
        case 142:
            for (i = 0; i <= 0x30; i++) {
                if (v == *pa) {
                    if (*pb == 0x21 && IsTerrainAtCoordsType(x, y + 1, TERRAIN_MOUNTAIN))
                        return 3;
                    return *pb;
                }
                pa++;
                pb++;
            }
            break;
        default:
            for (i = 0; i <= 0x30; i++) {
                if (v == *pb)
                    return *pa;
                pa++;
                pb++;
            }
            break;
        }
    }

    return -1;
}

asm(".global sub_08001704\n.thumb_set sub_08001704, GetTileWithShadow\n");

int GetTileWithShadow2(int x, int y, int v)
{
    const s16 *pa;
    const s16 *pb;
    int off;
    int i;

    pa = gUnknown_0848591C[0];
    pb = gUnknown_0848591C[1];

    if (x <= 0) {
        for (i = 0; i <= 0x30; i++) {
            if (v == *pb)
                return *pa;
            pa++;
            pb++;
        }
    } else {
        off = gMap->rowOffset[y] - 1;
        off += x;

        switch (gMap->terrain[off]) {
        case 3:
        case 4:
        case 6:
        case 8:
        case 10:
        case 11:
        case 14:
        case 38:
        case 40:
        case 42:
        case 43:
        case 46:
        case 70:
        case 72:
        case 74:
        case 75:
        case 78:
        case 102:
        case 104:
        case 106:
        case 107:
        case 110:
        case 134:
        case 136:
        case 138:
        case 139:
        case 142:
            for (i = 0; i <= 0x30; i++) {
                if (v == *pa)
                    return *pb;
                pa++;
                pb++;
            }
            break;
        default:
            for (i = 0; i <= 0x30; i++) {
                if (v == *pb)
                    return *pa;
                pa++;
                pb++;
            }
            break;
        }
    }

    return -1;
}

asm(".global sub_08001A04\n.thumb_set sub_08001A04, GetTileWithShadow2\n");
