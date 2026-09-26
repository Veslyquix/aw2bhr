# Writing notes in this repo

Notes in this repo are for a programmer who knows C and has never seen this
project. Write for that person. If a sentence only makes sense to someone who
followed the project's history, it does not belong in the source.

## Where each kind of note goes

| What you want to record | Where it goes |
|---|---|
| What a function does | A comment above the function |
| Why the C is written in an unusual way | A short "Why the C looks odd" part of that comment |
| What a global, struct or field holds | A comment on its declaration in `include/` |
| How a match was found, what failed, scores, register diffs | The commit message. Not the source. |
| The state of a function that does not match yet | `data/parked.json` (the `summary` object, below) |
| A compiler behaviour that applies to many functions | `docs/agbcc-codegen.md` |

## A function comment

Say what the function does in game or hardware terms. Then, only if needed,
say why the code is spelled the way it is.

```c
/*
 * sub_0802E010 -- lay out a picture's tiles in the BG1 tilemap.
 *
 * The picture is already in tile memory as a run of consecutive tiles; this
 * builds the tilemap that shows it. gUnknown_03003F68 points at the picture's
 * size: byte 0 is the width and byte 1 the height.
 *
 *   1. Clear the whole 32 x 32 BG1 tilemap buffer.
 *   2. Fill the left part with consecutive tile numbers, palette 5.
 *   3. If the picture is wider than 31, fill the rest from the next tile block.
 *   4. Flag BG1 for copying to VRAM.
 *
 * Why the C looks odd: these spellings do not change what the code does, but
 * the original compiler only produces identical output with them.
 *   - `half` is assigned three times, the last one inside a loop condition.
 *     With fewer assignments the compiler picks different registers.
 */
```

- **First line:** the function name and a short verb phrase.
- **Body:** inputs, what it reads and writes, the steps, what it returns. Name
  callees by what they do ("flag BG1 for copying"), not only by address.
- **Unknowns:** say so plainly ("byte 3 is never read here; its purpose is
  unknown"). Do not guess a purpose and present it as fact.
- **"Why the C looks odd":** one bullet per unusual spelling. Say what to leave
  alone and, in one plain clause, what goes wrong if you change it. Leave this
  part out when the C looks normal.
- **Length:** most functions need 3 to 15 lines. Over 25 lines is a sign that
  history is creeping back in.

## Do not put these in source or header comments

- Wave numbers, agent names (`W77-F`), dates, "matched in wave N".
- Match percentages, byte counts of old attempts, "first difference at +0x20".
- Tables of registers or instruction offsets from a diff.
- Lists of spellings that were tried and failed, and "do not re-probe".
- Compiler-internal terms used without explanation (see the glossary). When one
  is needed to explain an odd spelling, use the plain phrase from the glossary.

All of this is still useful, and it is kept: the commit message records it, and
`git log -S sub_XXXXXXXX` finds every commit that touched a function.

## Declarations in `include/`

One to five lines on what the object holds and its units, for example:

```c
/* Size of the picture sub_0802E010 draws: byte 0 = width, byte 1 = height. */
extern void *gUnknown_03003F68;
```

Evidence for a type ("proved `s16` by the `ldrsh` in sub_0801F6F0") goes in
the commit that set the type, not on the declaration. Keep a note that stops a
wrong edit, in one sentence: "Must stay a pointer, not an array: the code loads
its value before indexing."

## Parked functions: the `summary` object

Every entry in `data/parked.json` has a `summary` object written for someone
who might pick the function up. `tools/export_wip.py` puts it at the top of
the function's `wip/` README. Everything else in the entry is the technical
history, shown collapsed underneath. An example of the shape (the content is
illustrative):

```json
"summary": {
  "does": "Draws the unit's movement range: clears the overlay, then marks every tile the unit can reach.",
  "status": "Compiles to the right size. 4 bytes differ: two values sit in different registers from the original.",
  "left": "Find a way of writing the loop that makes the compiler pick the original registers.",
  "tried": [
    "Swapping the order of the two loop variables: no change.",
    "Running the automatic permuter for 30 minutes: no improvement."
  ]
}
```

Update `status`, `left` and `tried` whenever you work on the function. When it
matches, delete the whole entry.

## Glossary

These terms turn up in the tools and in `docs/agbcc-codegen.md`. In comments,
prefer the plain phrase on the right.

| Term | Plain meaning |
|---|---|
| matching, a match | Our C compiles to exactly the same bytes as the original game |
| agbcc | The old GCC 2.95-based compiler the game was built with. We must use it to get the same bytes |
| ROM | The game cartridge image. The build must reproduce it exactly |
| THUMB | The compact 16-bit instruction set most of the game uses |
| parked | Worked on, does not match yet, and set aside with notes |
| asm-resident | Written by hand in assembly originally. It can never come from C |
| draft | The C being written for a function, in `work/<fn>/<fn>.c` |
| promote | Move a matched function from `work/` into `src/decomp/` so the build uses it |
| literal pool, pool word | Constants and addresses stored right after a function's code, loaded with `ldr rN, =value` |
| force-addr | A compiler option in this build that loads a global's address from a pool word instead of computing it |
| register allocation | The compiler's choice of which CPU register holds which value. Most remaining mismatches are only this |
| CSE (common subexpression elimination) | The compiler computing a repeated expression once and reusing it |
| loop hoisting | The compiler moving work that does not change out of a loop |
| permuter | A tool that tries random rewrites of a draft to find one that compiles closer to the original |
| trymatch | `tools/trymatch.py`: compiles a draft and compares it with the original bytes |
