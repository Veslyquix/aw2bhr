	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08061DCC
sub_08061DCC: @ 0x08061DCC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x19
	ldr r2, _08061DF0 @ =gUnknown_0816DB08
	ldr r0, [r2]
	ldr r0, [r0]
	lsrs r1, r1, #0x19
	adds r6, r2, #0
	ldrb r0, [r0, #3]
	cmp r1, r0
	bhs _08061DF4
	ldrb r0, [r4, #9]
	movs r1, #8
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #2
	b _08061E46
	.align 2, 0
_08061DF0: .4byte gUnknown_0816DB08
_08061DF4:
	ldr r3, _08061E50 @ =gUnknown_0816DB0C
	ldr r1, [r3]
	ldrb r2, [r4]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0xb]
	adds r5, r3, #0
	adds r3, r2, #0
	cmp r0, #0
	beq _08061E16
	ldrh r1, [r4, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08061E3C
_08061E16:
	ldrb r0, [r4, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	movs r1, #0x64
	muls r0, r1, r0
	ldr r2, [r5]
	movs r1, #0x5c
	muls r1, r3, r1
	adds r1, r1, r2
	ldrb r1, [r1, #0x10]
	bl __divsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6]
	ldr r1, [r1]
	ldrb r1, [r1, #2]
	cmp r0, r1
	bhs _08061E4A
_08061E3C:
	ldrb r0, [r4, #9]
	movs r1, #8
	rsbs r1, r1, #0
	ands r1, r0
	movs r0, #1
_08061E46:
	orrs r1, r0
	strb r1, [r4, #9]
_08061E4A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08061E50: .4byte gUnknown_0816DB0C

