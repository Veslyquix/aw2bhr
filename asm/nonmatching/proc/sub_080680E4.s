	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080680E4
sub_080680E4: @ 0x080680E4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x2a
	ldrb r0, [r2]
	cmp r0, #3
	bhi _08068102
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #1
	strh r1, [r3, #0x2c]
	ldrb r0, [r2]
	lsls r5, r0, #1
	adds r2, r0, #0
	b _0806810E
_08068102:
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, #1
	strh r0, [r3, #0x2c]
	ldrb r2, [r2]
	adds r5, r2, #0
_0806810E:
	ldrh r1, [r3, #0x2c]
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	strh r0, [r3, #0x2e]
	adds r0, r3, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	subs r0, #3
	lsls r1, r0, #2
	adds r1, r1, r0
	movs r0, #0x2e
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x4e
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _08068176
	movs r0, #0xf0
	strh r0, [r3, #0x34]
	ldrh r1, [r3, #0x2e]
	subs r0, r0, r1
	adds r0, #0x1e
	strh r0, [r3, #0x36]
	ldrh r0, [r3, #0x2c]
	subs r1, r0, #1
	cmp r1, #0
	blt _080681B2
	adds r4, r3, #0
	adds r4, #0x4c
	movs r7, #1
	adds r0, #0x37
	adds r2, r0, r3
	movs r6, #0
_08068158:
	cmp r1, r5
	blt _0806816A
	ldrh r0, [r3, #0x2c]
	subs r0, #1
	cmp r1, r0
	bge _0806816A
	strb r1, [r4]
	strb r7, [r2]
	b _0806816C
_0806816A:
	strb r6, [r2]
_0806816C:
	subs r2, #1
	subs r1, #1
	cmp r1, #0
	bge _08068158
	b _080681B2
_08068176:
	ldrh r0, [r3, #0x2e]
	rsbs r0, r0, #0
	strh r0, [r3, #0x34]
	ldr r0, _080681A4 @ =0x0000FFE2
	strh r0, [r3, #0x36]
	ldrh r0, [r3, #0x2c]
	subs r1, r0, #1
	cmp r1, #0
	blt _080681B2
	adds r4, r2, #1
	adds r2, r3, #0
	adds r2, #0x4c
	adds r0, #0x37
	adds r0, r0, r3
	movs r5, #1
	movs r3, #0
_08068196:
	cmp r1, #0
	ble _080681A8
	cmp r1, r4
	bge _080681A8
	strb r1, [r2]
	strb r5, [r0]
	b _080681AA
	.align 2, 0
_080681A4: .4byte 0x0000FFE2
_080681A8:
	strb r3, [r0]
_080681AA:
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _08068196
_080681B2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

