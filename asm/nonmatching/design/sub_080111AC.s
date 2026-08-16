	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080111AC
sub_080111AC: @ 0x080111AC
	push {lr}
	ldr r0, _080111B8 @ =sub_080111BC
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_080111B8: .4byte sub_080111BC

