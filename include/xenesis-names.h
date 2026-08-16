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

#endif // GUARD_XENESIS_NAMES_H
