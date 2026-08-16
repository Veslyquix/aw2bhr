	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08032DA0
sub_08032DA0: @ 0x08032DA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	ldr r3, [r7, #0x2c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	mov r2, sb
	bl sub_08074234
	mov sl, r0
	ldr r4, _08032E68 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #4
	mov r8, r1
	mov r0, r8
	mov r1, sb
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r0, #0
	ldrsh r4, [r4, r0]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	mov r1, sl
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r4, r4, #4
	adds r0, r4, #0
	mov r1, sb
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	mov r1, sl
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r2, #0xa0
	lsls r2, r2, #1
	ldr r3, _08032E6C @ =gUnknown_0849B6C8
	movs r6, #0
	str r6, [sp]
	movs r0, #0
	movs r1, #0x78
	bl sub_0801BEFC
	movs r4, #0xb0
	lsls r4, r4, #1
	ldr r5, _08032E70 @ =gUnknown_0849B6D6
	str r6, [sp]
	movs r0, #0
	movs r1, #0x70
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0801BEFC
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	movs r1, #0xa0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0801BEFC
	ldr r0, [r7, #0x2c]
	cmp r0, #0xf
	ble _08032E74
	str r6, [r7, #0x2c]
	adds r0, r7, #0
	bl Proc_Break
	b _08032E78
	.align 2, 0
_08032E68: .4byte gUnknown_0808F100
_08032E6C: .4byte gUnknown_0849B6C8
_08032E70: .4byte gUnknown_0849B6D6
_08032E74:
	adds r0, #1
	str r0, [r7, #0x2c]
_08032E78:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

