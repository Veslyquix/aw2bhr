	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805EF00
sub_0805EF00: @ 0x0805EF00
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _0805EF34 @ =gUnknown_03003F20
	ldr r6, [r0]
	adds r0, r6, #0
	bl sub_08059A0C
	ldr r2, _0805EF38 @ =gUnknown_085D5ABC
	ldr r0, _0805EF3C @ =gUnknown_030040D8
	ldr r0, [r0]
	ldrb r1, [r0]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #0xe]
	cmp r0, #1
	bls _0805EF44
	movs r0, #4
	bl sub_08057F00
	adds r2, r0, #0
	ldr r0, _0805EF40 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xc]
	movs r5, #1
	b _0805EF54
	.align 2, 0
_0805EF34: .4byte gUnknown_03003F20
_0805EF38: .4byte gUnknown_085D5ABC
_0805EF3C: .4byte gUnknown_030040D8
_0805EF40: .4byte gUnknown_085766E0
_0805EF44:
	movs r0, #5
	bl sub_08057F00
	adds r2, r0, #0
	ldr r0, _0805EF90 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r3, [r0, #0xc]
	movs r5, #2
_0805EF54:
	ldr r1, _0805EF94 @ =0xFFFF0000
	ldr r0, [sp, #4]
	ands r0, r1
	ldr r4, _0805EF98 @ =0x0000270F
	orrs r0, r4
	str r0, [sp, #4]
	add r0, sp, #4
	str r0, [sp]
	adds r0, r2, #0
	adds r1, r3, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_08059B4C
	add r0, sp, #4
	ldrh r0, [r0]
	cmp r0, r4
	bne _0805EF7C
	bl sub_0805F4F8
_0805EF7C:
	add r0, sp, #4
	bl sub_080591E4
	bl sub_0805F7B8
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805EF90: .4byte gUnknown_085766E0
_0805EF94: .4byte 0xFFFF0000
_0805EF98: .4byte 0x0000270F

