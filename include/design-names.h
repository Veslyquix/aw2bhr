#ifndef GUARD_DESIGN_NAMES_H
#define GUARD_DESIGN_NAMES_H

/* Friendly names for the map-editing / design-room family and its
 * neighbours. Two provenances, and the defining src/decomp/c_ADDR.c file
 * says which applies to each: most are cross-referenced against SRR_AW2's
 * Definitions.s (Veslyquix/SRR_AW2, the same author's randomizer), and the
 * rest were named by reading this tree's own C where SRR's label did not
 * match the body. Every one is a linker alias for an existing sub_XXXXXXXX
 * symbol via .thumb_set, so the old declaration in unknown-functions.h is
 * left untouched and existing callers compile unchanged; this header is
 * only for new code that wants to call them by name. */


int MakeRiver(int x, int y);
void MakeMountain(int x, int y);
void MakeForest(int x, int y);
void MakeForestSimple(int x, int y);
void MakeRoad(int x, int y);
void MakeSea(int x, int y);
void MakeSeaSafe(int x, int y);
void MakeSeaSafest(int x, int y);
void MakeBridge(int x, int y);

void MakePipe(int x, int y);
void MakeSeam(int x, int y);
int GetSeamType(int x, int y);
int MakeReefSafe(int x, int y);
void MakeProperty(int x, int y, int t);
void MakeTile(void);
void MakeTile2(int x, int y, int v);
void SetSelectedTile(int a1);
void MapMainIdle(void);

void RepaintTile(int x, int y);
void RepaintTileRight(int x, int y);
int RemoveUnitAt(int mode, int x, int y);
void CopyString(u8 *dst, const u8 *src);
void MarkDefeatedArmies(void);
void FinalizeBattleResult(void);

#endif /* GUARD_DESIGN_NAMES_H */
