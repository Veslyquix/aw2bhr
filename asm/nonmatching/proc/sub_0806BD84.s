	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806BD84
sub_0806BD84: @ 0x0806BD84
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
	ldr r3, [r7, #0x58]
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	bl sub_08074234
	mov sb, r0
	ldr r4, _0806BE58 @ =gUnknown_0808F100
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
	movs r5, #0
	ldrsh r4, [r4, r5]
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
	ldr r1, [r7, #0x5c]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	ldr r1, [r7, #0x2c]
	subs r1, #4
	ldr r0, _0806BE5C @ =0x000001FF
	ands r1, r0
	ldr r0, [r7, #0x5c]
	lsls r0, r0, #9
	orrs r1, r0
	ldr r2, [r7, #0x30]
	subs r2, #8
	movs r0, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #2
	orrs r2, r0
	ldr r3, _0806BE60 @ =gUnknown_0816E174
	adds r4, r7, #0
	adds r4, #0x64
	movs r5, #0
	ldrsh r0, [r4, r5]
	str r0, [sp]
	movs r0, #1
	bl sub_0801BEFC
	ldr r0, [r7, #0x58]
	cmp r0, #5
	ble _0806BE68
	ldr r2, _0806BE64 @ =gUnknown_08499578
	ldr r1, [r7, #0x30]
	asrs r1, r1, #3
	lsls r1, r1, #5
	ldr r0, [r7, #0x2c]
	asrs r0, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, [r2]
	adds r0, r0, r1
	ldrh r1, [r4]
	bl sub_0806BD6C
	adds r0, r7, #0
	bl Proc_Break
	b _0806BE6C
	.align 2, 0
_0806BE58: .4byte gUnknown_0808F100
_0806BE5C: .4byte 0x000001FF
_0806BE60: .4byte gUnknown_0816E174
_0806BE64: .4byte gUnknown_08499578
_0806BE68:
	adds r0, #1
	str r0, [r7, #0x58]
_0806BE6C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

