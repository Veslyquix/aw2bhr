	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080485C4
sub_080485C4: @ 0x080485C4
	push {lr}
	movs r0, #0x21
	bl sub_0803CBD8
	cmp r0, #0
	bne _080485D4
	movs r0, #0
	b _080485D6
_080485D4:
	movs r0, #1
_080485D6:
	pop {r1}
	bx r1
	.align 2, 0

