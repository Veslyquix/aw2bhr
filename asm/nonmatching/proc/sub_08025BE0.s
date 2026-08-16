	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08025BE0
sub_08025BE0: @ 0x08025BE0
	push {r4, r5, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x18
	lsrs r4, r1, #0x18
	movs r5, #0
	strb r4, [r3]
	strb r5, [r3, #1]
	ldrb r1, [r3, #6]
	movs r2, #0x7f
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #6]
	ldrb r1, [r3, #4]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x64
	orrs r0, r1
	strb r0, [r3, #4]
	ldr r1, _08025C48 @ =gUnknown_085D5ABC
	movs r0, #0x5c
	muls r0, r4, r0
	adds r0, r0, r1
	ldrb r1, [r0, #0x10]
	ands r2, r1
	strb r2, [r3, #6]
	ldrb r1, [r0, #0xb]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r3, #4]
	ldr r0, _08025C4C @ =0xFFFFF87F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
	ldrb r1, [r3, #5]
	movs r0, #7
	ands r0, r1
	strb r0, [r3, #5]
	strb r5, [r3, #7]
	strb r5, [r3, #8]
	movs r0, #0
	strb r0, [r3, #9]
	strb r5, [r3, #0xa]
	movs r0, #1
	strb r0, [r3, #0xb]
	cmp r4, #2
	bgt _08025C50
	cmp r4, #1
	blt _08025C50
	strb r5, [r3, #0xb]
	b _08025C54
	.align 2, 0
_08025C48: .4byte gUnknown_085D5ABC
_08025C4C: .4byte 0xFFFFF87F
_08025C50:
	movs r0, #4
	strb r0, [r3, #0xb]
_08025C54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

