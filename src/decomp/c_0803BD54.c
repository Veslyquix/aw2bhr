#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x0803BD54.
 * LockMainMenu @ 0x0803BD54, UnlockMainMenu @ 0x0803BD60, GetMainMenuLock @ 0x0803BD6C
 *
 * The mainMenu third of gGameLock (include/lock.h): a plain set/clear/read
 * trio. GetMainMenuLock is the PROC_GOTO_IF_NO predicate of ProcScr_MainMenu2,
 * which is where AW2E.lua's MainMenu2_GOTO_IF_NO_0803BD6D came from; the lock
 * name is kept because the other two thirds of the same aggregate use it and
 * because the function has callers outside that script. The old sub_XXXXXXXX
 * symbols are kept as linker aliases below so every other unit keeps resolving
 * them unchanged.
 */

void LockMainMenu(void)
{
    gGameLock.mainMenu = 1;
}

void UnlockMainMenu(void)
{
    gGameLock.mainMenu = 0;
}

u8 GetMainMenuLock(void)
{
    return gGameLock.mainMenu;
}

asm(".global sub_0803BD54\n.thumb_set sub_0803BD54, LockMainMenu\n"
    ".global sub_0803BD60\n.thumb_set sub_0803BD60, UnlockMainMenu\n"
    ".global sub_0803BD6C\n.thumb_set sub_0803BD6C, GetMainMenuLock\n");
