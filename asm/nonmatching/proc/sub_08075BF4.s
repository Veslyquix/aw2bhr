	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08075BF4
sub_08075BF4: @ 0x08075BF4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	adds r4, r5, #0
	adds r4, #0x64
	movs r1, #0xf
	adds r2, r4, #0
	bl sub_080759A0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r5, #0x5c]
	movs r6, #0xff
	ldrb r0, [r4]
	movs r1, #0
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r3, [r5, #0x2c]
	adds r1, r3, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08075C44
	ldr r2, [r5, #0x30]
	movs r0, #0x10
	rsbs r0, r0, #0
	cmp r2, r0
	blt _08075C44
	cmp r2, #0xa0
	bgt _08075C44
	ldr r0, [r5, #0x54]
	ldr r1, _08075C88 @ =0x000001FF
	ands r3, r1
	ands r2, r6
	adds r1, r3, #0
	bl sub_0801C254
_08075C44:
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _08075C82
	ldr r0, _08075C8C @ =gUnknown_08614280
	ldr r0, [r0]
	ldr r1, _08075C90 @ =0x0600F000
	movs r2, #0x80
	lsls r2, r2, #5
	bl sub_08011E54
	ldr r1, _08075C94 @ =gUnknown_081D1504
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #1
	lsls r0, r0, #5
	adds r0, r0, r1
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_080135F4
	bl sub_080136C4
	movs r0, #0xf
	movs r1, #1
	bl sub_08075A54
	bl sub_080135A4
_08075C82:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08075C88: .4byte 0x000001FF
_08075C8C: .4byte gUnknown_08614280
_08075C90: .4byte 0x0600F000
_08075C94: .4byte gUnknown_081D1504

