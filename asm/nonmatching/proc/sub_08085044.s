	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08085044
sub_08085044: @ 0x08085044
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x58]
	movs r1, #0x20
	bl DivRem
	cmp r0, #0xf
	bgt _08085084
	ldr r0, [r5, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r4, #0x10
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #8
	bl sub_08074234
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r4, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #4
	b _080850B0
_08085084:
	ldr r0, [r5, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	movs r4, #0x10
	str r4, [sp]
	movs r0, #1
	movs r1, #8
	movs r2, #0
	bl sub_08074234
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x58]
	movs r1, #0x10
	bl DivRem
	adds r3, r0, #0
	str r4, [sp]
	movs r0, #1
	movs r1, #4
	movs r2, #0
_080850B0:
	bl sub_08074234
	str r0, [r5, #0x30]
	adds r0, r5, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r0, [r5, #0x2c]
	subs r0, #4
	adds r1, r1, r0
	ldr r0, _0808510C @ =0x000001FF
	ands r1, r0
	ldr r0, [r5, #0x30]
	movs r2, #0x14
	subs r2, r2, r0
	movs r0, #0xff
	ands r2, r0
	movs r4, #1
	str r4, [sp]
	movs r0, #0x50
	movs r3, #0
	bl sub_0801F34C
	ldr r0, _08085110 @ =gUnknown_03005940
	ldr r0, [r0]
	cmp r0, #0
	beq _08085114
	cmp r0, #4
	beq _0808511E
	str r4, [sp]
	movs r0, #0x43
	movs r1, #0x64
	movs r2, #0x20
	movs r3, #0
	bl sub_0801F34C
	str r4, [sp]
	movs r0, #0x44
	movs r1, #0x64
	movs r2, #0x98
	b _08085126
	.align 2, 0
_0808510C: .4byte 0x000001FF
_08085110: .4byte gUnknown_03005940
_08085114:
	str r4, [sp]
	movs r0, #0x44
	movs r1, #0x64
	movs r2, #0x98
	b _08085126
_0808511E:
	str r4, [sp]
	movs r0, #0x43
	movs r1, #0xdc
	movs r2, #0x20
_08085126:
	movs r3, #0
	bl sub_0801F34C
	adds r0, r5, #0
	adds r0, #0x4e
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	blt _08085156
	ldr r0, [r5, #0x58]
	movs r1, #4
	bl Div
	movs r1, #0x10
	bl DivRem
	lsls r0, r0, #1
	ldr r1, _08085164 @ =gUnknown_08239F84
	adds r0, r0, r1
	movs r1, #0xa6
	lsls r1, r1, #2
	movs r2, #2
	bl sub_08013618
_08085156:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08085164: .4byte gUnknown_08239F84

