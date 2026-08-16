	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076C64
sub_08076C64: @ 0x08076C64
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_0803866C
	cmp r0, #0
	beq _08076C80
	ldr r3, _08076C88 @ =gUnknown_084BA6D0
	str r4, [sp]
	movs r0, #0x50
	movs r1, #0x70
	movs r2, #0
	bl sub_080785CC
_08076C80:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076C88: .4byte gUnknown_084BA6D0

