	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802D504
sub_0802D504: @ 0x0802D504
	push {r4, lr}
	sub sp, #4
	movs r4, #1
	ldr r0, _0802D548 @ =gUnknown_030033E4
	ldrh r1, [r0]
	ldr r0, _0802D54C @ =gUnknown_08499590
	ldr r0, [r0]
	movs r2, #4
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0802D51C
	adds r0, #0xf
_0802D51C:
	asrs r0, r0, #4
	subs r0, r1, r0
	cmp r0, #6
	bgt _0802D526
	movs r4, #0x14
_0802D526:
	bl sub_08024268
	ldr r0, _0802D550 @ =gUnknown_0849ABC0
	ldr r1, _0802D554 @ =gUnknown_030040F0
	ldrh r1, [r1]
	str r1, [sp]
	adds r1, r4, #0
	movs r2, #1
	movs r3, #1
	bl sub_08019F2C
	bl sub_08034F7C
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D548: .4byte gUnknown_030033E4
_0802D54C: .4byte gUnknown_08499590
_0802D550: .4byte gUnknown_0849ABC0
_0802D554: .4byte gUnknown_030040F0

