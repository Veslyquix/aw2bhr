# Rename plan

This document tracks proposed struct and function renames. It is a planning
artifact only: entries here do not authorize or imply source changes.

## Goals and constraints

- Make names clearer while preserving the repository's byte-matching goal.
- Treat `asm/` as the immutable reference; do not rename or edit its contents.
- Record evidence and all known references before approving a rename.
- A rename is complete only after the affected build output is verified against
  the canonical ROM, when implementation is eventually authorized.

## Naming conventions to confirm

Current conventions visible in the tree (to use as a starting point for review):

- Struct/type names use `struct` tags in PascalCase (`Unit`, `UnitType`,
  `BattleUnit`); names should describe the represented object, not just its
  address. Unknown records retain address-derived tags such as
  `Unk085D3DD0Entry` until their role is well enough established.
- Readable functions use PascalCase verbs (`GetUnitCombatClassColumn`,
  `CreateUnitAt`). Address names (`sub_XXXXXXXX`) remain the stable fallback.
  Existing address symbols can be kept as linker aliases with `.thumb_set`;
  see `src/named.md` and `include/xenesis-names.h` for the repo's precedent.
- Existing proc/resource prefixes (`ProcScr_`, `g`) and game vocabulary should
  be preserved where they carry established meaning. Prefer the repo's
  evidence-backed name over an external name when the latter is narrower or
  conflicts with observed behavior (`src/named.md` records examples).
- No semantic name should imply more certainty than the evidence supports.
  In particular, a field or type label supplied by a ROM-editor definition is
  a lead, not independent proof; `include/unit.h` documents where that source
  agrees or conflicts with in-tree observations.

## Proposed renames

Add one row per symbol. Keep proposals in `Proposed` until reviewed together.

| Kind | Current name | Proposed name | Evidence / meaning | References and dependencies | Confidence | Status |
|---|---|---|---|---|---|---|
| Struct | `struct UnitType` | — | The 0x5c per-unit-type record has many evidence-backed fields; the record's overall domain is clear, but no better whole-record name has been established yet. | `include/unit.h`, all declarations and uses of `gUnknown_085D5ABC`; changing the tag would touch shared headers and promoted functions. | High that current name is serviceable; no replacement proposed | Hold |
| Struct | `struct Unk085D3DD0` | — | CO-indexed record (0x104 bytes) with three power-state subrecords and observed CO bonuses. Xenesis's Subroutine List calls address `0x085D3DD0` a routine checking allegiance/HQ type; this conflicts with its observed use as a data table and is not support for a routine-style rename. Candidate semantic name needs review against complete table usage. | `include/co.h`, `include/unit.h`, `gUnknown_085D3DD0` users and prototypes; Xenesis `AW2 Subroutine List.txt` line 365 and `AW2 Datasheet.txt` line 5952 | Medium | Research |
| Struct | `struct Unk085D3DD0Entry` | — | 0x44-byte per-power subrecord. It contains observed luck, capture, combat bonus, movement, and other data; avoid naming it only for the bonus rows. | `include/co.h`; `struct Unk085D3DD0::power[]` users | Medium | Research |
| Function | `GetUnitCombatClassColumn` | `GetCoBonusUnitClassColumn` (candidate) | At `0x080432E0`, maps `UnitType.minRange` values 0, 1, and >1 to indices 7, 5, and 6. Four CO bonus readers use the result as an index into the `unk24` rows of `struct Unk085D3DD0Entry`. Xenesis's datasheet independently identifies `0x080432E0` as a common subroutine in that CO stat-loading path, and describes the 5/6 results as direct/indirect classes; it does not document the 0-to-7 case. The proposed name makes the table-specific use explicit without treating `minRange` itself as a class field. | `src/unit.c`; `.thumb_set sub_080432E0`; bonus readers in `src/unit.c`; `include/co.h`; Xenesis `AW2 Datasheet.txt` lines 2728-2748 and 3518-3527 | Medium-high | Proposed |

### Struct notes

For each type, record field offsets, size, known users, and evidence for the
proposed meaning. Mark uncertain field labels explicitly; a better type name
does not establish every field's semantics.

### Function notes

For each function, record address or stable identifier, behavior, callers,
related data/types, and evidence supporting the verb and object in the name.
Distinguish observed behavior from inferred purpose.

## Dependency and ordering notes

Record coupled changes here, such as a type rename that affects prototypes,
callers, or multiple functions. Group proposals that should be reviewed or
implemented together, and call out any shared-header effects.

Initial review thread: the highlighted bonus lookup in `src/unit.c` indexes
`unk24` once with `UnitType.unitClass` and once with
`GetUnitCombatClassColumn(unitType)`. This suggests a useful naming question
for the table and its columns, but it does not by itself establish that the
stored `unitClass` value and the helper's derived column are the same concept.
Keep that distinction explicit while investigating candidate names.

External reference checked: `C:\Users\david\OneDrive\Desktop\SRR_AW2\XenesisDocs`
(`AW2 Datasheet.txt`, `AW2 Subroutine List.txt`). These are useful corroborating
reverse-engineering notes, not primary evidence. In particular, the Subroutine
List's entry at `0x085D3DD0` conflicts with the repository's direct evidence
that this address holds the CO bonus table; do not carry that entry into a
semantic symbol name without resolving the conflict.

## Review checklist

- [ ] Check the existing symbol and its references in the repository.
- [ ] Check relevant assembly, call sites, and promoted exemplars for evidence.
- [ ] Check for naming collisions and similar symbols.
- [ ] Confirm the proposal improves clarity without overstating uncertain
      semantics.
- [ ] Agree on the proposed name and implementation batch.
- [ ] Keep any future source changes separate from this planning pass until
      explicitly requested.

## Decisions and open questions

| Date | Decision or question | Outcome |
|---|---|---|
| 2026-09-25 | Does Xenesis's `0x080432E0` note clarify `GetUnitCombatClassColumn`? | It corroborates that the helper belongs to the CO stat-loading path and describes columns 5/6 as direct/indirect. Proposed `GetCoBonusUnitClassColumn` for review; retain the observed third mapping (0 -> 7) as an unresolved/special case. |
| 2026-09-25 | Is the Xenesis label for `0x085D3DD0` suitable for renaming the struct/table? | No: it calls the address a routine checking allegiance/HQ type, while repository users treat it as a CO-indexed bonus table. Retain the conflict as a source-quality caution. |
