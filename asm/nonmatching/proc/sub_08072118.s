	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072118
sub_08072118: @ 0x08072118
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807212C @ =sub_080723DC
	movs r0, #3
	movs r1, #4
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_0807212C: .4byte sub_080723DC

