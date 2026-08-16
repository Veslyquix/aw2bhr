	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806D0D8
sub_0806D0D8: @ 0x0806D0D8
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x4c]
	bl _call_via_r1
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	subs r0, #0x18
	movs r1, #8
	bl Div
	movs r3, #0xc8
	subs r3, r3, r0
	ldrh r0, [r4, #0x28]
	ldr r5, _0806D148 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r0
	movs r0, #0x2a
	ldrsh r2, [r4, r0]
	subs r2, #8
	movs r6, #0xff
	ands r2, r6
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801F34C
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806D14C
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	subs r0, #0x18
	movs r1, #8
	bl Div
	movs r3, #0xd8
	subs r3, r3, r0
	ldrh r0, [r4, #0x28]
	adds r1, r5, #0
	ands r1, r0
	ldrh r0, [r4, #0x2a]
	adds r2, r6, #0
	ands r2, r0
	movs r0, #3
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801F34C
	b _0806D17E
	.align 2, 0
_0806D148: .4byte 0x000001FF
_0806D14C:
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	subs r0, #0x18
	movs r1, #8
	bl Div
	movs r3, #0xd8
	subs r3, r3, r0
	movs r0, #0x28
	ldrsh r1, [r4, r0]
	subs r1, #0x10
	ands r1, r5
	movs r0, #0x2a
	ldrsh r2, [r4, r0]
	subs r2, #0x10
	ands r2, r6
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	movs r0, #3
	str r0, [sp]
	adds r0, r3, #0
	movs r3, #0
	bl sub_0801F34C
_0806D17E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

