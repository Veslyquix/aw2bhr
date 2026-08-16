	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08063698
sub_08063698: @ 0x08063698
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _080636F4 @ =0x000003FF
	ands r4, r2
	mov r2, sp
	movs r1, #0
	strh r1, [r2]
	ldr r3, _080636F8 @ =0x040000D4
	str r2, [r3]
	lsls r1, r4, #5
	ldr r2, _080636FC @ =0x06010000
	adds r1, r1, r2
	str r1, [r3, #4]
	ldr r1, _08063700 @ =0x81000400
	str r1, [r3, #8]
	ldr r1, [r3, #8]
	cmp r0, #0
	blt _080636EC
	adds r0, r4, #0
	adds r0, #9
	lsls r0, r0, #5
	movs r1, #0x80
	lsls r1, r1, #9
	adds r4, r0, r1
	ldr r6, _08063704 @ =gUnknown_02017C50
	movs r5, #5
_080636CC:
	ldr r1, _08063708 @ =0x0001FFE0
	ands r1, r4
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	movs r2, #0xc0
	bl sub_08011E54
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r4, r1
	adds r6, #0xc0
	subs r5, #1
	cmp r5, #0
	bge _080636CC
_080636EC:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080636F4: .4byte 0x000003FF
_080636F8: .4byte 0x040000D4
_080636FC: .4byte 0x06010000
_08063700: .4byte 0x81000400
_08063704: .4byte gUnknown_02017C50
_08063708: .4byte 0x0001FFE0

