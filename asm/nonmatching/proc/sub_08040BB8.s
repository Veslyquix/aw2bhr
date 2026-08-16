	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040BB8
sub_08040BB8: @ 0x08040BB8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r5, #0x80
	lsls r5, r5, #1
	adds r7, r4, #0
	adds r7, #0x4c
	movs r0, #0
	ldrsh r3, [r7, r0]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r5, #0
	bl sub_08074234
	adds r6, r0, #0
	ldrh r0, [r4, #0x3c]
	ldr r1, _08040C80 @ =0x000001FF
	ands r1, r0
	movs r0, #0x3e
	ldrsh r2, [r4, r0]
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	ldr r0, [r4, #0x30]
	orrs r2, r5
	bl sub_0801C254
	ldr r4, _08040C84 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov r8, r0
	adds r1, r6, #0
	cmp r6, #0
	bne _08040C0E
	movs r1, #2
_08040C0E:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	movs r2, #0
	ldrsh r4, [r4, r2]
	rsbs r0, r4, #0
	lsls r0, r0, #4
	adds r1, r6, #0
	cmp r6, #0
	bne _08040C2A
	movs r1, #2
_08040C2A:
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r0, r4, #4
	adds r1, r6, #0
	cmp r6, #0
	bne _08040C3C
	movs r1, #2
_08040C3C:
	bl Div
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	adds r1, r6, #0
	cmp r1, #0
	bne _08040C4C
	movs r1, #2
_08040C4C:
	mov r0, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldrh r1, [r7]
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #9
	bgt _08040C72
	adds r0, r1, #1
	strh r0, [r7]
_08040C72:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040C80: .4byte 0x000001FF
_08040C84: .4byte gUnknown_0808F100

