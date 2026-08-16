#ifndef GUARD_XENESIS_NAMES_H
#define GUARD_XENESIS_NAMES_H

/* Friendly names for functions cross-referenced against Xenesis's AW2
 * Datasheet / Subroutine List (community reverse-engineering notes, kept
 * outside this repository). Each one is a linker alias for an existing
 * sub_XXXXXXXX symbol -- see the defining src/decomp/c_ADDR.c file for the
 * `.thumb_set` directive and the Xenesis citation. The old sub_XXXXXXXX
 * declaration in unknown-functions.h is left untouched so every existing
 * caller keeps compiling unchanged; this header is only for new code that
 * wants to call these by name.
 */

void SubtractPlayerFunds(u16 player, u32 amount);
void AddPlayerFunds(u16 player, u32 amount);
void SubtractUnitFuel(struct Unk08499594 *unit, u8 amount);
bool8 IsPlayerAliveAndActive(u8 player);
void AddPlayerIncomeToFunds(void);
int IsCampaignMapUnlocked(u32 mapId);
void SetPlayerCoPowerStatus(int player);
void ClearPlayerCoPowerStatus(int player);
int GetCoPowerDepth(void);
void IncrementCoPowerDepth(void);
void DecrementCoPowerDepthIfNonzero(void);
u32 GetNextRandomNumber(void);
int GetLoadedCoPalette(int index);
void SetLoadedCoPalette(int index, u8 value);
int GetCoAttackBonus(int coId, int coPowerState, int unitType);
int GetCoDefenceBonus(int coId, int coPowerState, int unitType);
int GetCoMovementBonus(int coId, int coPowerState, int unitType);
int GetCoRangeBonus(int coId, int coPowerState, int unitType);
int GetUnitCombatClassColumn(int unitType);
u32 TrySpendBattleMapPoints(u32 amount);
struct Unk08499594 *CreateUnitAt(s16 a1, s16 a2, s16 a3);
void *BuyUnit(int a1, int a2, int a3);
bool8 IsNeotanksUnlocked(int army);
int IsCampaignCompletionFlagSet(int id);
u32 GetClampedRankScoreSum(u8 player);
u8 GetSpeedScore(u8 player);
u8 GetPowerScore(u8 player);
u8 GetTechScore(u8 player);
void DrawInfoBoxCombobox(void);
void StartSupplyAnimation(struct Unk802C57C *a1, u8 a2, int a3, u8 a4);
bool8 CanShowSubMenuItem(void);
void SetDefaultRules(void);
void ResetRulesAfterCampaignMap(void);
void PlayWeatherChangeSound(struct Unk03001470 *p);
void ChangeGameWeather(u8 weatherId);
void LoadWeatherData(void);

#endif // GUARD_XENESIS_NAMES_H
