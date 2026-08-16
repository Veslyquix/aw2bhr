	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08024984
sub_08024984: @ 0x08024984
	push {lr}
	adds r3, r0, #0
	ldr r2, _080249B8 @ =gUnknown_085C77A0
	ldr r0, _080249BC @ =gUnknown_03003FC0
	ldrb r1, [r0, #2]
	movs r0, #0x5c
	muls r0, r1, r0
	adds r0, r0, r2
	adds r0, #0x58
	ldrb r1, [r0]
	cmp r1, #0
	beq _080249A4
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #8
	bne _080249C2
_080249A4:
	movs r0, #0xe0
	ands r0, r3
	cmp r0, #0
	beq _080249C0
	asrs r0, r0, #5
	bl sub_08042DE0
	adds r1, r0, #0
	b _080249C2
	.align 2, 0
_080249B8: .4byte gUnknown_085C77A0
_080249BC: .4byte gUnknown_03003FC0
_080249C0:
	movs r1, #0
_080249C2:
	adds r0, r1, #0
	pop {r1}
	bx r1

