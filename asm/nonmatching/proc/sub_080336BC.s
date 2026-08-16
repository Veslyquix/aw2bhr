	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080336BC
sub_080336BC: @ 0x080336BC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x2c]
	ldrh r0, [r4, #0x2a]
	subs r0, #1
	cmp r1, r0
	bge _080336F8
	ldr r0, [r4, #0x24]
	movs r1, #0
	bl sub_08030B00
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08033748
	ldr r0, [r4, #0x24]
	adds r0, #0x80
	str r0, [r4, #0x24]
	ldrh r1, [r4, #0x2c]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x2a]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x2f
	strb r0, [r1]
	b _08033742
_080336F8:
	ldr r5, _08033768 @ =gUnknown_03004400
	adds r0, r5, #0
	movs r1, #0
	bl sub_08030B00
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08033748
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x2e
	adds r6, r4, #0
	adds r6, #0x2f
	ldrb r0, [r3]
	cmp r2, r0
	bge _08033734
_0803371E:
	ldr r1, [r4, #0x24]
	adds r0, r2, r5
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x24]
	adds r0, #1
	str r0, [r4, #0x24]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _0803371E
_08033734:
	ldrh r1, [r4, #0x2c]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x2a]
	bl __divsi3
	strb r0, [r6]
_08033742:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
_08033748:
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _08033754
	adds r0, r4, #0
	bl _call_via_r1
_08033754:
	ldrh r0, [r4, #0x2c]
	ldrh r1, [r4, #0x2a]
	cmp r0, r1
	blo _08033762
	adds r0, r4, #0
	bl Proc_Break
_08033762:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08033768: .4byte gUnknown_03004400

