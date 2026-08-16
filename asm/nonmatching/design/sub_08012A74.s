	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012A74
sub_08012A74: @ 0x08012A74
	push {lr}
	ldr r0, _08012A80 @ =sub_08012A34
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_08012A80: .4byte sub_08012A34

