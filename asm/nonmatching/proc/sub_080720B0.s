	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080720B0
sub_080720B0: @ 0x080720B0
	push {lr}
	adds r2, r0, #0
	ldr r3, _080720C4 @ =sub_080723DC
	movs r0, #1
	movs r1, #0x40
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_080720C4: .4byte sub_080723DC

