	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080645AC
sub_080645AC: @ 0x080645AC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x4c]
	bl _call_via_r1
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	subs r0, #7
	movs r1, #0x20
	bl Div
	adds r0, #0xc1
	ldrh r2, [r4, #0x28]
	ldr r5, _08064610 @ =0x000001FF
	adds r1, r5, #0
	ands r1, r2
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	subs r2, #8
	movs r6, #0xff
	ands r2, r6
	movs r3, #0
	str r3, [sp]
	bl sub_0801F34C
	adds r0, r4, #0
	adds r0, #0x46
	ldrb r0, [r0]
	cmp r0, #0
	bne _08064614
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	subs r0, #7
	movs r1, #0x20
	bl Div
	adds r0, #0xd1
	ldrh r2, [r4, #0x28]
	adds r1, r5, #0
	ands r1, r2
	ldrh r3, [r4, #0x2a]
	adds r2, r6, #0
	ands r2, r3
	movs r3, #3
	str r3, [sp]
	movs r3, #0
	bl sub_0801F34C
	b _08064642
	.align 2, 0
_08064610: .4byte 0x000001FF
_08064614:
	movs r2, #0x28
	ldrsh r0, [r4, r2]
	subs r0, #7
	movs r1, #0x20
	bl Div
	adds r0, #0xd1
	movs r3, #0x28
	ldrsh r1, [r4, r3]
	subs r1, #0x10
	ands r1, r5
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	subs r2, #0x10
	ands r2, r6
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	movs r3, #3
	str r3, [sp]
	movs r3, #0
	bl sub_0801F34C
_08064642:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

