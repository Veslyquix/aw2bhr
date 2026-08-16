	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080145E8
sub_080145E8: @ 0x080145E8
	adds r3, r0, #0
	ldr r2, _08014664 @ =gUnknown_0200C020
	ldr r0, [r2, #0x20]
	str r0, [r3, #0x20]
	ldr r0, [r2, #0x24]
	str r0, [r3, #0x24]
	ldr r0, [r2, #0x28]
	str r0, [r3, #0x28]
	ldrh r0, [r2, #0x2c]
	strh r0, [r3, #0x2c]
	ldrh r0, [r2, #0x2e]
	strh r0, [r3, #0x2e]
	ldrh r0, [r2, #0x34]
	strh r0, [r3, #0x36]
	strh r0, [r3, #0x34]
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x38
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r3, #0
	adds r1, #0x31
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x33
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x39
	ldrb r0, [r0]
	adds r1, #6
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	adds r1, #1
	strb r0, [r1]
	ldr r0, [r2, #0x3c]
	str r0, [r3, #0x3c]
	adds r0, r2, #0
	adds r0, #0x40
	ldrb r1, [r0]
	adds r0, r3, #0
	adds r0, #0x40
	strb r1, [r0]
	bx lr
	.align 2, 0
_08014664: .4byte gUnknown_0200C020

