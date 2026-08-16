	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08012A54
sub_08012A54: @ 0x08012A54
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	bl sub_0801BB00
	movs r0, #2
	movs r1, #2
	bl sub_0801BB10
	ldr r0, _08012A70 @ =sub_08012A24
	bl sub_08011AAC
	pop {r0}
	bx r0
	.align 2, 0
_08012A70: .4byte sub_08012A24

