	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08083EE0
sub_08083EE0: @ 0x08083EE0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08083EFA
	b _08084418
_08083EFA:
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sl, r0
	cmp r1, #0
	bgt _08083F0A
	b _0808432C
_08083F0A:
	adds r0, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r0, [sp, #4]
	cmp r1, #0
	bgt _08083F18
	b _080840EC
_08083F18:
	subs r0, #0x1c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #7
	ble _08083F26
	b _080840BE
_08083F26:
	ldr r0, [r7, #0x58]
	movs r1, #0x20
	bl DivRem
	cmp r0, #0xf
	bgt _08083FE2
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r1, r0, #0
	mov r0, r8
	movs r2, #0
	ldrsh r3, [r0, r2]
	movs r6, #8
	str r6, [sp]
	movs r0, #4
	movs r2, #0x80
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	movs r4, #0x64
	subs r4, r4, r0
	movs r0, #0x66
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #4
	adds r2, #0x54
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_08074234
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r1, #0xa0
	subs r1, r1, r0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #4
	movs r2, #0xd0
	bl sub_08074234
	str r0, [r7, #0x3c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	b _08084090
_08083FE2:
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	adds r1, r0, #0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r6, #8
	str r6, [sp]
	movs r0, #4
	movs r2, #0x80
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl sub_08074234
	movs r4, #0x64
	subs r4, r4, r0
	movs r1, #0x66
	adds r1, r1, r7
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #4
	adds r2, #0x54
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_08074234
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	movs r1, #0xa0
	subs r1, r1, r0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #4
	movs r2, #0xd0
	bl sub_08074234
	str r0, [r7, #0x3c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
_08084090:
	bl sub_08074234
	adds r4, r0, #0
	adds r4, #0x3c
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #4
	adds r2, #0x3c
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	bl sub_08074234
	str r0, [r7, #0x40]
	b _080842E0
_080840BE:
	movs r0, #0x80
	str r0, [r7, #0x2c]
	adds r4, r7, #0
	adds r4, #0x66
	movs r2, #0
	ldrsh r0, [r4, r2]
	movs r1, #2
	bl DivRem
	lsls r0, r0, #4
	adds r0, #0x54
	str r0, [r7, #0x30]
	movs r0, #0xd0
	str r0, [r7, #0x3c]
	movs r1, #0
	ldrsh r0, [r4, r1]
	movs r1, #2
	bl DivRem
	lsls r0, r0, #4
	adds r0, #0x3c
	str r0, [r7, #0x40]
	b _080842E0
_080840EC:
	adds r0, r7, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #7
	ble _080840FC
	b _080842C0
_080840FC:
	ldr r0, [r7, #0x58]
	movs r1, #0x20
	bl DivRem
	cmp r0, #0xf
	bgt _080841E4
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r1, r0, #0
	adds r1, #0x80
	mov r0, r8
	movs r2, #0
	ldrsh r3, [r0, r2]
	movs r6, #8
	str r6, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x2c]
	movs r0, #0x66
	adds r0, r0, r7
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r1, #2
	bl DivRem
	adds r4, r0, #0
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	lsls r4, r4, #4
	subs r0, #0x54
	subs r4, r4, r0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x64
	bl sub_08074234
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	movs r1, #0xd0
	subs r1, r1, r0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #4
	movs r2, #0xa0
	bl sub_08074234
	str r0, [r7, #0x3c]
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	adds r4, r0, #0
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	bl sub_08074234
	lsls r4, r4, #4
	adds r0, #0x3c
	adds r4, r4, r0
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x3c
	bl sub_08074234
	b _080842CE
_080841E4:
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	adds r1, r0, #0
	adds r1, #0x80
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	movs r6, #8
	str r6, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x2c]
	movs r1, #0x66
	adds r1, r1, r7
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	adds r4, r0, #0
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl sub_08074234
	lsls r4, r4, #4
	subs r0, #0x54
	subs r4, r4, r0
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x64
	bl sub_08074234
	str r0, [r7, #0x30]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	movs r1, #0xd0
	subs r1, r1, r0
	mov r2, r8
	movs r0, #0
	ldrsh r3, [r2, r0]
	str r6, [sp]
	movs r0, #4
	movs r2, #0xa0
	bl sub_08074234
	str r0, [r7, #0x3c]
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r1, #2
	bl DivRem
	adds r4, r0, #0
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
	bl sub_08074234
	lsls r4, r4, #4
	adds r0, #0x3c
	adds r4, r4, r0
	mov r0, r8
	movs r1, #0
	ldrsh r3, [r0, r1]
	str r6, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x3c
	bl sub_08074234
	b _080842CE
_080842C0:
	movs r0, #0
	str r0, [r7, #0x2c]
	movs r0, #0x64
	str r0, [r7, #0x30]
	movs r0, #0xa0
	str r0, [r7, #0x3c]
	movs r0, #0x3c
_080842CE:
	str r0, [r7, #0x40]
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #8
	bne _080842E0
	movs r0, #0
	mov r2, sl
	strh r0, [r2]
_080842E0:
	ldr r1, [r7, #0x2c]
	ldr r4, _08084328 @ =0x000001FF
	ands r1, r4
	ldr r2, [r7, #0x30]
	movs r5, #0xff
	ands r2, r5
	movs r6, #0
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r1, [r7, #0x3c]
	ands r1, r4
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	ldr r2, [r7, #0x40]
	ands r2, r5
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #8
	beq _0808431C
	b _08084530
_0808431C:
	adds r0, r7, #0
	adds r0, #0x4e
	strh r6, [r0]
	ldr r0, [sp, #4]
	strh r6, [r0]
	b _08084530
	.align 2, 0
_08084328: .4byte 0x000001FF
_0808432C:
	adds r6, r7, #0
	adds r6, #0x4c
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #7
	bgt _080843DA
	ldr r0, [r7, #0x58]
	movs r1, #0x20
	bl DivRem
	cmp r0, #0xf
	bgt _08084384
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	adds r1, r0, #0
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	b _080843C2
_08084384:
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r5, #0x10
	str r5, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	adds r1, r0, #0
	movs r2, #0
	ldrsh r3, [r6, r2]
	movs r4, #8
	str r4, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
_080843C2:
	bl sub_08074234
	adds r1, r0, #0
	movs r0, #0
	ldrsh r3, [r6, r0]
	str r4, [sp]
	movs r0, #4
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x30]
	b _080843E0
_080843DA:
	movs r0, #0
	str r0, [r7, #0x30]
	str r0, [r7, #0x2c]
_080843E0:
	ldr r1, [r7, #0x2c]
	ldr r5, _08084414 @ =0x000001FF
	ands r1, r5
	ldr r0, [r7, #0x30]
	movs r2, #0x64
	subs r2, r2, r0
	movs r6, #0xff
	ands r2, r6
	movs r4, #0
	str r4, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7, #0x2c]
	movs r1, #0xa0
	subs r1, r1, r0
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	ldr r2, [r7, #0x30]
	adds r2, #0x3c
	ands r2, r6
	str r4, [sp]
	b _080844EA
	.align 2, 0
_08084414: .4byte 0x000001FF
_08084418:
	ldr r0, [r7, #0x58]
	movs r1, #0x20
	bl DivRem
	cmp r0, #0xf
	bgt _08084452
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r4, #0x10
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	b _0808447E
_08084452:
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	str r0, [r7, #0x2c]
	ldr r0, [r7, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
_0808447E:
	bl sub_08074234
	str r0, [r7, #0x30]
	adds r0, r7, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r6, [r0, r1]
	cmp r6, #0
	beq _080844F8
	movs r2, #0x66
	adds r2, r2, r7
	mov r8, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #2
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #4
	ldr r0, [r7, #0x30]
	subs r0, #0x54
	subs r2, r2, r0
	movs r4, #0xff
	ands r2, r4
	ldr r1, [r7, #0x2c]
	adds r1, #0x80
	ldr r5, _080844F4 @ =0x000001FF
	ands r1, r5
	movs r6, #0
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	mov r2, r8
	movs r1, #0
	ldrsh r0, [r2, r1]
	movs r1, #2
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #4
	ldr r0, [r7, #0x30]
	adds r0, #0x3c
	adds r2, r2, r0
	ands r2, r4
	ldr r0, [r7, #0x2c]
	movs r1, #0xd0
	subs r1, r1, r0
	ands r1, r5
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	str r6, [sp]
_080844EA:
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	b _08084530
	.align 2, 0
_080844F4: .4byte 0x000001FF
_080844F8:
	ldr r1, [r7, #0x2c]
	ldr r4, _08084540 @ =0x000001FF
	ands r1, r4
	ldr r0, [r7, #0x30]
	movs r2, #0x64
	subs r2, r2, r0
	movs r5, #0xff
	ands r2, r5
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r0, [r7, #0x2c]
	movs r1, #0xa0
	subs r1, r1, r0
	ands r1, r4
	movs r0, #0xc0
	lsls r0, r0, #6
	orrs r1, r0
	ldr r2, [r7, #0x30]
	adds r2, #0x3c
	ands r2, r5
	str r6, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
_08084530:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08084540: .4byte 0x000001FF

