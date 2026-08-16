	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040CA4
sub_08040CA4: @ 0x08040CA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	str r0, [r7, #0x34]
	str r0, [r7, #0x38]
	str r0, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	ldr r1, _08040DCC @ =0x0000022A
	movs r2, #5
	bl sub_0804103C
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r0, [r0]
	ldr r1, _08040DD0 @ =0x0000024A
	movs r2, #4
	bl sub_08041128
	ldr r0, _08040DD4 @ =gUnknown_081214B4
	ldr r1, _08040DD8 @ =0x06013940
	bl Decompress
	ldr r0, _08040DDC @ =gUnknown_0812189C
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08040DE0 @ =gUnknown_08121344
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	str r0, [r7, #0x34]
	movs r1, #0
	bl sub_0801C4D4
	ldr r1, [r7, #0x34]
	ldr r0, _08040DE4 @ =0x0000424A
	strh r0, [r1, #0x22]
	ldr r0, _08040DE8 @ =gUnknown_081240BC
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	str r0, [r7, #0x38]
	movs r1, #0
	bl sub_0801C4D4
	ldr r1, [r7, #0x38]
	ldr r0, _08040DEC @ =0x0000522A
	strh r0, [r1, #0x22]
	ldr r0, _08040DF0 @ =gUnknown_08121870
	movs r1, #0
	movs r2, #1
	bl sub_0801C210
	str r0, [r7, #0x2c]
	movs r1, #0
	bl sub_0801C4D4
	ldr r1, [r7, #0x2c]
	ldr r0, _08040DF4 @ =0x000031CA
	strh r0, [r1, #0x22]
	ldr r4, _08040DF8 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov sb, r1
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r2, r4, #0
	lsls r2, r2, #4
	mov sl, r2
	mov r0, sl
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #1
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #4]
	mov r6, sl
	adds r4, r7, #0
	adds r4, #0x48
	ldrb r0, [r4]
	movs r5, #0x14
	subs r0, r5, r0
	lsls r0, r0, #8
	movs r1, #0x14
	bl Div
	cmp r0, #0
	beq _08040DFC
	ldrb r0, [r4]
	subs r0, r5, r0
	lsls r0, r0, #8
	movs r1, #0x14
	bl Div
	adds r1, r0, #0
	b _08040DFE
	.align 2, 0
_08040DCC: .4byte 0x0000022A
_08040DD0: .4byte 0x0000024A
_08040DD4: .4byte gUnknown_081214B4
_08040DD8: .4byte 0x06013940
_08040DDC: .4byte gUnknown_0812189C
_08040DE0: .4byte gUnknown_08121344
_08040DE4: .4byte 0x0000424A
_08040DE8: .4byte gUnknown_081240BC
_08040DEC: .4byte 0x0000522A
_08040DF0: .4byte gUnknown_08121870
_08040DF4: .4byte 0x000031CA
_08040DF8: .4byte gSinLut
_08040DFC:
	movs r1, #2
_08040DFE:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldr r4, _08040E50 @ =gSinLut
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	adds r4, #0x80
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r6, r0, #4
	adds r4, r7, #0
	adds r4, #0x48
	ldrb r0, [r4]
	movs r5, #0x14
	subs r0, r5, r0
	lsls r0, r0, #8
	movs r1, #0x14
	bl Div
	mov sl, r4
	cmp r0, #0
	beq _08040E54
	ldrb r0, [r4]
	subs r0, r5, r0
	lsls r0, r0, #8
	movs r1, #0x14
	bl Div
	adds r1, r0, #0
	b _08040E56
	.align 2, 0
_08040E50: .4byte gSinLut
_08040E54:
	movs r1, #2
_08040E56:
	adds r0, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #3
	ldr r1, [sp, #4]
	mov r2, sb
	mov r3, r8
	bl SetObjAffine
	ldr r4, _08040EF0 @ =gSinLut
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov sb, r1
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	mov r0, sb
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r4, [r4, r1]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #2
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	mov r2, sl
	ldrb r0, [r2]
	adds r2, r7, #0
	adds r2, #0x46
	movs r1, #0
	strh r0, [r2]
	adds r0, r7, #0
	adds r0, #0x42
	strh r1, [r0]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040EF0: .4byte gSinLut

