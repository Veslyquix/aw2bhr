	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F2FC
sub_0807F2FC: @ 0x0807F2FC
	ldr r2, _0807F358 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0807F35C @ =gUnknown_03002020
	ldrh r0, [r1]
	strh r0, [r1]
	ldr r1, _0807F360 @ =gUnknown_03002B28
	ldrh r0, [r1]
	strh r0, [r1]
	ldr r1, _0807F364 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldrh r1, [r2]
	ldr r0, _0807F368 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0xf
	orrs r0, r1
	strh r0, [r2]
	ldrb r1, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r2]
	ldr r0, _0807F36C @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0807F370 @ =gUnknown_030030A4
	ldrb r0, [r1]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0807F374 @ =gUnknown_030030DC
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_0807F358: .4byte gUnknown_030030E0
_0807F35C: .4byte gUnknown_03002020
_0807F360: .4byte gUnknown_03002B28
_0807F364: .4byte gUnknown_03001FFC
_0807F368: .4byte 0x0000FFE0
_0807F36C: .4byte 0x0000E0FF
_0807F370: .4byte gUnknown_030030A4
_0807F374: .4byte gUnknown_030030DC

