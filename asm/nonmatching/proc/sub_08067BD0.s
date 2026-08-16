	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067BD0
sub_08067BD0: @ 0x08067BD0
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r1, r3, #0
	ldr r0, _08067C58 @ =gUnknown_08581068
	bl Proc_Start
	adds r5, r0, #0
	lsls r0, r6, #7
	str r0, [r5, #0x30]
	str r6, [r5, #0x34]
	str r4, [r5, #0x2c]
	mov r0, r8
	str r0, [r5, #0x38]
	movs r6, #0
	str r6, [r5, #0x3c]
	ldr r0, _08067C5C @ =gUnknown_08183780
	movs r1, #0xa0
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _08067C60 @ =gUnknown_08581044
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
	ldr r2, _08067C64 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08067C68 @ =gUnknown_03002020
	strh r6, [r0]
	ldr r1, _08067C6C @ =gUnknown_03002B28
	movs r0, #0x10
	strh r0, [r1]
	ldr r0, _08067C70 @ =gUnknown_03001FFC
	strh r6, [r0]
	ldrh r1, [r2]
	ldr r0, _08067C74 @ =0x0000FFE0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	ldr r1, _08067C78 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldrh r1, [r5, #0x30]
	movs r0, #1
	movs r2, #0
	bl sub_08072C40
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08067C58: .4byte gUnknown_08581068
_08067C5C: .4byte gUnknown_08183780
_08067C60: .4byte gUnknown_08581044
_08067C64: .4byte gUnknown_030030E0
_08067C68: .4byte gUnknown_03002020
_08067C6C: .4byte gUnknown_03002B28
_08067C70: .4byte gUnknown_03001FFC
_08067C74: .4byte 0x0000FFE0
_08067C78: .4byte 0x0000E0FF

