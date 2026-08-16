	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0803405C
sub_0803405C: @ 0x0803405C
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
	ldr r3, [r7, #0x4c]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sb
	movs r2, #0x10
	bl sub_08074234
	mov sl, r0
	ldr r4, _08034110 @ =gUnknown_0808F100
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
	movs r0, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_0801E108
	movs r1, #0xc3
	lsls r1, r1, #5
	ldr r0, _08034114 @ =gUnknown_0849BC38
	ldrb r2, [r0, #2]
	mov r0, sb
	orrs r2, r0
	ldr r3, _08034118 @ =gUnknown_0849BC18
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r4, [r0]
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	adds r4, #1
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #0
	bl sub_0801BEFC
	ldr r0, [r7, #0x4c]
	cmp r0, #0xf
	bls _0803411C
	adds r0, r7, #0
	bl Proc_Break
	b _08034120
	.align 2, 0
_08034110: .4byte gUnknown_0808F100
_08034114: .4byte gUnknown_0849BC38
_08034118: .4byte gUnknown_0849BC18
_0803411C:
	adds r0, #1
	str r0, [r7, #0x4c]
_08034120:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

