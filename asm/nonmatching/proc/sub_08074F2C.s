	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074F2C
sub_08074F2C: @ 0x08074F2C
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
	ldr r3, [r7, #0x34]
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r1, #8
	mov r2, sb
	bl sub_08074234
	mov sl, r0
	ldr r4, _08074FFC @ =gUnknown_0808F100
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
	ldrh r1, [r7, #0x2a]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	ldrh r0, [r7, #0x2a]
	lsls r0, r0, #9
	orrs r1, r0
	ldrh r0, [r7, #0x2e]
	mov r2, sb
	orrs r2, r0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, _08075000 @ =gUnknown_081CC4E8
	ldr r4, _08075004 @ =gUnknown_0861433C
	ldrh r0, [r7, #0x30]
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEFC
	cmp sl, sb
	bne _08074FE4
	movs r0, #0
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl Proc_Break
_08074FE4:
	ldr r0, [r7, #0x34]
	adds r0, #1
	str r0, [r7, #0x34]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074FFC: .4byte gUnknown_0808F100
_08075000: .4byte gUnknown_081CC4E8
_08075004: .4byte gUnknown_0861433C

