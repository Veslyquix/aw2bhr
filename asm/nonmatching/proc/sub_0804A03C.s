	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A03C
sub_0804A03C: @ 0x0804A03C
	push {lr}
	movs r0, #0
	bl sub_0801A5B0
	pop {r0}
	bx r0

