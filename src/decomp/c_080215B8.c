#include "global.h"

/* Promoted from assembly; each function below is byte-for-byte
 * identical to the original. Order is address order and must
 * stay that way -- the linker places this file's .text as one
 * contiguous block at 0x080215B8.
 * sub_080215B8 @ 0x080215B8
 */

/* Family F072: four sequential `bl`s and nothing else. Sequential calls carry
 * no nesting signal (docs/agbcc-codegen.md) -- `g(f())` is byte-identical to
 * `f(); g();` because r0 already holds the result -- but here the question does
 * not even arise: all four callees write their first argument register before
 * reading it, and all four end `pop {r0}; bx r0`. So this is four statements
 * of `void f(void)`, not a chain. */

void sub_080215B8(void)
{
    sub_080219AC();
    sub_08026D68();
    sub_08061F34();
    sub_08062038();
}
