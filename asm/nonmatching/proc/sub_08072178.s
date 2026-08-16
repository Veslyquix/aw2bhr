	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072178
sub_08072178: @ 0x08072178
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807218C @ =sub_080723DC
	movs r0, #3
	movs r1, #0x40
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_0807218C: .4byte sub_080723DC

