	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080185BC
sub_080185BC: @ 0x080185BC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08014824
	cmp r0, #0
	bne _080185CA
	str r0, [r4, #8]
_080185CA:
	pop {r4}
	pop {r0}
	bx r0

