	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807F378
sub_0807F378: @ 0x0807F378
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0807F37E:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r5, #0
	bl sub_08071AF0
	adds r4, #1
	cmp r4, #0xf
	ble _0807F37E
	ldr r2, _0807F3F4 @ =gUnknown_030030CC
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r3, _0807F3F8 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0807F3FC @ =gUnknown_03002020
	ldrh r0, [r1]
	strh r0, [r1]
	ldr r1, _0807F400 @ =gUnknown_03002B28
	ldrh r0, [r1]
	strh r0, [r1]
	ldr r1, _0807F404 @ =gUnknown_03001FFC
	movs r0, #0x10
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _0807F408 @ =0x0000FFE0
	ands r0, r1
	movs r1, #0x1f
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	strb r0, [r3]
	ldr r1, _0807F40C @ =gUnknown_030030A4
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r1, _0807F410 @ =gUnknown_030030DC
	ldrb r0, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807F3F4: .4byte gUnknown_030030CC
_0807F3F8: .4byte gUnknown_030030E0
_0807F3FC: .4byte gUnknown_03002020
_0807F400: .4byte gUnknown_03002B28
_0807F404: .4byte gUnknown_03001FFC
_0807F408: .4byte 0x0000FFE0
_0807F40C: .4byte gUnknown_030030A4
_0807F410: .4byte gUnknown_030030DC

