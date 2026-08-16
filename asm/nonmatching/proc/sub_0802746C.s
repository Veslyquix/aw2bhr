	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802746C
sub_0802746C: @ 0x0802746C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _08027548 @ =gUnknown_0808F100
	adds r0, r4, #0
	adds r0, #0x80
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	mov sb, r0
	adds r6, r7, #0
	adds r6, #0x64
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #2
	cmp r0, #0
	beq _08027498
	adds r1, r0, #0
_08027498:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov sl, r0
	movs r1, #0
	ldrsh r5, [r4, r1]
	rsbs r0, r5, #0
	lsls r2, r0, #4
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r1, #2
	adds r4, r6, #0
	cmp r0, #0
	beq _080274BC
	movs r0, #0
	ldrsh r1, [r4, r0]
_080274BC:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	lsls r2, r5, #4
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	cmp r0, #0
	beq _080274D6
	adds r1, r0, #0
_080274D6:
	adds r0, r2, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	cmp r0, #0
	beq _080274EC
	adds r1, r0, #0
_080274EC:
	mov r0, sb
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	mov r1, sl
	mov r2, r8
	adds r3, r5, #0
	bl sub_0801E108
	ldr r0, [r7, #0x50]
	ldr r1, [r7, #0x2c]
	ldr r2, _0802754C @ =0x000001FF
	ands r1, r2
	ldr r2, [r7, #0x30]
	movs r3, #0xff
	ands r2, r3
	movs r3, #0xc0
	lsls r3, r3, #2
	orrs r2, r3
	bl sub_0801C254
	movs r1, #0
	ldrsh r3, [r6, r1]
	ldr r2, _08027550 @ =0xFFFFFF00
	adds r0, r3, r2
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	subs r3, r3, r0
	adds r2, r3, r2
	cmp r2, #4
	bne _08027536
	movs r3, #0x80
	lsls r3, r3, #1
_08027536:
	strh r3, [r6]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027548: .4byte gUnknown_0808F100
_0802754C: .4byte 0x000001FF
_08027550: .4byte 0xFFFFFF00

