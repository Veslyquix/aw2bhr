	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067690
sub_08067690: @ 0x08067690
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r3, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _080676BE
	ldr r0, [r4, #0x38]
	adds r0, #3
	str r0, [r4, #0x38]
	movs r1, #2
	str r1, [r4, #0x34]
	ldr r1, [r4, #0x2c]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [r4, #0x30]
	cmp r0, #0
	bne _080676BE
	str r3, [r4, #0x38]
	movs r0, #0
	ldrsb r0, [r1, r0]
	str r0, [r4, #0x30]
_080676BE:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080676EC
	subs r0, #1
	str r0, [r4, #0x34]
	ldr r2, _080676E8 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _08067750
	.align 2, 0
_080676E8: .4byte gDispIo
_080676EC:
	ldr r1, [r4, #0x38]
	movs r0, #1
	ands r0, r1
	adds r5, r1, #0
	cmp r0, #0
	beq _08067710
	movs r3, #0
	ldr r2, _0806770C @ =gDispIo
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	b _08067720
	.align 2, 0
_0806770C: .4byte gDispIo
_08067710:
	movs r3, #1
	ldr r2, _08067758 @ =gDispIo
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
_08067720:
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r3, #0
	ldr r2, [r4, #0x2c]
	adds r2, r5, r2
	movs r1, #1
	ldrsb r1, [r2, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrb r2, [r2, #2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_08072C40
	ldr r0, [r4, #0x30]
	subs r0, #1
	str r0, [r4, #0x30]
_08067750:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067758: .4byte gDispIo

