	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806AB24
sub_0806AB24: @ 0x0806AB24
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	bl sub_08024944
	adds r5, r4, #0
	adds r5, #0x2f
	adds r1, r4, #0
	adds r1, #0x52
	ldrh r3, [r1]
	str r4, [sp]
	add r1, sp, #4
	adds r2, r5, #0
	bl sub_0807B7BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r4, #0x48]
	ldr r2, _0806AB98 @ =gUnknown_085816B4
	lsls r1, r0, #1
	adds r1, r1, r2
	ldrh r3, [r1]
	add r2, sp, #4
	subs r0, #1
	adds r1, r3, #0
	muls r1, r0, r1
	ldrh r2, [r2]
	adds r1, r1, r2
	movs r0, #0xf0
	subs r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r5]
	movs r1, #1
	ldr r0, [r4, #0x48]
	cmp r1, r0
	bge _0806AB84
	adds r2, r5, #0
_0806AB70:
	ldrb r0, [r2]
	adds r0, r0, r3
	ldrb r5, [r2, #1]
	adds r0, r0, r5
	strb r0, [r2, #1]
	adds r2, #1
	adds r1, #1
	ldr r0, [r4, #0x48]
	cmp r1, r0
	blt _0806AB70
_0806AB84:
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r1]
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806AB98: .4byte gUnknown_085816B4

