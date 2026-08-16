	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08027B68
sub_08027B68: @ 0x08027B68
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	subs r0, #0x10
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x38]
	subs r0, #0x10
	str r0, [r4, #0x38]
	adds r6, r4, #0
	adds r6, #0x48
	ldrh r0, [r6]
	subs r0, #2
	strh r0, [r6]
	ldr r5, _08027C80 @ =gUnknown_0808F100
	movs r1, #0xff
	mov r8, r1
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldr r1, [r4, #0x34]
	cmp r1, #0
	bne _08027BA8
	movs r1, #2
_08027BA8:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	ldrh r1, [r6]
	mov r0, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r4, #0x38]
	cmp r1, #0
	bne _08027BCC
	movs r1, #2
_08027BCC:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sb, r0
	ldrh r1, [r6]
	mov r0, r8
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #4
	ldr r1, [r4, #0x34]
	cmp r1, #0
	bne _08027BEE
	movs r1, #2
_08027BEE:
	bl Div
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	ldrh r1, [r6]
	mov r0, r8
	ands r0, r1
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	ldr r1, [r4, #0x38]
	cmp r1, #0
	bne _08027C10
	movs r1, #2
_08027C10:
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r5, r4, #0
	adds r5, #0x6a
	movs r2, #0
	ldrsh r1, [r5, r2]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, sl
	mov r2, sb
	adds r3, r7, #0
	bl sub_0801E108
	ldr r1, [r4, #0x2c]
	ldr r0, _08027C84 @ =0x000001FF
	ands r1, r0
	movs r2, #0
	ldrsh r0, [r5, r2]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r4, #0x30]
	mov r0, r8
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, _08027C88 @ =gUnknown_08499E10
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [sp]
	movs r0, #0
	bl sub_0801BEFC
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _08027C6E
	adds r1, r4, #0
	adds r1, #0x64
	movs r0, #0x32
	strh r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08027C6E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027C80: .4byte gUnknown_0808F100
_08027C84: .4byte 0x000001FF
_08027C88: .4byte gUnknown_08499E10

