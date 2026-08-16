	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078588
sub_08078588: @ 0x08078588
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _080785A4
	ldr r0, _080785AC @ =gUnknown_03002F08
	movs r1, #0
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_08014BC0
	ldr r0, [r4, #0x54]
	bl sub_080193B0
_080785A4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080785AC: .4byte gUnknown_03002F08

