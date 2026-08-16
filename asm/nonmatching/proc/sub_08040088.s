	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08040088
sub_08040088: @ 0x08040088
	push {lr}
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_08029088
	pop {r0}
	bx r0

