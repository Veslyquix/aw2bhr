	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003B6C
sub_08003B6C: @ 0x08003B6C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_080129E0
	subs r4, r4, r5
	lsls r4, r4, #5
	adds r1, r4, #0
	bl DivRem
	asrs r0, r0, #5
	adds r0, r0, r5
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

