#ifndef GUARD_DATA_NAMES_H
#define GUARD_DATA_NAMES_H

/* Friendly names for the small accessors over the ROM data tables in
 * include/unknown-globals.h -- the per-unit-type, per-terrain, per-CO and
 * map-header records. Each name was read off this tree's own C once the
 * record's fields had been named from the community Nightmare modules; the
 * field names are what make these bodies one-liners, so the provenance is the
 * module for the FIELD and this tree for the FUNCTION. Every one is a linker
 * alias for an existing sub_XXXXXXXX symbol via .thumb_set, so the old
 * declaration in unknown-functions.h stays and existing callers compile
 * unchanged; this header is only for new code that wants to call them by name.
 */

const u8 * GetTerrainNameGraphic(int a1);
const u8 * GetTerrainNamePalette(int a, int b);
void *GetUnitSpriteFormat(u16 i);
u16 GetCoMusic(u8 a1);
int GetCoPowerStarCost(int a1);
int GetCoPowerCost(int a1);
int GetSuperCoPowerCost(int a1);
int GetTerrainDefense(int a1, s8 a2, u8 a3);
int IsUnitSoldier(struct Unk030040D8 *p);
int IsUnitAir(struct Unk030040D8 *p);

#endif /* GUARD_DATA_NAMES_H */
