	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030930
sub_08030930: @ 0x08030930
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080309A4 @ =gUnknown_08090CDC
	ldr r3, [r4]
	ldr r2, [r3]
	ldr r1, _080309A8 @ =0x00001AAD
	adds r0, r2, r1
	ldrb r1, [r0]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #3
	movs r1, #0x96
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r2, r2, r0
	movs r0, #0xaf
	strb r0, [r2]
	ldr r0, [r3]
	ldrb r0, [r0, #6]
	strb r0, [r2, #1]
	ldr r1, [r3]
	ldrh r0, [r1, #0x20]
	strh r0, [r2, #2]
	movs r0, #0x80
	strh r0, [r2, #4]
	ldrh r0, [r1, #0x20]
	adds r0, #1
	ldrh r3, [r1, #0x20]
	strh r0, [r1, #0x20]
	movs r3, #0
	adds r2, #6
_0803096E:
	adds r1, r2, r3
	adds r0, r5, r3
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r0, #0
	bge _0803096E
	ldr r3, [r4]
	ldr r1, [r3]
	ldr r2, _080309A8 @ =0x00001AAD
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	ldrb r4, [r1]
	strb r0, [r1]
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r2, [r1]
	movs r0, #0x1f
	ands r0, r2
	ldrb r2, [r1]
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080309A4: .4byte gUnknown_08090CDC
_080309A8: .4byte 0x00001AAD

