	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072160
sub_08072160: @ 0x08072160
	push {lr}
	adds r2, r0, #0
	ldr r3, _08072174 @ =sub_080723DC
	movs r0, #3
	movs r1, #0x20
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_08072174: .4byte sub_080723DC

