	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08072068
sub_08072068: @ 0x08072068
	push {lr}
	adds r2, r0, #0
	ldr r3, _0807207C @ =sub_080723DC
	movs r0, #1
	movs r1, #8
	bl sub_080722B8
	pop {r0}
	bx r0
	.align 2, 0
_0807207C: .4byte sub_080723DC

