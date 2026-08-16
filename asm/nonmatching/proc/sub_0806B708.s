	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B708
sub_0806B708: @ 0x0806B708
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov r8, r0
	bl sub_0801237C
	bl sub_08012358
	ldr r0, _0806B7EC @ =gUnknown_0849D16C
	bl sub_08012C58
	ldr r5, _0806B7F0 @ =gDispIo
	ldrb r0, [r5]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _0806B7F4 @ =gPal
	movs r6, #0
	strh r6, [r0, #2]
	ldr r0, _0806B7F8 @ =gUnknown_0822DE80
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0806B7FC @ =0x11111111
	str r0, [sp]
	ldr r4, _0806B800 @ =gUnknown_03001FE8
	ldr r1, [r4]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	ldr r0, _0806B804 @ =0x06005000
	adds r1, r1, r0
	ldr r2, _0806B808 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0806B80C @ =gUnknown_0849957C
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #3
	movs r2, #0xa0
	lsls r2, r2, #2
	bl sub_08072C28
	ldr r0, _0806B810 @ =gUnknown_081918A4
	ldr r1, _0806B814 @ =0x06016000
	bl Decompress
	ldrb r1, [r5, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	ldrb r1, [r4]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r4]
	ldr r3, _0806B818 @ =gUnknown_0300251C
	ldrb r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0806B81C @ =gUnknown_03002B6C
	ldrb r0, [r1]
	ands r2, r0
	mov r0, sb
	orrs r2, r0
	strb r2, [r1]
	ldr r2, _0806B820 @ =gUnknown_030030B4
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_0806B120
	mov r1, r8
	strh r6, [r1, #0x2c]
	strh r6, [r1, #0x2a]
	str r6, [r1, #0x30]
	mov r0, r8
	bl sub_0806AF44
	bl sub_08013AFC
	ldr r0, _0806B824 @ =gUnknown_0858193C
	mov r1, r8
	bl Proc_Start
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806B7EC: .4byte gUnknown_0849D16C
_0806B7F0: .4byte gDispIo
_0806B7F4: .4byte gPal
_0806B7F8: .4byte gUnknown_0822DE80
_0806B7FC: .4byte 0x11111111
_0806B800: .4byte gUnknown_03001FE8
_0806B804: .4byte 0x06005000
_0806B808: .4byte 0x01000008
_0806B80C: .4byte gUnknown_0849957C
_0806B810: .4byte gUnknown_081918A4
_0806B814: .4byte 0x06016000
_0806B818: .4byte gUnknown_0300251C
_0806B81C: .4byte gUnknown_03002B6C
_0806B820: .4byte gUnknown_030030B4
_0806B824: .4byte gUnknown_0858193C

