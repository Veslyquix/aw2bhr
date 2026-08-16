	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806DCB8
sub_0806DCB8: @ 0x0806DCB8
	push {r4, r5, lr}
	ldr r2, _0806DCE4 @ =gUnknown_0816E1AC
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x33
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r1, _0806DCE8 @ =gUnknown_0816E1B0
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r5, [r3, #2]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _0806DCEE
	cmp r4, #0
	bne _0806DCEC
	ldrh r3, [r3, #4]
	cmp r5, r3
	bne _0806DCEE
	movs r4, #6
	b _0806DCEE
	.align 2, 0
_0806DCE4: .4byte gUnknown_0816E1AC
_0806DCE8: .4byte gUnknown_0816E1B0
_0806DCEC:
	subs r4, #1
_0806DCEE:
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r3, [r1, #2]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0806DD0C
	cmp r4, #6
	bne _0806DD0A
	ldrh r1, [r1, #4]
	cmp r3, r1
	bne _0806DD0C
	movs r4, #0
	b _0806DD0C
_0806DD0A:
	adds r4, #1
_0806DD0C:
	ldr r5, [r2]
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	beq _0806DD28
	movs r0, #0
	strh r0, [r1, #0x2a]
	movs r0, #0x64
	bl sub_0803B4DC
_0806DD28:
	ldr r0, [r5]
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

