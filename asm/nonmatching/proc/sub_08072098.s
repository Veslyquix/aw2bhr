	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072098
sub_08072098: @ 0x08072098
	push {lr}
	adds r2, r0, #0
	ldr r3, _080720AC @ =sub_080723DC
	movs r0, #1
	movs r1, #0x20
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_080720AC: .4byte sub_080723DC

