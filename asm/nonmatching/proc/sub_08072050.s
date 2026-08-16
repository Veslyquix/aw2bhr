	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072050
sub_08072050: @ 0x08072050
	push {lr}
	adds r2, r0, #0
	ldr r3, _08072064 @ =sub_080723DC
	movs r0, #1
	movs r1, #4
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_08072064: .4byte sub_080723DC

