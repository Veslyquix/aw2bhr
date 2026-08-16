	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08071DB4
sub_08071DB4: @ 0x08071DB4
	push {r4, r5, lr}
	ldr r2, _08071E20 @ =gUnknown_030030A4
	ldrb r1, [r2]
	movs r4, #0x20
	orrs r1, r4
	strb r1, [r2]
	ldrb r1, [r2, #1]
	orrs r1, r4
	strb r1, [r2, #1]
	ldr r2, _08071E24 @ =gUnknown_030030DC
	ldrb r1, [r2]
	orrs r1, r4
	strb r1, [r2]
	ldrb r1, [r2, #1]
	orrs r1, r4
	strb r1, [r2, #1]
	ldr r3, _08071E28 @ =gUnknown_030030E0
	ldrb r1, [r3]
	movs r2, #0xc0
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08071E2C @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _08071E30 @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r2, _08071E34 @ =gUnknown_03001FFC
	movs r1, #0x10
	strh r1, [r2]
	ldrh r2, [r3]
	ldr r1, _08071E38 @ =0x0000FFE0
	ands r1, r2
	movs r2, #0x1f
	orrs r1, r2
	ldr r2, _08071E3C @ =0x0000E0FF
	ands r1, r2
	movs r5, #0xf8
	lsls r5, r5, #5
	adds r2, r5, #0
	orrs r1, r2
	strh r1, [r3]
	ldrb r1, [r3]
	orrs r1, r4
	strb r1, [r3]
	adds r2, r0, #0
	adds r2, #0x64
	movs r1, #0x10
	strh r1, [r2]
	adds r0, #0x66
	adds r1, #0xf0
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08071E20: .4byte gUnknown_030030A4
_08071E24: .4byte gUnknown_030030DC
_08071E28: .4byte gUnknown_030030E0
_08071E2C: .4byte gUnknown_03002020
_08071E30: .4byte gUnknown_03002B28
_08071E34: .4byte gUnknown_03001FFC
_08071E38: .4byte 0x0000FFE0
_08071E3C: .4byte 0x0000E0FF

