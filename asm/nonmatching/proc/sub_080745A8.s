	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080745A8
sub_080745A8: @ 0x080745A8
	push {lr}
	movs r0, #1
	bl sub_08044094
	cmp r0, #0
	bne _080745B8
	movs r0, #0
	b _080745BA
_080745B8:
	movs r0, #1
_080745BA:
	pop {r1}
	bx r1
	.align 2, 0

