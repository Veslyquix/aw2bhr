	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048158
sub_08048158: @ 0x08048158
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x22
	ldrb r0, [r1]
	cmp r0, #0x1d
	bls _08048174
	movs r0, #0
	strb r0, [r1]
_08048174:
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldrb r0, [r5, #0x1e]
	cmp r0, #1
	beq _080481A8
	cmp r0, #1
	bgt _0804818A
	cmp r0, #0
	beq _08048194
	b _080481E8
_0804818A:
	cmp r0, #2
	beq _080481BC
	cmp r0, #3
	beq _080481D8
	b _080481E8
_08048194:
	ldr r3, _080481A0 @ =gUnknown_08615C4E
	ldr r0, _080481A4 @ =0x000055CE
	str r0, [sp]
	movs r0, #0
	movs r1, #0x28
	b _080481C6
	.align 2, 0
_080481A0: .4byte gUnknown_08615C4E
_080481A4: .4byte 0x000055CE
_080481A8:
	ldr r3, _080481B4 @ =gUnknown_0848B6C6
	ldr r0, _080481B8 @ =0x000055E2
	str r0, [sp]
	movs r0, #0
	movs r1, #0x70
	b _080481C6
	.align 2, 0
_080481B4: .4byte gUnknown_0848B6C6
_080481B8: .4byte 0x000055E2
_080481BC:
	ldr r3, _080481D0 @ =gUnknown_08615C20
	ldr r0, _080481D4 @ =0x000055EA
	str r0, [sp]
	movs r0, #0
	movs r1, #0x88
_080481C6:
	movs r2, #0x28
	bl PutSprite
	b _080481E8
	.align 2, 0
_080481D0: .4byte gUnknown_08615C20
_080481D4: .4byte 0x000055EA
_080481D8:
	ldr r3, _080482C8 @ =gUnknown_08615C12
	ldr r0, _080482CC @ =0x000055FA
	str r0, [sp]
	movs r0, #0
	movs r1, #0xbb
	movs r2, #0x28
	bl PutSprite
_080481E8:
	adds r4, r5, #0
	adds r4, #0x20
	ldrb r0, [r4]
	cmp r0, #0
	beq _080481FC
	movs r0, #0x29
	movs r1, #0x38
	movs r2, #0xe
	bl sub_08043418
_080481FC:
	adds r2, r5, #0
	adds r2, #0x21
	ldrb r0, [r2]
	cmp r0, #5
	bls _08048218
	ldrb r1, [r4]
	subs r0, #6
	cmp r1, r0
	bge _08048218
	movs r0, #0x29
	movs r1, #0x97
	movs r2, #0xf
	bl sub_08043418
_08048218:
	ldr r0, _080482D0 @ =gUnknown_03004008
	mov r8, r0
	ldr r0, [r0]
	movs r1, #0x40
	bl DivRem
	movs r6, #0x40
	subs r0, r6, r0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r5, r0, #0
	lsls r5, r5, #1
	ldr r1, _080482D4 @ =gUnknown_0823E550
	mov sl, r1
	add r5, sl
	movs r0, #0xa8
	lsls r0, r0, #2
	mov sb, r0
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x40
	bl DivRem
	subs r0, r6, r0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r2, r0, #0
	movs r4, #0x10
	subs r2, r4, r2
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	mov r1, sb
	bl ApplyPaletteExt
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x40
	bl DivRem
	subs r0, r6, r0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	subs r4, r4, r0
	lsls r4, r4, #1
	add r4, sb
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	mov r1, r8
	ldr r0, [r1]
	movs r1, #0x40
	bl DivRem
	subs r6, r6, r0
	adds r0, r6, #0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	mov r0, sl
	adds r1, r4, #0
	bl ApplyPaletteExt
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080482C8: .4byte gUnknown_08615C12
_080482CC: .4byte 0x000055FA
_080482D0: .4byte gUnknown_03004008
_080482D4: .4byte gUnknown_0823E550

