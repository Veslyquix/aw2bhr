	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080704A4
sub_080704A4: @ 0x080704A4
	push {lr}
	lsls r0, r0, #0x10
	ldr r2, _080704D0 @ =gUnknown_08242308
	ldr r1, _080704D4 @ =gUnknown_0824238C
	lsrs r0, r0, #0xd
	adds r0, r0, r1
	ldrh r3, [r0, #4]
	lsls r1, r3, #1
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r2
	beq _080704D8
	adds r0, r1, #0
	adds r1, r2, #0
	bl sub_08070BAC
	b _080704EC
	.align 2, 0
_080704D0: .4byte gUnknown_08242308
_080704D4: .4byte gUnknown_0824238C
_080704D8:
	ldr r2, [r1, #4]
	ldrh r0, [r1, #4]
	cmp r0, #0
	beq _080704E4
	cmp r2, #0
	bge _080704EC
_080704E4:
	adds r0, r1, #0
	adds r1, r3, #0
	bl sub_08070BAC
_080704EC:
	pop {r0}
	bx r0

