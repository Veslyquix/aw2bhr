# sub_08071918

0x08071918, 48 bytes, THUMB, parked.

Best score so far: not measured.

## What it does

A debug or cheat keypad hook: if L is held and B was pressed this frame, it calls sub_0803DDF4 (still assembly; its purpose is unknown). It takes four parameters it never reads, because its callers pass four.

## How close it is

The C body already compiles byte for byte; the only difference is four no-op instructions (8 bytes) at the start that no C can produce, so the tool reports 40 bytes against 48 and a meaningless 2% score.

## What is left

It cannot match from C as the function boundary stands: the label starts 8 bytes early, inside the alignment padding of the ARM/THUMB veneer table just before it. The fix is in the tooling (start the function at 0x08071920 and carve the 8 padding bytes out as data), weighed against moving a boundary the upstream project owns.

## Already tried

- Any C spelling of the body: no C emits leading no-op instructions, so the 8-byte gap stays whatever the body looks like.
- Declaring it with no parameters, as the body suggests: disagrees with the header's four-parameter declaration, which two matched callers depend on; unused parameters cost nothing, so they stay.
- Treating it as a sibling of sub_08071900 (an early guess made from its call sites alone): wrong, the body is a key check.

## Files

- `sub_08071918.c`: the current draft
- `target.s`: the original assembly

## Technical history

<details>
<summary>The full record from `data/parked.json`: every attempt, with compiler detail.</summary>

### Notes

NOT a decompilation failure and NOT a source problem -- the C in work/sub_08071918/sub_08071918.c is byte-exact for the whole compiler-generated body. The 48-byte 'function' is 8 bytes of `movs r0, r0` padding followed by a 40-byte C function: `if ((gpKeySt->unk00 & 0x200) && (gpKeySt->held & 2)) sub_0803DDF4();`. trymatch's diff is exactly those four leading nops and nothing else -- every later instruction, both branch targets and both relocations (R_ARM_THM_CALL sub_0803DDF4, R_ARM_ABS32 gpKeySt) agree once the 8-byte shift is applied. CAUSE: 0x08071918 is the trailing alignment of the ARM/THUMB interworking veneer table that runs up to sub_08071914 (a run of `bx pc; nop` thumb stubs paired with `b <arm addr>` arm stubs). upstream's thumb_func_start label sits 8 bytes early, so the padding was absorbed into the following function. The real function begins at 0x08071920. Ruled out: the source axis entirely -- no C emits leading nops, and the body already matches. Do not spend another wave's attempts on the C. FIX IS TOOLING, NOT SOURCE: the unit boundary would have to move to 0x08071920 with the 8 padding bytes carved out as data, the same way split_rodata.py carves pool words. Worth 40 bytes, so weigh it against the risk of moving a boundary upstream owns. SCOPE (scanned every asm/*.s): only THREE functions ROM-wide begin with movs r0,r0 padding -- this one (8B), sub_0802C62A (2B, already in asm-resident.json as the known .align counter-example) and sub_0806F73C (2B pad in a 4B stub). The class is closed.

</details>
