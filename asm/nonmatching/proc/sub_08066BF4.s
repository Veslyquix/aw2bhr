	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066BF4
sub_08066BF4: @ 0x08066BF4
	push {r4, r5, lr}
	ldr r2, _08066C20 @ =gUnknown_0816E158
	ldr r0, [r2]
	ldr r0, [r0]
	adds r0, #0x33
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r1, _08066C24 @ =gUnknown_0816E15C
	ldr r0, [r1]
	ldr r3, [r0]
	ldrh r5, [r3, #2]
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08066C2A
	cmp r4, #0
	bne _08066C28
	ldrh r3, [r3, #4]
	cmp r5, r3
	bne _08066C2A
	movs r4, #6
	b _08066C2A
	.align 2, 0
_08066C20: .4byte gUnknown_0816E158
_08066C24: .4byte gUnknown_0816E15C
_08066C28:
	subs r4, #1
_08066C2A:
	ldr r0, [r1]
	ldr r1, [r0]
	ldrh r3, [r1, #2]
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _08066C48
	cmp r4, #6
	bne _08066C46
	ldrh r1, [r1, #4]
	cmp r3, r1
	bne _08066C48
	movs r4, #0
	b _08066C48
_08066C46:
	adds r4, #1
_08066C48:
	ldr r5, [r2]
	ldr r1, [r5]
	adds r0, r1, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	beq _08066C64
	movs r0, #0
	strh r0, [r1, #0x2a]
	movs r0, #0x64
	bl sub_0803B4DC
_08066C64:
	ldr r0, [r5]
	adds r0, #0x33
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0

