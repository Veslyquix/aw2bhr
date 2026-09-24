# AW2E.lua entries that the repo had already named

`src/AW2E.lua` proposes a name for each address it lists. Where the repo had
already given that same address a meaningful (non-`sub_`/`gUnknown_`) name, the
existing name is kept and the Lua name is **not** applied -- renaming would
churn call sites, comments and `.thumb_set` aliases for no gain, and in several
cases the existing name records evidence the Lua name does not.

Everything else in `src/AW2E.lua` is wired in: promoted C functions carry the
Lua name with a `.thumb_set sub_XXXXXXXX, <LuaName>` alias in their own file,
and proc scripts plus still-assembly functions get a `.global`/`.set` debugger
alias in [src/aw2e-names.s](src/aw2e-names.s).

## Open conflicts (Lua name skipped)

| Address | Name in AW2E.lua | Name in the repo | Defined in |
| --- | --- | --- | --- |
| `0x0801153D` | `FadeLoadMap_IDLE_0801153D` | `SomeFade_IDLE_0801153D` | [src/decomp/c_0801153C.c](src/decomp/c_0801153C.c) |
| `0x08034F7D` | `BlockMapStartCoInfo_08034F7D` | `IncrementCoPowerDepth` | [src/decomp/c_08034F6C.c](src/decomp/c_08034F6C.c) |
| `0x08034F8D` | `BlockMapStartCoInfo_08034F8D` | `DecrementCoPowerDepthIfNonzero` | [src/decomp/c_08034F8C.c](src/decomp/c_08034F8C.c) |
| `0x080366A5` | `BlockMapStartCoInfo_080366A5` | `InitMainFrameCallbacks` | [src/decomp/c_080366A4.c](src/decomp/c_080366A4.c) |

### Notes

* **`0x0801153D` -- `FadeLoadMap_IDLE_0801153D` vs `SomeFade_IDLE_0801153D`.**
  These disagree about which proc *owns* the routine, not just what to call it.
  `ProcScr_SomeFade` (`0x0848929C`) and `ProcScr_FadeLoadMap` (`0x084892C4`)
  both list `0x0801153C` as their last `PROC_REPEAT`, so the routine really is
  shared and neither owner-prefixed name is right. Left under `SomeFade_` until
  a name that does not imply a single owner is picked.
* **`0x08034F7D` / `0x08034F8D` / `0x080366A5`.** The repo names describe what
  the functions do (`IncrementCoPowerDepth`, `DecrementCoPowerDepthIfNonzero`,
  `InitMainFrameCallbacks`) and are shared by more than one caller, so the
  `BlockMapStartCoInfo_`-prefixed Lua names would be narrower than the truth.
  Their sibling `0x08034FD9` had no name yet and *was* wired in as
  `BlockMapStartCoInfo_08034FD9`.

## Resolved in favour of the Lua name

These were conflicts; the Lua name won and the repo was renamed to match.

| Address | Was | Now |
| --- | --- | --- |
| `0x084892C4` | `DesignRoomLoad3` / `ProcScr_DesignRoomLoad3` | `FadeLoadMap` / `ProcScr_FadeLoadMap` |
| `0x0801137D` | `DesignRoomLoad3_0801137D` | `FadeLoadMap_0801137D` |
| `0x080114A1` | `DesignRoomLoad3_IDLE_080114A1` | `FadeLoadMap_IDLE_080114A1` |
| `0x08616EFC` | `CoDesignC4` / `ProcScr_CoDesignC4` | `PutFace` / `ProcScr_PutFace` |
| `0x0808A3A1` | `CoDesignC4_IDLE_0808A3A1` | `PutFace_IDLE_0808A3A1` |

`ProcScr_FadeScreenRelated` in [src/decomp/c_080110EC.c](src/decomp/c_080110EC.c)
is a second alias for the same array and was left alone.
