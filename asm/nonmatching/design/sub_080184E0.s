	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080184E0
sub_080184E0: @ 0x080184E0
	ldr r1, _080184E8 @ =sub_080184D8
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_080184E8: .4byte sub_080184D8

