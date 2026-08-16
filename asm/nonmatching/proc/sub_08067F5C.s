	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067F5C
sub_08067F5C: @ 0x08067F5C
	ldr r3, _08067F9C @ =gUnknown_030030E0
	ldrb r2, [r3]
	movs r1, #0x3f
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	ldr r1, _08067FA0 @ =gUnknown_03002020
	ldr r2, [r0, #0x2c]
	strh r2, [r1]
	ldr r1, _08067FA4 @ =gUnknown_03002B28
	movs r0, #0x10
	subs r0, r0, r2
	strh r0, [r1]
	ldr r1, _08067FA8 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	ldrh r1, [r3]
	ldr r0, _08067FAC @ =0x0000FFE0
	ands r0, r1
	ldr r1, _08067FB0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r3, #1]
	bx lr
	.align 2, 0
_08067F9C: .4byte gUnknown_030030E0
_08067FA0: .4byte gUnknown_03002020
_08067FA4: .4byte gUnknown_03002B28
_08067FA8: .4byte gUnknown_03001FFC
_08067FAC: .4byte 0x0000FFE0
_08067FB0: .4byte 0x0000E0FF

