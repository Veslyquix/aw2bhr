	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080609B8
sub_080609B8: @ 0x080609B8
	push {lr}
	movs r0, #2
	bl sub_08060ED4
	cmp r0, #0
	beq _08060A14
	movs r0, #7
	bl sub_08057FA8
	adds r2, r0, #0
	ldr r1, _080609D8 @ =gUnknown_030046D4
	ldr r0, [r1]
	cmp r0, #0
	bne _080609DC
	movs r2, #0x64
	b _080609E8
	.align 2, 0
_080609D8: .4byte gUnknown_030046D4
_080609DC:
	movs r0, #0x64
	muls r0, r2, r0
	ldr r1, [r1]
	bl __divsi3
	adds r2, r0, #0
_080609E8:
	ldr r0, _080609FC @ =gUnknown_030046B8
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08060A04
	ldr r0, _08060A00 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r0, [r0, #5]
	b _08060A0A
	.align 2, 0
_080609FC: .4byte gUnknown_030046B8
_08060A00: .4byte gUnknown_085766E0
_08060A04:
	ldr r0, _08060A18 @ =gUnknown_085766E0
	ldr r0, [r0]
	ldrb r0, [r0, #6]
_08060A0A:
	cmp r2, r0
	bge _08060A14
	ldr r1, _08060A1C @ =gUnknown_030046C0
	movs r0, #7
	strb r0, [r1, #6]
_08060A14:
	pop {r0}
	bx r0
	.align 2, 0
_08060A18: .4byte gUnknown_085766E0
_08060A1C: .4byte gUnknown_030046C0

