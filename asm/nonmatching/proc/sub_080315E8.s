	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080315E8
sub_080315E8: @ 0x080315E8
	push {r4, r5, lr}
	sub sp, #8
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r0, r1
	beq _08031626
	ldr r4, _08031630 @ =gUnknown_08499578
	ldr r0, [r4]
	movs r1, #2
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r2, #0x12
	movs r3, #0x20
	bl sub_08012BC8
	ldr r2, [r4]
	ldr r1, _08031634 @ =gUnknown_0849B0E2
	lsls r0, r5, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0x40
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0x12
	bl sub_08014668
_08031626:
	adds r0, r5, #0
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08031630: .4byte gUnknown_08499578
_08031634: .4byte gUnknown_0849B0E2

