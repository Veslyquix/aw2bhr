	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08076BC4
sub_08076BC4: @ 0x08076BC4
	push {lr}
	sub sp, #4
	ldr r3, _08076BDC @ =gUnknown_084BA6D0
	str r0, [sp]
	movs r0, #0
	movs r1, #0x78
	movs r2, #0
	bl sub_080785CC
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08076BDC: .4byte gUnknown_084BA6D0

