	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080783BC
sub_080783BC: @ 0x080783BC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r2, _080783FC @ =gUnknown_0202FDFC
	adds r0, r2, #0
	adds r0, #0x21
	ldrb r1, [r0]
	movs r3, #2
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080783F2
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080783F2
	movs r0, #0xb0
	lsls r0, r0, #1
	ldr r3, _08078400 @ =gUnknown_084BA210
	str r4, [sp]
	movs r1, #0xa0
	movs r2, #2
	bl sub_080785CC
_080783F2:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080783FC: .4byte gUnknown_0202FDFC
_08078400: .4byte gUnknown_084BA210

