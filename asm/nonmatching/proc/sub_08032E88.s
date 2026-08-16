	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032E88
sub_08032E88: @ 0x08032E88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	ldr r0, [r0, #0x2c]
	subs r0, #0x10
	adds r1, r0, #0
	muls r1, r0, r1
	adds r0, r1, #0
	asrs r0, r0, #1
	movs r1, #0xc0
	lsls r1, r1, #1
	subs r1, r1, r0
	str r1, [sp, #8]
	ldr r7, [sp, #4]
	adds r7, #0x29
	ldrb r0, [r7]
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x10]
	ldr r4, _08032FBC @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	str r0, [sp, #0xc]
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r2, #0
	ldrsh r1, [r4, r2]
	mov sb, r1
	rsbs r1, r1, #0
	lsls r1, r1, #4
	mov sl, r1
	mov r0, sl
	adds r1, r6, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	lsls r0, r0, #4
	mov sb, r0
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [sp, #0xc]
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldr r1, [sp, #0x10]
	adds r1, #1
	movs r2, #1
	ands r1, r2
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r0, sl
	ldr r1, [sp, #8]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	ldr r1, [sp, #8]
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x10]
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r3, _08032FC0 @ =gUnknown_0849B6C8
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0x40
	bl sub_0801BEBC
	movs r5, #0xd6
	lsls r5, r5, #2
	ldr r6, _08032FC4 @ =gUnknown_0849B6D6
	str r4, [sp]
	movs r0, #0
	movs r1, #0x60
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801BEFC
	movs r1, #0xa4
	lsls r1, r1, #2
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801BEFC
	ldr r2, _08032FC8 @ =gUnknown_03002EE0
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08032FE8
	ldrb r0, [r7]
	cmp r0, #0
	beq _08032FCC
	bl sub_0803BD60
	b _08032FD0
	.align 2, 0
_08032FBC: .4byte gUnknown_0808F100
_08032FC0: .4byte gUnknown_0849B6C8
_08032FC4: .4byte gUnknown_0849B6D6
_08032FC8: .4byte gUnknown_03002EE0
_08032FCC:
	bl sub_0803BD54
_08032FD0:
	ldr r0, [sp, #4]
	bl Proc_Break
	ldr r0, _08032FE4 @ =gUnknown_0849B6B0
	bl Proc_Find
	movs r1, #0
	str r1, [r0, #0x58]
	b _0803301E
	.align 2, 0
_08032FE4: .4byte gUnknown_0849B6B0
_08032FE8:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08032FF6
	ldrb r0, [r7]
	subs r0, #1
	strb r0, [r7]
_08032FF6:
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08033008
	ldrb r0, [r7]
	adds r0, #1
	strb r0, [r7]
_08033008:
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	strb r0, [r7]
	ldr r1, [sp, #4]
	ldr r0, [r1, #0x2c]
	adds r0, #1
	movs r1, #0x1f
	ands r0, r1
	ldr r2, [sp, #4]
	str r0, [r2, #0x2c]
_0803301E:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

