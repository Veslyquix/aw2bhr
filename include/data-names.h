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

void *GetCoPowerAnimation(int a);
void *GetCoPowerAnimationPalette(int a);
int IsCoPowerAvailable(int a1);
bool8 IsTerrainSilo(s16 a, s16 b);
void CalcRandomWeatherChances(void);
void DrawDaysRemaining(int x, int y);
bool8 IsPlayer1TeamAlive(void);
void DrawOamObject(int a1, int a2, int a3, int a4, int a5);
int RepairUnit(struct Unk08499594 *p, u16 a2, u8 a3);

int HasNoDeathRay(void);
int HasNoLaser(void);
int HasNoBlackCannon(void);
int HasNoMinicannon(void);
int HasNoPipeSeams(void);
bool8 CountLivingInventionsOfType(int a1);
int CountUnitsOfType(int a1);
bool8 ShouldPromptCountryName(void);

void AiDoNothing(void);
void AiChargeAggressively(void);
void AiMoveWithFrontLine(void);
void AiMoveUpConservatively(void);
void AiProtectHq(void);
void AiConsiderBuildingTCopter(void);
void AiConsiderBuildingApc(void);
void AiConsiderBuildingLander(void);
int GetCampaignMissionId(void);
void ClearArmyCount(void);

bool8 CopUnitCondAlways(void *unit);
u8 CopCondAlways(int mode);
int CopCondStartOfTurn(void);
int CopCondTurnBoundary(int a);
int CopCondUnitsInjured(void);
int CopCondNotSnowing(void);
void LoadMapData(u16 a1);
void DrawWindowBackground(int a1, int a2, int a3, int a4, u16 *a5, int a6);
void EnableCoPowers(void);
void DisableCoPowers(void);

#endif /* GUARD_DATA_NAMES_H */
