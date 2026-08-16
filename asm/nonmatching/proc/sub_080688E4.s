	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080688E4
sub_080688E4: @ 0x080688E4
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	mov sb, r0
	ldr r2, _080689D0 @ =gUnknown_0202F204
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_080674F4
	mov r1, sb
	str r0, [r1, #0x2c]
	ldr r2, _080689D4 @ =gDispIo
	ldrb r1, [r2]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	movs r5, #1
	orrs r0, r5
	strb r0, [r2]
	ldrb r0, [r2, #1]
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r4, _080689D8 @ =gUnknown_030030B4
	ldrb r2, [r4]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4]
	ldr r3, _080689DC @ =gUnknown_03001FE8
	ldrb r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r3]
	ldr r2, _080689E0 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	ands r1, r0
	orrs r1, r6
	strb r1, [r2]
	ldr r2, _080689E4 @ =gUnknown_0300251C
	ldrb r0, [r2]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2]
	bl sub_08063994
	ldr r0, _080689E8 @ =0x06008000
	mov r8, r0
	adds r0, r4, #0
	mov r1, r8
	bl sub_08012C30
	ldr r5, _080689EC @ =0x0600F000
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08012C1C
	adds r0, r4, #0
	movs r1, #1
	bl sub_08012C48
	movs r6, #0
	str r6, [sp]
	ldr r2, _080689F0 @ =0x01000100
	mov r0, sp
	adds r1, r5, #0
	bl CpuFastSet
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldr r0, _080689F4 @ =gUnknown_0817DA38
	mov r1, r8
	bl Decompress
	ldr r0, _080689F8 @ =gUnknown_0817E208
	ldr r1, _080689FC @ =gUnknown_08499580
	ldr r1, [r1]
	bl Decompress
	bl sub_08013B0C
	movs r0, #0xc0
	lsls r0, r0, #4
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #0
	mov r3, sb
	bl sub_08067898
	mov r1, sb
	str r6, [r1, #0x30]
	str r6, [r1, #0x34]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080689D0: .4byte gUnknown_0202F204
_080689D4: .4byte gDispIo
_080689D8: .4byte gUnknown_030030B4
_080689DC: .4byte gUnknown_03001FE8
_080689E0: .4byte gUnknown_03002B6C
_080689E4: .4byte gUnknown_0300251C
_080689E8: .4byte 0x06008000
_080689EC: .4byte 0x0600F000
_080689F0: .4byte 0x01000100
_080689F4: .4byte gUnknown_0817DA38
_080689F8: .4byte gUnknown_0817E208
_080689FC: .4byte gUnknown_08499580

