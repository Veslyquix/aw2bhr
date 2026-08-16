	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013034
sub_08013034: @ 0x08013034
	adds r3, r0, #0
	movs r1, #0
	ldrb r0, [r3]
	cmp r0, #0
	beq _0801304C
_0801303E:
	adds r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r0, r3, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801303E
_0801304C:
	cmp r1, #0
	beq _08013064
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r3, r1
	ldrb r0, [r2]
	cmp r0, #0x81
	bne _08013064
	ldrb r0, [r2, #1]
	cmp r0, #0x40
	beq _0801304C
_08013064:
	adds r1, r1, r3
	movs r0, #0
	strb r0, [r1, #2]
	bx lr

