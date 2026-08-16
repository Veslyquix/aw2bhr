	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801BABC
sub_0801BABC: @ 0x0801BABC
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl sub_0801BB10
	ldr r1, _0801BAEC @ =gUnknown_03002FE0
	ldr r2, _0801BAF0 @ =sub_0801BAB8
	adds r0, r1, #0
	adds r0, #0x38
_0801BACE:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _0801BACE
	ldr r0, _0801BAF4 @ =IrqMain
	ldr r4, _0801BAF8 @ =gUnknown_03000068
	adds r1, r4, #0
	movs r2, #0x40
	bl CpuFastSet
	ldr r0, _0801BAFC @ =gUnknown_0200BFFC
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801BAEC: .4byte gUnknown_03002FE0
_0801BAF0: .4byte sub_0801BAB8
_0801BAF4: .4byte IrqMain
_0801BAF8: .4byte gUnknown_03000068
_0801BAFC: .4byte gUnknown_0200BFFC

