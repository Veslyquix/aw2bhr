	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806B3E8
sub_0806B3E8: @ 0x0806B3E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	mov r8, r0
	ldr r3, [r0, #0x5c]
	movs r5, #0x10
	str r5, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0xa
	bl Interpolate
	str r0, [sp, #4]
	movs r2, #2
	rsbs r2, r2, #0
	mov r0, r8
	ldr r3, [r0, #0x5c]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	bl Interpolate
	str r0, [sp, #8]
	ldr r0, _0806B5D8 @ =gUnknown_0823BDE0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_080136DC
	ldr r0, _0806B5DC @ =gUnknown_08194280
	movs r1, #4
	movs r2, #1
	movs r3, #1
	bl sub_080136DC
	movs r1, #0
	mov sl, r1
	ldr r2, _0806B5E0 @ =gUnknown_0200B614
	mov sb, r2
_0806B43C:
	mov r3, sl
	lsls r3, r3, #1
	str r3, [sp, #0xc]
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #2
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r2, r8
	ldr r3, [r2, #0x5c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, r8
	ldr r3, [r1, #0x5c]
	movs r2, #0x10
	str r2, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, r8
	ldr r3, [r0, #0x5c]
	movs r1, #0x10
	str r1, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	ldr r1, _0806B5E4 @ =gPal
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	str r1, [sp, #0x10]
	lsrs r0, r0, #6
	lsls r1, r6, #5
	adds r0, r0, r1
	adds r0, r7, r0
	ldr r3, [sp, #0x10]
	strh r0, [r3]
	movs r0, #3
	add sb, r0
	movs r1, #1
	add sl, r1
	mov r2, sl
	cmp r2, #0xf
	ble _0806B43C
	movs r3, #0x40
	mov sl, r3
	ldr r0, [sp, #8]
	lsls r0, r0, #0x10
	str r0, [sp, #0x20]
	ldr r1, [sp, #4]
	asrs r1, r1, #1
	str r1, [sp, #0x1c]
	ldr r0, _0806B5E0 @ =gUnknown_0200B614
	adds r0, #0xc0
	mov sb, r0
_0806B4EC:
	mov r2, sl
	lsls r2, r2, #1
	str r2, [sp, #0x14]
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r0, #1
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	movs r0, #2
	ldrsb r0, [r3, r0]
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r1, r6, #1
	adds r1, r1, r6
	lsls r1, r1, #1
	adds r0, r0, r1
	adds r0, r0, r4
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, r8
	ldr r3, [r0, #0x5c]
	movs r1, #0x10
	str r1, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r2, r8
	ldr r3, [r2, #0x5c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r1, r8
	ldr r3, [r1, #0x5c]
	movs r2, #0x10
	str r2, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl Interpolate
	lsls r0, r0, #0x10
	ldr r1, _0806B5E4 @ =gPal
	ldr r3, [sp, #0x14]
	adds r1, r3, r1
	str r1, [sp, #0x18]
	lsrs r0, r0, #6
	lsls r1, r6, #5
	adds r0, r0, r1
	adds r0, r7, r0
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	movs r2, #3
	add sb, r2
	movs r3, #1
	add sl, r3
	mov r0, sl
	cmp r0, #0x4f
	ble _0806B4EC
	bl sub_080135A4
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl sub_08072C40
	ldr r1, [sp, #0x20]
	lsrs r2, r1, #0x10
	movs r0, #2
	adds r1, r2, #0
	bl sub_08072C40
	ldr r2, _0806B5E8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldr r1, _0806B5EC @ =gUnknown_03002020
	movs r0, #1
	ldr r2, [sp, #4]
	ands r2, r0
	ldr r3, [sp, #0x1c]
	adds r0, r3, r2
	strh r0, [r1]
	ldr r0, _0806B5F0 @ =gUnknown_03002B28
	strh r3, [r0]
	ldr r1, _0806B5F4 @ =gUnknown_03001FFC
	movs r0, #0
	strh r0, [r1]
	mov r2, r8
	ldr r0, [r2, #0x5c]
	cmp r0, #0xf
	ble _0806B5F8
	mov r0, r8
	bl Proc_Break
	b _0806B5FE
	.align 2, 0
_0806B5D8: .4byte gUnknown_0823BDE0
_0806B5DC: .4byte gUnknown_08194280
_0806B5E0: .4byte gUnknown_0200B614
_0806B5E4: .4byte gPal
_0806B5E8: .4byte gUnknown_030030E0
_0806B5EC: .4byte gUnknown_03002020
_0806B5F0: .4byte gUnknown_03002B28
_0806B5F4: .4byte gUnknown_03001FFC
_0806B5F8:
	adds r0, #1
	mov r3, r8
	str r0, [r3, #0x5c]
_0806B5FE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

