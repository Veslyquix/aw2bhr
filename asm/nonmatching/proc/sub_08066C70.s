	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08066C70
sub_08066C70: @ 0x08066C70
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r3, #0
	adds r4, #0x48
	ldrb r0, [r4]
	adds r1, r3, #0
	adds r1, #0x49
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	bne _08066CCC
	ldr r2, _08066CC8 @ =gUnknown_0816E160
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08066CA4
	ldrb r0, [r4]
	cmp r0, #0
	beq _08066CA4
	subs r0, #1
	strb r0, [r4]
_08066CA4:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x48
	cmp r0, #0
	beq _08066D18
	ldrb r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bge _08066D18
	b _08066D14
	.align 2, 0
_08066CC8: .4byte gUnknown_0816E160
_08066CCC:
	ldr r2, _08066D10 @ =gUnknown_0816E160
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08066CEC
	ldrb r0, [r4]
	cmp r0, #0
	bne _08066CE8
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
_08066CE8:
	subs r0, #1
	strb r0, [r4]
_08066CEC:
	ldr r0, [r2]
	ldr r0, [r0]
	ldrh r1, [r0, #2]
	movs r0, #0x80
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x48
	cmp r0, #0
	beq _08066D18
	ldrb r2, [r1]
	adds r0, r3, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _08066D14
	movs r0, #0
	b _08066D16
	.align 2, 0
_08066D10: .4byte gUnknown_0816E160
_08066D14:
	adds r0, r2, #1
_08066D16:
	strb r0, [r1]
_08066D18:
	adds r0, r3, #0
	adds r0, #0x49
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _08066D2A
	movs r0, #0x64
	bl sub_0803B4DC
_08066D2A:
	pop {r4}
	pop {r0}
	bx r0

