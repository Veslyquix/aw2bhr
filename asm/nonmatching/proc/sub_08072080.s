	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072080
sub_08072080: @ 0x08072080
	push {lr}
	adds r2, r0, #0
	ldr r3, _08072094 @ =sub_080723DC
	movs r0, #1
	movs r1, #0x10
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_08072094: .4byte sub_080723DC

