#ifndef GUARD_LOCK_H
#define GUARD_LOCK_H

/* The three byte-sized locks at 0x030030F0, reached off one symbol: every
 * access in the ROM goes through one pool word for 0x030030F0 plus a
 * displacement, so the original had a single aggregate here. Each lock has its
 * own small accessor set, in the shape fe8u spells LockGame / UnlockGame.
 *
 * `gGameLock` is a linker alias for `gUnknown_030030F0` (aw2bhr.lds) -- the
 * canonical address symbol stays available for assembly and for the historical
 * notes that cite it.
 *
 *   map             a DEPTH COUNTER, not a flag: IncrementMapLock bumps it,
 *                   DecrementMapLock decrements with a floor at zero, and
 *                   RemoveMapLock clears it outright. SIGNED -- DecrementMapLock
 *                   reads it with `ldrsb` and GetMapLock returns it
 *                   sign-extended.
 *   unitSelection   INFERRED, from the single site that reads it: sub_0802E6C0,
 *                   state 4 of the map control loop (src/decomp/c_0802DC2C.c).
 *                   With the lock clear it re-establishes the selected unit at
 *                   the coordinates stashed in gUnknown_030040D8 (sub_08035810,
 *                   sub_080258CC, sub_0802E4B4); with it set it drops straight
 *                   to state 0, the idle map. Every action-completion handler
 *                   in the 0x0802Cxxx-0x08041xxx block sets it; only
 *                   sub_0802E60C, the move-confirm path, clears it. Name it
 *                   something else if a second read site says otherwise.
 *   mainMenu        a plain flag: LockMainMenu sets it, UnlockMainMenu clears
 *                   it, GetMainMenuLock reads it.
 *
 * unitSelection and mainMenu are only ever read zero-extended, so u8 is the
 * weakest type that fits; s8 fits equally well if a sign-extending read ever
 * turns up.
 */
struct GameLock /* 0x03 */
{
    /* 0x00 */ s8 map;
    /* 0x01 */ u8 unitSelection;
    /* 0x02 */ u8 mainMenu;
};

extern struct GameLock gGameLock;

/* Each of these is a linker alias for an existing sub_XXXXXXXX symbol via
 * .thumb_set -- see the defining src/decomp/c_ADDR.c file. The old
 * sub_XXXXXXXX declarations in unknown-functions.h are left untouched. */

int GetMapLock(void);
void IncrementMapLock(void);
void DecrementMapLock(void);
void RemoveMapLock(void);

void LockUnitSelection(void);
void UnlockUnitSelection(void);
u8 GetUnitSelectionLock(void);

void LockMainMenu(void);
void UnlockMainMenu(void);
u8 GetMainMenuLock(void);

#endif // GUARD_LOCK_H
