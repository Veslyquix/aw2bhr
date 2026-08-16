	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807BC40
sub_0807BC40: @ 0x0807BC40
	push {r4, lr}
	ldr r3, _0807BCC8 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _0807BCCC @ =gUnknown_03002020
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0807BCD0 @ =gUnknown_03002B28
	strh r1, [r0]
	ldr r1, _0807BCD4 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0807BCD8 @ =0x0000FFE0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _0807BCDC @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	ldr r3, _0807BCE0 @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _0807BCE4 @ =gUnknown_03001FE8
	ldrb r0, [r3]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3]
	ldr r3, _0807BCE8 @ =gUnknown_030030B4
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0807BCEC @ =gUnknown_0300251C
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807BCC8: .4byte gUnknown_030030E0
_0807BCCC: .4byte gUnknown_03002020
_0807BCD0: .4byte gUnknown_03002B28
_0807BCD4: .4byte gUnknown_03001FFC
_0807BCD8: .4byte 0x0000FFE0
_0807BCDC: .4byte 0x0000E0FF
_0807BCE0: .4byte gUnknown_03002B6C
_0807BCE4: .4byte gUnknown_03001FE8
_0807BCE8: .4byte gUnknown_030030B4
_0807BCEC: .4byte gUnknown_0300251C

