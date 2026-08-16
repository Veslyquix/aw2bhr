	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08014CEC
sub_08014CEC: @ 0x08014CEC
	adds r1, r0, #0
	movs r2, #0
	ldrb r0, [r1]
	cmp r0, #0
	beq _08014D16
	ldr r3, _08014D1C @ =gUnknown_084C36E4
_08014CF8:
	cmp r2, #0
	beq _08014D02
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08014D02:
	ldrb r0, [r1]
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08014CF8
_08014D16:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_08014D1C: .4byte gUnknown_084C36E4

