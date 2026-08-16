	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078F60
sub_08078F60: @ 0x08078F60
	push {r4, lr}
	ldr r3, _08078FF4 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _08078FF8 @ =gUnknown_03002020
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08078FFC @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r1, _08079000 @ =gUnknown_03001FFC
	ldrh r0, [r1]
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08079004 @ =0x0000FFE0
	ands r0, r1
	strh r0, [r3]
	ldrb r1, [r3]
	movs r2, #0x21
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldrh r1, [r3]
	ldr r0, _08079008 @ =0x0000E0FF
	ands r0, r1
	movs r4, #0x80
	lsls r4, r4, #4
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	ands r2, r0
	strb r2, [r3, #1]
	ldr r3, _0807900C @ =gUnknown_03002B6C
	ldrb r1, [r3]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3]
	ldr r3, _08079010 @ =gUnknown_03001FE8
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _08079014 @ =gUnknown_030030B4
	ldrb r0, [r1]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _08079018 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0807901C @ =gUnknown_030030DC
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldrb r0, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078FF4: .4byte gUnknown_030030E0
_08078FF8: .4byte gUnknown_03002020
_08078FFC: .4byte gUnknown_03002B28
_08079000: .4byte gUnknown_03001FFC
_08079004: .4byte 0x0000FFE0
_08079008: .4byte 0x0000E0FF
_0807900C: .4byte gUnknown_03002B6C
_08079010: .4byte gUnknown_03001FE8
_08079014: .4byte gUnknown_030030B4
_08079018: .4byte gUnknown_0300251C
_0807901C: .4byte gUnknown_030030DC

