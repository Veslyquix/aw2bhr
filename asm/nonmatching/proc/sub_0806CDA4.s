	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CDA4
sub_0806CDA4: @ 0x0806CDA4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	lsls r2, r2, #1
	ldr r3, [r7, #0x30]
	movs r0, #0x14
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	mov sb, r0
	ldr r4, _0806CE54 @ =gUnknown_0808F100
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
	mov r1, sb
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
	mov r1, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r2, #0xf8
	lsls r2, r2, #2
	ldr r3, _0806CE58 @ =gUnknown_08581D38
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0x38
	bl sub_0801BEFC
	ldr r0, [r7, #0x30]
	adds r0, #1
	str r0, [r7, #0x30]
	cmp r0, #0x14
	bne _0806CE44
	str r4, [r7, #0x30]
	adds r0, r7, #0
	bl Proc_Break
_0806CE44:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CE54: .4byte gUnknown_0808F100
_0806CE58: .4byte gUnknown_08581D38

