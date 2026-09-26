#ifndef GUARD_UNIT_H
#define GUARD_UNIT_H

/* The unit record and the per-unit-type stats table it indexes. The record is
 * the 0x0c-byte entry gUnits[] holds, 64 slots per army and 1-based within the
 * army block.
 *
 * Moved out of include/unknown-globals.h; every evidence comment below is the
 * original wave note, unchanged.
 */

/* Unit-type ids: Unit.type, and the row index into gUnknown_085D5ABC. Each
 * value was checked against its row's name string and cost in the ROM. The
 * gaps (0, 4, 9, 12, 13, 18) are unused rows: copies of another unit's row
 * with a cost of 0. `UnitTypeId` rather than `UnitType`, which is already the
 * table's struct tag. From npiriou's PR #1. */
enum UnitTypeId
{
    UNIT_INFANTRY = 1,
    UNIT_MECH = 2,
    UNIT_MEDIUM_TANK = 3,
    UNIT_TANK = 5,
    UNIT_RECON = 6,
    UNIT_APC = 7,
    UNIT_NEOTANK = 8,
    UNIT_ARTILLERY = 10,
    UNIT_ROCKETS = 11,
    UNIT_ANTI_AIR = 14,
    UNIT_MISSILES = 15,
    UNIT_FIGHTER = 16,
    UNIT_BOMBER = 17,
    UNIT_BATTLE_COPTER = 19,
    UNIT_TRANSPORT_COPTER = 20,
    UNIT_BATTLESHIP = 21,
    UNIT_CRUISER = 22,
    UNIT_LANDER = 23,
    UNIT_SUBMARINE = 24,
};

/* The bitfields at 0x04..0x06 come from sub_08042998, which reads the same
 * three offsets with the same widths off BOTH gUnknown_08499594[i] (stride
 * 0x0c, so this type) and **gUnknown_08091364 -- so the two are one type, and
 * sub_08025B80's pointer parameter is this struct.
 */
struct Unit /* 0x0c */
{
    /* 0x00 */ u8 type;      /* the unit-type id, and it is UNSIGNED on its own
                               * evidence rather than only by the
                               * gUnknown_085D5ABC[unk00] subscript: sub_0805CC88
                               * filters on `(u8)(unk00 - 0x10) <= 1`
                               * (`subs #0x10; lsls #0x18; lsrs #0x18; cmp #1;
                               * bhi`) -- a u8 truncation of the difference and
                               * an unsigned compare, which is how a two-value
                               * id range is spelled with one branch. 0 is the
                               * "empty slot" sentinel every builder tests
                               * first, so the ids 0x10 and 0x11 are a pair of
                               * adjacent types. */
    /* 0x01 */ u8 flags;      /* a flag byte; the 0x0805Cxxx list builders skip
                               * an entry whose bit 0 is set (`ldrb [.,#1];
                               * movs #1; ands`). Plain mask, not a bitfield --
                               * a 1-bit field would have been extracted with a
                               * shift pair. */
    /* 0x02 */ u8 x;      /* wave 15 (C): a CELL COLUMN. sub_08058A2C adds
                               * it to gUnknown_08499590's rowOffset[unk03] to
                               * form the screen index, which is the x half of
                               * the c_08001158.c idiom. */
    /* 0x03 */ u8 y;      /* the matching row: `ldrb [.,#3]; lsls #1` is the
                               * `y * 2` that indexes rowOffset[] at +0x417A. */
    /* 0x04 */ u16 hp:7; /* ldrb [.,#4]; lsls #25; lsrs #25 */
               u16 ammo:4; /* ldrh [.,#4]; lsls #21; lsrs #28 -- spans into
                               * byte 5, which is why the container is u16 */
               u16 unk05_3:5; /* byte 5 bits 3..7, kept by `movs #7; ands` */
                              /* Wave 44, W44-E: a relational compare on
                               * unk04_0 comes out UNSIGNED. sub_0805C208's
                               * `unk04_0 <= 0x5a` is `lsls #0x19; lsrs #0x19;
                               * cmp #0x5a; bhi`, and it matched with no cast --
                               * agbcc emits the compare against the
                               * zero-extended temporary rather than against the
                               * int the field would promote to. Do not add a
                               * `(u8)`/`(u32)` cast to chase a `bhi` on any of
                               * these fields; it is already there. */
    /* 0x06 */ u8 fuel:7;  /* sub_08025B80: ldrb [.,#6]; lsls #25; lsrs #25,
                               * cleared with `movs #0x80; rsbs` = ~0x7f */
               u8 unk06_7:1;  /* sub_08042998: lsrs #7 */
    /* 0x07 */ u8 unk07;      /* wave 15 (C): two flag bytes read as a pair by
                               * sub_08058A2C -- `if (unk08) v *= 2; else if
                               * (!unk07) v >>= 3;` -- so they are alternatives
                               * rather than one field. Both plain `ldrb`.
                               *   Wave 39, W39-F: they are very likely ONE
                               * 2-element array of unit IDS, not two flags.
                               * sub_0802A304 walks them with a VARIABLE index
                               * (`adds r0, p, #7; adds r4, r0, i`), stops at
                               * gUnknown_085D5ABC[unk00].unk14[0] -- the 1-or-2
                               * capacity byte -- and hands each non-zero one to
                               * sub_08029978/sub_08029A48 as
                               * `&gUnknown_08499594[id]`, i.e. as a subscript
                               * into this very array. That is a transport's
                               * cargo list, and it reconciles with wave 15:
                               * "unk08 set" means two units aboard.
                               *   DELIBERATELY NOT RESHAPED. Merging them into
                               * `u8 unk07[2]` would change a member several
                               * promoted functions read by name, and the
                               * offsets are all this function needs -- it uses
                               * a file-local view in work/sub_0802A304, which
                               * is byte-identical. Anyone who reshapes this
                               * must re-verify every `.unk08` reader. */
    /* 0x08 */ u8 unk08;
    /* 0x09 */ u8 unk09; /* Wave 32, W32-A. sub_08060110 zeroes unk09 and unk0a
                          * and then seeds unk0b from gUnknown_030046C0.unk06,
                          * all three with bare `strb` off ONE CSEd element
                          * address -- sibling members at constant offsets, the
                          * same shape c_08026588.c documents. Widths from the
                          * stores; nothing reads them yet.
                          *   Wave 39, W39-D: NOT a bitfield, and this is
                          * measured rather than assumed. sub_08025BE0's park
                          * turns on the ROM building a second zero register
                          * for this member alone, and work/sub_08025BE0/
                          * proposed a byte-wide bitfield as the explanation.
                          * Controlled compile_probe, one body and two struct
                          * declarations differing only in `u8 unk09;` versus
                          * `u8 unk09:8;`: both emit the same `strb r5,[r3,#9]`
                          * reusing the CSEd zero. A byte-wide, byte-aligned
                          * bitfield degenerates to the plain store in agbcc,
                          * so it explains nothing and this member must be left
                          * as a plain u8. */
    /* 0x0a */ u8 unk0a;
    /* 0x0b */ u8 unk0b;
};

/* One army's slice of gUnits[]. src/battle.c derives the 1-based army index
 * from a unit pointer by differencing against this type, which is the source
 * spelling of the ROM's `>> 6` on the element index. */
struct ArmyUnitBlock
{
    struct Unit units[64];
};

/* Grouped 64 entries to a group and 1-based within the group: sub_08025308
 * counts the live `unk00` of `g[(a - 1) * 64 + i]` for i = 1..50, so a group is
 * 64 * 0x0c = 768 bytes (the `(a*2 + a) << 8` in the prologue) and 50 of the 64
 * slots are in use. */
extern struct Unit *gUnknown_08499594;

/* The domain name for the table above. Keep the address-based symbol
 * available for assembly and historical notes while new C uses this one. */
#define gUnits gUnknown_08499594

/* The per-unit-type stats table. Field names cost, movement, maxAmmo,
 * vision, minRange, maxRange, maxFuel, transportTable, unitClass,
 * movementType, deployLocation, baseDamage, repairTable and fuelCost come
 * from the 'Advance Wars 2 Unit Editor' Nightmare module -- a community
 * ROM-editor definition, not this tree's or SRR_AW2's own work; that repo
 * merely carries a copy. It describes 24 records of 0x5c bytes
 * at 0x085D5B18. THIS array starts one record EARLIER, at 0x085D5ABC -- the
 * terrain table above it ends exactly there -- so our index is the module's
 * plus one and element 0 is a dummy. c_0805B980.c reaching [23] for a
 * transport blob is the check: the module's [22] is the Lander.
 *
 * EVERY field boundary this tree derived on its own lands on a module field,
 * and several of the wave comments below independently say what the module
 * says (movementType, fuelCost, transportTable, maxFuel, maxAmmo). Where the
 * two DISAGREE the module was not followed: it calls 0x00/0x02/0x04 name and
 * weapon-name indices, but all three are passed to sub_08014A5C as sprite
 * ids here, and it calls 0x1b the 'AI byte' while the readers below show a
 * 1..6 class tag, which does not fit Unit Class.txt's 0..4 range either.
 * baseDamage[k][i] is indexed by THIS array's unit id, so [k][0] is the
 * dummy and the module's two 25-byte damage rows are [k][1..25]. */
struct UnitType /* 0x5c */
{
    /* 0x00 */ u16 unk00; /* Wave 56, W56-G: NAMED out of filler_00[0x02], not
                           * reshaped -- same offset, same two bytes, and
                           * nothing in src/ names filler_00 on this struct.
                           * sub_08047920 hands it to sub_08014A5C as the
                           * graphic id (`ldrh` at +0 off the `unk00 * 0x5c`
                           * stride), i.e. it is a THIRD member of the unk02 /
                           * unk04 graphic-id group one and two fields down.
                           * Width from the `ldrh`; signedness unproved. */
    /* 0x02 */ u16 unk02; /* Wave 35, W35-E: a pair with unk04, and three
                           * readers agree they are `ldrh` at +2 / +4 off the
                           * `unk00 * 0x5c` stride. sub_0803A2BC hands each to
                           * a separate sub_08014A5C (sprite ids 7 and 0xd),
                           * and sub_0803A5B8 subscripts gTextTable[]
                           * with them, so they are a two-entry graphic id
                           * pair. */
    /* 0x04 */ u16 unk04;
    /* 0x06 */ u16 cost;
    /* 0x08 */ u16 unk08; /* Wave 38 (W38-J). Was filler; NAMED, not reshaped --
                           * same offset, same two bytes. sub_08029978 reads it
                           * `ldrh rN,[rM,#8]` off the usual `unk00 * 0x5c`
                           * stride and multiplies it by a per-step count whose
                           * product is then truncated to u16, so it is the
                           * per-step magnitude that goes with the unk0b cap two
                           * fields down. Width from the `ldrh`; signedness
                           * unproved, nothing sign-extends it. */
    /* 0x0a */ u8 movement;
    /* 0x0b */ u8 maxAmmo; /* wave 15 (C): a CAP, compared `bls` against a sum of
                          * two 4-bit fields of struct Unit's unk04
                          * container (sub_08022618, sub_08042998), and the
                          * clamp value when the sum exceeds it. Same role as
                          * unk10 one field over, which caps the 5-bit unk06
                          * pair the same way. Plain `ldrb`. */
    /* 0x0c */ u8 vision;
    /* 0x0d */ u8 filler_0d[0x01];
    /* 0x0e */ u8 minRange; /* a 3-valued mode tag: sub_080432E0 maps 0 -> 7,
                          * 1 -> 5 and everything else -> 6, which its callers
                          * use as a column index into gUnknown_085D3E2C. */
    /* 0x0f */ u8 maxRange;
    /* 0x10 */ u8 maxFuel; /* sub_08061E54 compares `unk10 - 5` against a 7-bit
                          * field of its pointer parameter; plain `ldrb`. */
    /* 0x11 */ u8 unk11; /* Wave 30, W30-A: sub_0805CA24 ORs it with unk0e and
                          * tests the pair against zero, so it is a flag byte
                          * beside that one rather than filler. Plain `ldrb`;
                          * signedness unproved. */
    /* 0x12 */ u8 filler_12[0x02];
    /* 0x14 */ u8 *transportTable; /* Wave 34 (W34-D): a POINTER to a byte blob, and
                           * three readers agree independently. sub_0802706C
                           * only tests it `!= 0` (`ldr` at +0x14, whole
                           * word), but sub_08025EF0 and sub_08025F74 both
                           * deref it -- `ldrb [p]` for a 1/2 mode tag and
                           * `ldrb [p + 1 + n]` for a per-n permission byte,
                           * so the target really is `u8 []` and the word is
                           * an address rather than an int. Carved out of
                           * filler_12, which used to span 0x12..0x17. */
    /* 0x18 */ u8 unitClass; /* plain `ldrb`, used by family F049 as an index into
                          * struct Unk085D3DD0Entry.unk24[] and separately
                          * tested against 0. Signedness unproved: both uses
                          * are u8-context (a subscript and a `cmp #0`), so a
                          * signed object would be byte-identical here. */
    /* 0x19 */ u8 movementType; /* Wave 34, W34-F. The unit's MOVEMENT TYPE: sub_08041EA8
                          * uses it as `unk19 * 32`, a row index into the s8
                          * terrain-cost table at
                          * gUnknown_085D3DD0[1].unk38[0].unk18, whose column is
                          * the 5-bit terrain code. Plain `ldrb`, so unsigned by
                          * the load; nothing sign-extends it. */
    /* 0x1a */ u8 deployLocation; /* Wave 29, W29-A. sub_080249EC compares it `ldrb`
                          * against 0x10 and returns 0 when it matches, so it is
                          * a small tag rather than a flag. Width from the load;
                          * the compare is `beq`, which says nothing about
                          * signedness. */
    /* 0x1b */ u8 unk1b; /* a small class tag, 1..6: the 0x0805Cxxx list
                          * builders each keep the units whose type's unk1b
                          * equals one fixed constant (`ldrb [.,#0x1b];
                          * cmp #N`). Wave 19 closed the last three builders
                          * and widens the observed range from 1..5 to 1..6 --
                          * the twelve that use this test span
                          * {1,1,2,2,2,3,4,4,5,6}, so 6 is real and the range
                          * is still a floor, not an extent. */
    /* 0x1c */ u8 unk1c; /* Wave 50, W50-A.  NAMED, not reshaped -- same offset,
                          * same single byte.  The SIBLING of unk1d below and the
                          * same kind of thing: sub_08062560 reads it `ldrb
                          * [.,#0x1c]` off the `unk00 * 0x5c` stride at two sites,
                          * masks the caller's u8 argument with it as a gate
                          * (`ands; cmp #0`), and then ORs it into the
                          * gUnknown_08499590 +0x3262 plane over every passable
                          * cell -- exactly unk1d's documented role, one byte
                          * earlier.  Width from the `ldrb`; it is a mask, so
                          * unsigned. */
    /* 0x1d */ u8 unk1d; /* Wave 36, W36-D. A BIT MASK over the +0x3262 plane of
                          * struct Map: sub_08058BB4 and sub_08058C54 both read
                          * it once (`ldrb [.,#0x1d]` off the `unk00 * 0x5c`
                          * stride) and pass it straight to sub_08058CE8, whose
                          * only use is `plane_byte & mask` tested against zero.
                          * Plain `ldrb`, so unsigned by the load; carved out of
                          * filler_1c, which used to span 0x1c..0x1d. */
    /* 0x1e */ u8 baseDamage[2][0x1a];
    /* 0x52 */ u8 filler_52[0x02];
    /* 0x54 */ s8 *repairTable; /* Wave 49, W49-J. Carved out of filler_52[0x06] --
                           * same start offset, and nothing in src/decomp names
                           * filler_52, so byte-neutral for every other reader.
                           * gen_lds.py calls this word gUnknown_085D5B10, which
                           * is exactly &gUnknown_085D5ABC[0] + 0x54; the
                           * x0x5c stride of the users (sub_08046914 and
                           * sub_08046A84, both `muls #0x5c` on a unit-type id
                           * out of gUnknown_084C20C0[]) is what ties it to this
                           * record rather than to a table of its own. A pointer
                           * to SIGNED bytes indexed by a small id and tested
                           * `!= 0`: the load is `ldrb` + `lsls #0x18; asrs
                           * #0x18`, which is the same spelling agbcc gives the
                           * proven-`s8 *` Unk085D3DD0Entry.unk18 in
                           * sub_08046778, so the shifts are NOT evidence of an
                           * unsigned pointee. The pointee's meaning is
                           * unproved. */
    /* 0x58 */ const u8 *fuelCost; /* Wave 34 (W34-D): a POINTER to a per-terrain
                                 * cost table. sub_080253B0 loads the whole word
                                 * (`adds rB, #0x58; ldr`) and immediately indexes
                                 * it by the LOW FIVE BITS of the gUnknown_08499590
                                 * +0x1432 terrain byte, so the table is at least
                                 * 0x20 bytes and lives in the same 0..0x1f terrain
                                 * space gUnknown_08551CA0 scores. The byte it
                                 * yields is a movement cost: sub_080253B0
                                 * subtracts it from the unit's 7-bit unk06_0
                                 * fuel/move field. Carved out of filler_52, which
                                 * used to span 0x52..0x5b. */
};

/* NOT const, and this was wrong here until wave 15. Family F049
 * (sub_080430B0/08043120/08043190/08043200) reads `gUnknown_085D5ABC[c].unk18`
 * twice with a `bl sub_080432E0` between the two reads, and the ROM RE-LOADS
 * it: it keeps the element ADDRESS in r6 across the call and does a second
 * `ldrb r0,[r6,#0x18]`. Controlled probe, one body, two declarations of the
 * same 0x5c layout: with `const` the load is CSEd across the call (the value
 * itself lives in r6, `cmp r6,#0`, two bytes short); without it, the reload
 * comes back and the function is instruction-for-instruction the ROM. Same
 * mechanism as the const tell on gUnknown_0849957C in docs/agbcc-codegen.md,
 * seen across a CALL rather than across a loop iteration -- a const global's
 * MEM is RTX_UNCHANGING and survives a call, a plain one is killed by it.
 * Byte-neutral for the four already-promoted users (c_080432E0.c,
 * c_080433B8.c, c_080433F8.c, c_08061E54.c), which read it once each;
 * re-verified with trymatch after the change. */
extern struct UnitType gUnknown_085D5ABC[];

#endif /* GUARD_UNIT_H */
