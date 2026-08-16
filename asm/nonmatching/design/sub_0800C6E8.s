	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0800C6E8
sub_0800C6E8: @ 0x0800C6E8
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r7, r2, #0
	movs r4, #0
	cmp r0, #0x48
	beq _0800C70C
	cmp r0, #0x48
	bgt _0800C6FE
	cmp r0, #0x28
	beq _0800C708
	b _0800C74E
_0800C6FE:
	cmp r0, #0x68
	beq _0800C710
	cmp r0, #0x88
	beq _0800C714
	b _0800C74E
_0800C708:
	movs r1, #0
	b _0800C716
_0800C70C:
	movs r1, #1
	b _0800C716
_0800C710:
	movs r1, #2
	b _0800C716
_0800C714:
	movs r1, #3
_0800C716:
	ldr r5, _0800C758 @ =gUnknown_0200B0B0
	ldr r3, [r5]
	adds r0, r3, #0
	adds r0, #0x17
	adds r2, r0, r1
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _0800C74E
	adds r0, r3, #0
	adds r0, #0x1b
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0800C74E
	movs r0, #0
	ldrsb r0, [r2, r0]
	str r0, [r6]
	ldr r0, [r5]
	adds r0, #0x1b
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r7]
	movs r4, #1
_0800C74E:
	adds r0, r4, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800C758: .4byte gUnknown_0200B0B0

