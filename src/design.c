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
    case TERRAIN_CITY:
        r = 0x1c2;
        break;
    case TERRAIN_CITY_OS:
        r = 0x1c7;
        break;
    case TERRAIN_CITY_BM:
        r = 0x1cc;
        break;
    case TERRAIN_CITY_GE:
        r = 0x1d1;
        break;
    case TERRAIN_CITY_YC:
        r = 0x1d6;
        break;

    case TERRAIN_HQ:
        r = 0x1c0;
        break;
    case TERRAIN_HQ_OS:
        r = 0x1c5;
        break;
    case TERRAIN_HQ_BM:
        r = 0x1ca;
        break;
    case TERRAIN_HQ_GE:
        r = 0x1cf;
        break;
    case TERRAIN_HQ_YC:
        r = 0x1d4;
        break;

    case TERRAIN_AIRPORT:
        r = 0x1c3;
        break;
    case TERRAIN_AIRPORT_OS:
        r = 0x1c8;
        break;
    case TERRAIN_AIRPORT_BM:
        r = 0x1cd;
        break;
    case TERRAIN_AIRPORT_GE:
        r = 0x1d2;
        break;
    case TERRAIN_AIRPORT_YC:
        r = 0x1d7;
        break;

    case TERRAIN_PORT:
        r = 0x1c4;
        break;
    case TERRAIN_PORT_OS:
        r = 0x1c9;
        break;
    case TERRAIN_PORT_BM:
        r = 0x1ce;
        break;
    case TERRAIN_PORT_GE:
        r = 0x1d3;
        break;
    case TERRAIN_PORT_YC:
        r = 0x1d8;
        break;

    case TERRAIN_BASE:
        r = 0x1c1;
        break;
    case TERRAIN_BASE_OS:
        r = 0x1c6;
        break;
    case TERRAIN_BASE_BM:
        r = 0x1cb;
        break;
    case TERRAIN_BASE_GE:
        r = 0x1d0;
        break;
    case TERRAIN_BASE_YC:
        r = 0x1d5;
        break;

    case TERRAIN_SILO:
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
        case TERRAIN_MOUNTAIN:
        case TERRAIN_WOOD:
        case TERRAIN_CITY:
        case TERRAIN_HQ:
        case TERRAIN_AIRPORT:
        case TERRAIN_PORT:
        case TERRAIN_BASE:
        case TERRAIN_CITY_OS:
        case TERRAIN_HQ_OS:
        case TERRAIN_AIRPORT_OS:
        case TERRAIN_PORT_OS:
        case TERRAIN_BASE_OS:
        case TERRAIN_CITY_BM:
        case TERRAIN_HQ_BM:
        case TERRAIN_AIRPORT_BM:
        case TERRAIN_PORT_BM:
        case TERRAIN_BASE_BM:
        case TERRAIN_CITY_GE:
        case TERRAIN_HQ_GE:
        case TERRAIN_AIRPORT_GE:
        case TERRAIN_PORT_GE:
        case TERRAIN_BASE_GE:
        case TERRAIN_CITY_YC:
        case TERRAIN_HQ_YC:
        case TERRAIN_AIRPORT_YC:
        case TERRAIN_PORT_YC:
        case TERRAIN_BASE_YC:
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
        case TERRAIN_MOUNTAIN:
        case TERRAIN_WOOD:
        case TERRAIN_CITY:
        case TERRAIN_HQ:
        case TERRAIN_AIRPORT:
        case TERRAIN_PORT:
        case TERRAIN_BASE:
        case TERRAIN_CITY_OS:
        case TERRAIN_HQ_OS:
        case TERRAIN_AIRPORT_OS:
        case TERRAIN_PORT_OS:
        case TERRAIN_BASE_OS:
        case TERRAIN_CITY_BM:
        case TERRAIN_HQ_BM:
        case TERRAIN_AIRPORT_BM:
        case TERRAIN_PORT_BM:
        case TERRAIN_BASE_BM:
        case TERRAIN_CITY_GE:
        case TERRAIN_HQ_GE:
        case TERRAIN_AIRPORT_GE:
        case TERRAIN_PORT_GE:
        case TERRAIN_BASE_GE:
        case TERRAIN_CITY_YC:
        case TERRAIN_HQ_YC:
        case TERRAIN_AIRPORT_YC:
        case TERRAIN_PORT_YC:
        case TERRAIN_BASE_YC:
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
