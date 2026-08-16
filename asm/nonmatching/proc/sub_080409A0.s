	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080409A0
sub_080409A0: @ 0x080409A0
	push {lr}
	movs r1, #0x2c
	ldrsh r2, [r0, r1]
	movs r3, #0x30
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_0802909C
	pop {r0}
	bx r0

