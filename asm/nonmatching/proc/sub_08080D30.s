	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080D30
sub_08080D30: @ 0x08080D30
	push {r4, lr}
	ldr r3, _08080DD0 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _08080DD4 @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08080DD8 @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _08080DDC @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08080DE0 @ =0x0000FFE0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _08080DE4 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	ldr r3, _08080DE8 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _08080DEC @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r4, #2
	orrs r0, r4
	strb r0, [r3]
	ldr r3, _08080DF0 @ =gUnknown_030030B4
	ldrb r0, [r3]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _08080DF4 @ =gUnknown_0300251C
	ldrb r0, [r3]
	ands r2, r0
	movs r1, #1
	orrs r2, r1
	strb r2, [r3]
	ldr r2, _08080DF8 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	orrs r0, r1
	orrs r0, r4
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080DD0: .4byte gUnknown_030030E0
_08080DD4: .4byte gUnknown_03002020
_08080DD8: .4byte gUnknown_03002B28
_08080DDC: .4byte gUnknown_03001FFC
_08080DE0: .4byte 0x0000FFE0
_08080DE4: .4byte 0x0000E0FF
_08080DE8: .4byte gUnknown_03002B6C
_08080DEC: .4byte gUnknown_03001FE8
_08080DF0: .4byte gUnknown_030030B4
_08080DF4: .4byte gUnknown_0300251C
_08080DF8: .4byte gUnknown_030030CC

