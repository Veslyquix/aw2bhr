	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078CC8
sub_08078CC8: @ 0x08078CC8
	push {r4, lr}
	ldr r3, _08078D24 @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x80
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08078D28 @ =gUnknown_03002020
	movs r2, #0
	strh r2, [r1]
	ldr r1, _08078D2C @ =gUnknown_03002B28
	strh r2, [r1]
	ldr r2, _08078D30 @ =gUnknown_03001FFC
	movs r1, #6
	strh r1, [r2]
	ldrh r2, [r3]
	ldr r1, _08078D34 @ =0x0000FFE0
	ands r1, r2
	movs r2, #0x1f
	orrs r1, r2
	strh r1, [r3]
	ldrb r1, [r3]
	movs r4, #0x20
	orrs r1, r4
	strb r1, [r3]
	ldr r3, _08078D38 @ =gUnknown_030030A4
	ldrb r1, [r3]
	orrs r1, r4
	strb r1, [r3]
	ldr r2, _08078D3C @ =gUnknown_030030DC
	ldrb r1, [r2]
	orrs r1, r4
	strb r1, [r2]
	ldrb r1, [r3, #1]
	orrs r1, r4
	strb r1, [r3, #1]
	ldrb r1, [r2, #1]
	orrs r1, r4
	strb r1, [r2, #1]
	adds r0, #0x68
	movs r1, #0
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078D24: .4byte gUnknown_030030E0
_08078D28: .4byte gUnknown_03002020
_08078D2C: .4byte gUnknown_03002B28
_08078D30: .4byte gUnknown_03001FFC
_08078D34: .4byte 0x0000FFE0
_08078D38: .4byte gUnknown_030030A4
_08078D3C: .4byte gUnknown_030030DC

