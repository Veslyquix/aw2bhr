	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08044BB0
sub_08044BB0: @ 0x08044BB0
	push {r4, r5, r6, r7, lr}
	ldr r2, _08044C00 @ =gUnknown_08091390
	ldr r1, [r2]
	movs r0, #0
	str r0, [r1]
	adds r7, r2, #0
	ldr r1, _08044C04 @ =gUnknown_03005948
	movs r2, #0
	adds r0, r1, #4
_08044BC2:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _08044BC2
	movs r5, #0
	ldr r1, _08044C08 @ =gUnknown_084A08D0
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08044C3A
	ldr r6, _08044C04 @ =gUnknown_03005948
	adds r4, r1, #0
_08044BD8:
	ldrb r3, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bge _08044C10
	ldr r2, [r7]
	ldr r1, [r2]
	adds r0, r1, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _08044C32
	ldr r0, _08044C0C @ =gUnknown_03005958
	adds r0, r1, r0
	movs r1, #0x7f
	ands r1, r3
	strb r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
	b _08044C32
	.align 2, 0
_08044C00: .4byte gUnknown_08091390
_08044C04: .4byte gUnknown_03005948
_08044C08: .4byte gUnknown_084A08D0
_08044C0C: .4byte gUnknown_03005958
_08044C10:
	ldrb r0, [r4]
	bl sub_0803CAD4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08044C32
	ldr r0, _08044C40 @ =gUnknown_030058E0
	adds r0, r5, r0
	ldrb r1, [r4]
	strb r1, [r0]
	adds r5, #1
	ldr r0, [r7]
	ldr r1, [r0]
	adds r1, r1, r6
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08044C32:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0xff
	bne _08044BD8
_08044C3A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08044C40: .4byte gUnknown_030058E0

