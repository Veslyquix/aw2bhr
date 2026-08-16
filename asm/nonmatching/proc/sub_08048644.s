	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048644
sub_08048644: @ 0x08048644
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r7, _08048790 @ =gUnknown_03004008
	ldr r0, [r7]
	movs r1, #0x40
	bl DivRem
	movs r1, #0x40
	mov sb, r1
	subs r0, r1, r0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r5, r0, #0
	lsls r5, r5, #1
	ldr r2, _08048794 @ =gUnknown_0823E550
	adds r5, r5, r2
	movs r0, #0xb8
	lsls r0, r0, #2
	mov sl, r0
	ldr r0, [r7]
	movs r1, #0x40
	bl DivRem
	mov r1, sb
	subs r0, r1, r0
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
	mov r1, sl
	bl ApplyPaletteExt
	ldr r0, [r7]
	movs r1, #0x40
	bl DivRem
	mov r2, sb
	subs r0, r2, r0
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	subs r4, r4, r0
	lsls r4, r4, #1
	add r4, sl
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r0, [r7]
	movs r1, #0x40
	bl DivRem
	mov r1, sb
	subs r1, r1, r0
	mov sb, r1
	mov r0, sb
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	adds r2, r0, #0
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x10
	ldr r0, _08048794 @ =gUnknown_0823E550
	adds r1, r4, #0
	bl ApplyPaletteExt
	adds r6, #8
	ldr r0, _08048798 @ =0x000001FF
	ands r6, r0
	movs r0, #0xff
	mov r2, r8
	ands r2, r0
	mov r8, r2
	ldr r3, _0804879C @ =gUnknown_08615C4E
	ldr r0, _080487A0 @ =0x0000745D
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	bl PutSprite
	ldr r4, _080487A4 @ =gUnknown_084C30F8
	ldr r1, [r4]
	ldr r2, _080487A8 @ =0x00000836
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #2
	bls _0804877E
	ldrh r0, [r1, #0x20]
	cmp r0, #0
	beq _08048740
	movs r0, #0
	str r0, [sp]
	movs r0, #0x43
	movs r1, #0x38
	movs r2, #0x30
	movs r3, #0
	bl sub_0801F34C
_08048740:
	ldr r1, _080487AC @ =gUnknown_02028E1C
	ldr r0, [r4]
	ldrh r0, [r0, #0x20]
	adds r0, #3
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _08048760
	movs r0, #0
	str r0, [sp]
	movs r0, #0x44
	movs r1, #0x38
	movs r2, #0x68
	movs r3, #0
	bl sub_0801F34C
_08048760:
	ldrh r0, [r7]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _080487B0 @ =gUnknown_08239F84
	adds r0, r0, r1
	movs r1, #0xa6
	lsls r1, r1, #2
	movs r2, #2
	bl ApplyPaletteExt
_0804877E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048790: .4byte gUnknown_03004008
_08048794: .4byte gUnknown_0823E550
_08048798: .4byte 0x000001FF
_0804879C: .4byte gUnknown_08615C4E
_080487A0: .4byte 0x0000745D
_080487A4: .4byte gUnknown_084C30F8
_080487A8: .4byte 0x00000836
_080487AC: .4byte gUnknown_02028E1C
_080487B0: .4byte gUnknown_08239F84

