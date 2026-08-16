	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D458
sub_0802D458: @ 0x0802D458
	push {r4, lr}
	movs r4, #1
	ldr r0, _0802D494 @ =gUnknown_030033E4
	ldrh r1, [r0]
	ldr r0, _0802D498 @ =gUnknown_08499590
	ldr r0, [r0]
	movs r2, #4
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0802D46E
	adds r0, #0xf
_0802D46E:
	asrs r0, r0, #4
	subs r0, r1, r0
	cmp r0, #6
	bgt _0802D478
	movs r4, #0x14
_0802D478:
	bl sub_08024268
	ldr r0, _0802D49C @ =gUnknown_0849AAC0
	adds r1, r4, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801A104
	bl sub_08034F7C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D494: .4byte gUnknown_030033E4
_0802D498: .4byte gUnknown_08499590
_0802D49C: .4byte gUnknown_0849AAC0

