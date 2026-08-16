	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072130
sub_08072130: @ 0x08072130
	push {lr}
	adds r2, r0, #0
	ldr r3, _08072144 @ =sub_080723DC
	movs r0, #3
	movs r1, #8
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_08072144: .4byte sub_080723DC

