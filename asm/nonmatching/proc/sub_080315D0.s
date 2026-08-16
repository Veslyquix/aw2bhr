	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080315D0
sub_080315D0: @ 0x080315D0
	push {lr}
	movs r0, #0xa
	movs r1, #5
	movs r2, #0xd
	movs r3, #0xa
	bl sub_0801A444
	movs r0, #0
	bl sub_08030F60
	pop {r0}
	bx r0

