	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0806CA98
sub_0806CA98: @ 0x0806CA98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0806CB2C @ =gUnknown_08581CB8
	bl sub_08012C58
	ldr r5, _0806CB30 @ =gUnknown_030030CC
	ldrb r0, [r5]
	movs r3, #8
	rsbs r3, r3, #0
	ands r3, r0
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #1]
	ldr r2, _0806CB34 @ =gUnknown_03002B6C
	ldrb r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x40
	orrs r3, r0
	strb r3, [r5]
	bl sub_0801237C
	bl sub_08012358
	bl sub_08063994
	ldr r0, _0806CB38 @ =gUnknown_08190B68
	movs r4, #0x80
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0xa0
	bl sub_08013618
	ldr r0, _0806CB3C @ =gUnknown_0818E164
	movs r1, #0
	adds r2, r4, #0
	bl sub_08013618
	ldr r0, _0806CB40 @ =gUnknown_08186F4C
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_08011CAC
	ldr r0, _0806CB44 @ =gUnknown_0818DA8C
	ldr r1, _0806CB48 @ =0x0600D800
	bl sub_08011CAC
	bl sub_0806CC64
	movs r0, #0x7f
	str r0, [r6, #0x30]
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	ldr r0, [r6, #0x34]
	cmp r0, #0
	beq _0806CB4C
	movs r0, #0
	movs r1, #0x40
	movs r2, #0
	bl sub_08072C40
	b _0806CB54
	.align 2, 0
_0806CB2C: .4byte gUnknown_08581CB8
_0806CB30: .4byte gUnknown_030030CC
_0806CB34: .4byte gUnknown_03002B6C
_0806CB38: .4byte gUnknown_08190B68
_0806CB3C: .4byte gUnknown_0818E164
_0806CB40: .4byte gUnknown_08186F4C
_0806CB44: .4byte gUnknown_0818DA8C
_0806CB48: .4byte 0x0600D800
_0806CB4C:
	adds r0, r6, #0
	movs r1, #0
	bl Proc_Goto
_0806CB54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

