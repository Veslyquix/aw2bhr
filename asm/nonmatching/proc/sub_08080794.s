	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08080794
sub_08080794: @ 0x08080794
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r2, _08080840 @ =0x000011CA
	movs r0, #1
	str r0, [sp]
	movs r0, #0xa8
	movs r1, #0xa0
	movs r3, #2
	bl sub_08043C28
	movs r0, #0
	mov r8, r0
	ldr r0, [r5, #0x58]
	cmp r8, r0
	blt _080807BE
	b _08080A26
_080807BE:
	adds r7, r5, #0
	adds r7, #0x4c
	movs r1, #0xc
	str r1, [sp, #4]
	ldr r2, _08080844 @ =0x0000030A
	str r2, [sp, #8]
	movs r3, #0
	mov sb, r3
_080807CE:
	movs r1, #0
	ldrsh r0, [r7, r1]
	cmp r0, sb
	bge _080807D8
	b _080809D8
_080807D8:
	ldr r2, [sp, #4]
	cmp r0, r2
	blt _080807E0
	b _080809DE
_080807E0:
	mov r0, r8
	movs r1, #4
	bl DivRem
	cmp r0, #0
	bne _08080850
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #0
	movs r1, #0xf0
	subs r2, #0x2c
	bl sub_08074234
	adds r4, r0, #0
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #1
	movs r1, #0xf0
	subs r2, #0x2c
	bl sub_08074234
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	bl Div
	str r0, [r5, #0x34]
	movs r1, #0x40
	str r1, [r5, #0x38]
	ldr r1, _08080848 @ =gUnknown_030059A0
	add r1, r8
	ldrb r2, [r1]
	ldr r3, _0808084C @ =gUnknown_030058D0
	ldr r1, [r3]
	adds r1, r1, r2
	cmp r0, r1
	blt _0808083E
	b _080809BA
_0808083E:
	b _08080928
	.align 2, 0
_08080840: .4byte 0x000011CA
_08080844: .4byte 0x0000030A
_08080848: .4byte gUnknown_030059A0
_0808084C: .4byte gUnknown_030058D0
_08080850:
	mov r0, r8
	movs r1, #4
	bl DivRem
	cmp r0, #1
	bne _080808C8
	ldr r1, _080808C0 @ =gUnknown_030058D0
	mov sl, r1
	ldr r0, _080808C4 @ =gUnknown_030059A0
	mov r2, r8
	adds r6, r2, r0
	ldrb r1, [r6]
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r5, #0x34]
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #0
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r2, #0xa0
	bl sub_08074234
	adds r4, r0, #0
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #1
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r2, #0xa0
	bl sub_08074234
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	bl Div
	str r0, [r5, #0x38]
	cmp r0, #0x40
	bgt _080808B6
	b _080809BA
_080808B6:
	ldrb r0, [r6]
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	b _08080928
	.align 2, 0
_080808C0: .4byte gUnknown_030058D0
_080808C4: .4byte gUnknown_030059A0
_080808C8:
	mov r0, r8
	movs r1, #4
	bl DivRem
	cmp r0, #2
	bne _08080944
	movs r1, #0
	ldrsh r3, [r7, r1]
	mov r2, sb
	subs r3, r3, r2
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r2, #0xf0
	bl sub_08074234
	adds r4, r0, #0
	movs r1, #0
	ldrsh r3, [r7, r1]
	mov r2, sb
	subs r3, r3, r2
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0x20
	rsbs r1, r1, #0
	movs r2, #0xf0
	bl sub_08074234
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	bl Div
	str r0, [r5, #0x34]
	movs r1, #0x40
	str r1, [r5, #0x38]
	ldr r1, _08080938 @ =gUnknown_030059A0
	add r1, r8
	ldrb r2, [r1]
	ldr r3, _0808093C @ =gUnknown_030058D0
	ldr r1, [r3]
	adds r1, r1, r2
	cmp r0, r1
	ble _080809BA
_08080928:
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _08080940 @ =gUnknown_0848B6E6
	bl sub_0801BEBC
	b _080809BA
	.align 2, 0
_08080938: .4byte gUnknown_030059A0
_0808093C: .4byte gUnknown_030058D0
_08080940: .4byte gUnknown_0848B6E6
_08080944:
	mov r0, r8
	movs r1, #4
	bl DivRem
	cmp r0, #3
	bne _080809BA
	ldr r1, _080809CC @ =gUnknown_030058D0
	mov sl, r1
	ldr r0, _080809D0 @ =gUnknown_030059A0
	mov r2, r8
	adds r6, r2, r0
	ldrb r1, [r6]
	mov r3, sl
	ldr r0, [r3]
	adds r0, r0, r1
	str r0, [r5, #0x34]
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #0
	movs r1, #0xa0
	subs r2, #0x2c
	bl sub_08074234
	adds r4, r0, #0
	movs r0, #0
	ldrsh r3, [r7, r0]
	mov r1, sb
	subs r3, r3, r1
	movs r2, #0xc
	str r2, [sp]
	movs r0, #0
	movs r1, #0xa0
	subs r2, #0x2c
	bl sub_08074234
	lsls r0, r0, #1
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #3
	bl Div
	str r0, [r5, #0x38]
	cmp r0, #0x3f
	bgt _080809BA
	ldrb r0, [r6]
	mov r3, sl
	ldr r1, [r3]
	adds r1, r1, r0
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _080809D4 @ =gUnknown_0848B6E6
	bl sub_0801BEBC
_080809BA:
	ldr r1, [r5, #0x34]
	ldr r2, [r5, #0x38]
	ldr r3, [sp, #8]
	str r3, [sp]
	movs r0, #0
	ldr r3, _080809D4 @ =gUnknown_0848B6E6
	bl sub_0801BEBC
	b _08080A0A
	.align 2, 0
_080809CC: .4byte gUnknown_030058D0
_080809D0: .4byte gUnknown_030059A0
_080809D4: .4byte gUnknown_0848B6E6
_080809D8:
	ldr r1, [sp, #4]
	cmp r0, r1
	blt _08080A0A
_080809DE:
	movs r2, #0
	ldrsh r0, [r7, r2]
	ldr r3, [sp, #4]
	cmp r0, r3
	bne _080809EE
	ldr r0, _08080A40 @ =0x000001DD
	bl sub_0803B4DC
_080809EE:
	ldr r0, _08080A44 @ =gUnknown_030059A0
	add r0, r8
	ldrb r0, [r0]
	ldr r2, _08080A48 @ =gUnknown_030058D0
	ldr r1, [r2]
	adds r1, r1, r0
	ldr r0, _08080A4C @ =0x0000030A
	add r0, sb
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	ldr r3, _08080A50 @ =gUnknown_0848B6E6
	bl sub_0801BEBC
_08080A0A:
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #4]
	ldr r0, [sp, #8]
	adds r0, #8
	str r0, [sp, #8]
	movs r1, #8
	add sb, r1
	movs r2, #1
	add r8, r2
	ldr r0, [r5, #0x58]
	cmp r8, r0
	bge _08080A26
	b _080807CE
_08080A26:
	adds r2, r5, #0
	adds r2, #0x4c
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r5, #0x58]
	lsls r0, r0, #3
	adds r0, #0xc
	cmp r1, r0
	bge _08080A54
	ldrh r0, [r2]
	adds r0, #1
	strh r0, [r2]
	b _08080A5E
	.align 2, 0
_08080A40: .4byte 0x000001DD
_08080A44: .4byte gUnknown_030059A0
_08080A48: .4byte gUnknown_030058D0
_08080A4C: .4byte 0x0000030A
_08080A50: .4byte gUnknown_0848B6E6
_08080A54:
	movs r0, #0
	strh r0, [r2]
	adds r0, r5, #0
	bl Proc_Break
_08080A5E:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

